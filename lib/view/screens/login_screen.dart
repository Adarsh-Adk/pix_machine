import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/entities/user_input.dart';
import '../../view_model/blocs/authentication_bloc/authentication_bloc.dart';
import '../../view_model/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../view_model/util/utility.dart';
import '../core/app_constants.dart';
import '../widgets/app_padding.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late Size size;
  bool isValidInput = false;
  late OutlineInputBorder border;
  late OutlineInputBorder errorBorder;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    border = OutlineInputBorder(
      borderRadius: AppConstants.borderRadius,
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.background,
      ),
    );
    errorBorder = OutlineInputBorder(
      borderRadius: AppConstants.borderRadius,
      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              state.map(
                  initial: (_) {},
                  loading: (_) {},
                  success: (response) {
                    context
                        .read<AuthenticationBloc>()
                        .add(const AuthenticationEvent.signedIn());
                    // context.pushNamed(CustomRouter.home);
                  },
                  failed: (failed) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(failed.error)));
                  });
            },
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppConstants.defaultPadding * 2),
                width: double.maxFinite,
                height: size.height / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    const AppPadding(
                      dividedBy: 2,
                    ),
                    Text(
                      "Please login to your account",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppConstants.defaultPadding * 2),
                height: size.height / 1.5,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: AppConstants.borderRadius * 2),
                child: Form(
                  key: formKey,
                  onChanged: () {
                    setState(() {
                      isValidInput = formKey.currentState?.validate() ?? false;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            labelText: "Username",
                            border: border,
                            enabledBorder: border,
                            focusedBorder: border,
                            disabledBorder: border,
                            errorBorder: errorBorder,
                            focusedErrorBorder: errorBorder),
                        validator: (value) {
                          if (!Utility.isValidEmail(value)) {
                            return "Username should not contain spaces, it should contain only numbers 0-9, and characters a-z, A-Z";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const AppPadding(),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.key_outlined),
                            labelText: "Password",
                            enabledBorder: border,
                            focusedBorder: border,
                            disabledBorder: border,
                            errorBorder: errorBorder,
                            focusedErrorBorder: errorBorder),
                        obscureText: true,
                        // validator: (value) {
                        //   if (!Utility.isValidPassword(value)) {
                        //     return "Passwords should not contain less than 5 characters, must contain 0-9, a-z, A-Z, @, !, ?, _";
                        //   }
                        //   return null;
                        // },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const AppPadding(multipliedBy: 2),
                      SizedBox(
                          width: double.maxFinite,
                          child: (isValidInput)
                              ? ElevatedButton(
                                  onPressed: () {
                                    final userInput = UserInput(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    context.read<SignInBloc>().add(
                                        SignInEvent.signIn(
                                            userInput: userInput));
                                  },
                                  child: const Text("Sign In"))
                              : ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Theme.of(context)
                                              .primaryColorLight
                                              .withOpacity(0.3))),
                                  onPressed: () {},
                                  child: const Text("Sign In")))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'custom_router.dart';
import 'model/services/shared_preference.dart';
import 'view/core/app_constants.dart';
import 'view/core/app_theme.dart';
import 'view_model/blocs/add_employee_bloc/add_employee_bloc.dart';
import 'view_model/blocs/authentication_bloc/authentication_bloc.dart';
import 'view_model/blocs/designation_bloc/designation_bloc.dart';
import 'view_model/blocs/employee_list_bloc/employee_list_bloc.dart';
import 'view_model/blocs/sign_in_bloc/sign_in_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(),
      ),
      BlocProvider<AuthenticationBloc>(
        create: (context) =>
            AuthenticationBloc()..add(const AuthenticationEvent.signedIn()),
      ),
      BlocProvider<DesignationBloc>(
        create: (context) => DesignationBloc(),
      ),
      BlocProvider<EmployeeListBloc>(
        create: (context) => EmployeeListBloc(),
      ),
      BlocProvider<AddEmployeeBloc>(
        create: (context) => AddEmployeeBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.when(authenticated: () {
          goRouter.go(CustomRouter.home);
        }, unAuthenticated: () {
          goRouter.go(CustomRouter.loginScreen);
        });
      },
      child: MaterialApp.router(
        title: AppConstants.appName,
        theme: AppTheme.light(),
        routerConfig: goRouter,
      ),
    );
  }
}

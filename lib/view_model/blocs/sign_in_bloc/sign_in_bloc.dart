import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/entities/user_input.dart';
import '../../../model/repositories/user_repository.dart';
import '../../../model/services/shared_preference.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState.initial()) {
    final userRepo = UserRepository();
    on<SignInEvent>((event, emit) async {
      await event.when(signIn: (userInput) async {
        emit(const SignInState.loading());
        try {
          final dataResponse = await userRepo.login(userInput);
          if (dataResponse.hasData) {
            log("dataResponsedate is ${dataResponse.data}");
            await SharedPreference.saveToken(dataResponse.data as String);
            emit(SignInState.success(token: dataResponse.data));
          } else {
            emit(SignInState.failed(
                error: dataResponse.error ?? "Error Occurred"));
          }
        } catch (e) {
          emit(const SignInState.failed(
              error: "Exception Occurred while signing in"));
        }
      }, signOut: () {
        emit(const SignInState.loading());
      });
    });
  }
}

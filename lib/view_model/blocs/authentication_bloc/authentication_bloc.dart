import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/repositories/employee_repository.dart';
import '../../../model/services/shared_preference.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.unAuthenticated()) {
    final employeeRepo = EmployeeRepository();
    on<AuthenticationEvent>((event, emit) async {
      await event.when(signedIn: () async {
        final response = await employeeRepo.getEmployees();

        if (response.hasError) {
          log("${response.error?.trim().toLowerCase()}");

          if (response.error
                  ?.trim()
                  .toLowerCase()
                  .contains("unauthenticated") ==
              true) {
            add(const AuthenticationEvent.signOut());
          }
        } else {
          emit(const AuthenticationState.authenticated());
        }
      }, signOut: () async {
        await SharedPreference.removeToken();
        emit(const AuthenticationState.unAuthenticated());
      });
    });
  }
}

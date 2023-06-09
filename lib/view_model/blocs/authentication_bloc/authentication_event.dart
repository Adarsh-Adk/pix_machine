part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signedIn() = _SignedIn;
  const factory AuthenticationEvent.signOut() = _SignOut;
}

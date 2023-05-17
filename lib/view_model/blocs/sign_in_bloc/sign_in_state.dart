part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = Initial;
  const factory SignInState.loading() = Loading;
  const factory SignInState.success({required String token}) = Success;
  const factory SignInState.failed({required String error}) = Failed;
}

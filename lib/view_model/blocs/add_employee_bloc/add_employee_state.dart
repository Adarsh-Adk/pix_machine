part of 'add_employee_bloc.dart';

@freezed
class AddEmployeeState with _$AddEmployeeState {
  const factory AddEmployeeState.initial() = _Initial;
  const factory AddEmployeeState.loading() = _Loading;
  const factory AddEmployeeState.success() = _Success;
  const factory AddEmployeeState.failed({required String error}) = _Failed;
}

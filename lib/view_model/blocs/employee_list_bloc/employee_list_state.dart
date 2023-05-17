part of 'employee_list_bloc.dart';

@freezed
class EmployeeListState with _$EmployeeListState {
  const factory EmployeeListState.initial() = _Initial;
  const factory EmployeeListState.loading() = _Loading;
  const factory EmployeeListState.success({required List<Employee> data}) =
      _Success;
  const factory EmployeeListState.failed({required String error}) = _Failed;
}

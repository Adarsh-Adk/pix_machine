part of 'employee_list_bloc.dart';

@freezed
class EmployeeListEvent with _$EmployeeListEvent {
  const factory EmployeeListEvent.fetch() = _Fetch;
}

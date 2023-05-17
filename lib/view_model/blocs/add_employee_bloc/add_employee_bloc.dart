import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/entities/employee_input.dart';
import '../../../model/repositories/employee_repository.dart';

part 'add_employee_bloc.freezed.dart';
part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  AddEmployeeBloc() : super(const AddEmployeeState.initial()) {
    final repo = EmployeeRepository();
    on<AddEmployeeEvent>((event, emit) async {
      await event.when(add: (add) async {
        emit(const AddEmployeeState.loading());
        // try {
        final response = await repo.addEmployee(input: add);
        if (response.hasData) {
          emit(const AddEmployeeState.success());
        } else {
          emit(AddEmployeeState.failed(
              error: response.error ?? "Error occurred while adding employee"));
        }
        // } catch (e) {
        //   emit(AddEmployeeState.failed(
        //       error: "Exception occurred while adding employee :$e"));
        // }
      });
    });
  }
}

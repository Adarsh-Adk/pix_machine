import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/entities/designation.dart';
import '../../../model/entities/employee.dart';
import '../../../model/entities/employee_response.dart';
import '../../../model/repositories/designation_repository.dart';
import '../../../model/repositories/employee_repository.dart';

part 'employee_list_bloc.freezed.dart';
part 'employee_list_event.dart';
part 'employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  EmployeeListBloc() : super(const EmployeeListState.initial()) {
    final employeeRepo = EmployeeRepository();
    final designationRepo = DesignationRepository();
    on<EmployeeListEvent>((event, emit) async {
      await event.when(fetch: () async {
        List<Employee> employeeList = [];
        List<Designation> designationList = designationRepo.designationList;
        try {
          if (designationList.isEmpty) {
            final response = await designationRepo.getDesignation();
            if (response.hasData) {
              designationList = response.data;
            }
          }
          final response = await employeeRepo.getEmployees();
          if (response.hasData) {
            List<EmployeeResponse> employeeResponseList = response.data;
            employeeList = employeeResponseList
                .map(
                  (e) => Employee(
                    email: e.email,
                    gender: e.gender,
                    profilePicture: e.profilePicture,
                    mobile: e.mobile,
                    firstName: e.firstName,
                    id: e.id,
                    status: e.status,
                    createdAt: e.createdAt,
                    dateOfBirth: e.dateOfBirth,
                    designation: designationList.firstWhere(
                        (element) => element.id == e.designationId,
                        orElse: () => Designation(id: e.designationId)),
                    joinDate: e.joinDate,
                    landline: e.landline,
                    lastName: e.lastName,
                    permanentAddress: e.permanentAddress,
                    presentAddress: e.presentAddress,
                    profileImage: e.profileImage,
                    resume: e.resume,
                    updatedAt: e.updatedAt,
                  ),
                )
                .toList();
            if (employeeList.isEmpty) {
              emit(const EmployeeListState.failed(error: "No data"));
            } else {
              emit(EmployeeListState.success(data: employeeList));
            }
          } else {
            emit(EmployeeListState.failed(
                error: response.error != null
                    ? "Error occurred ${response.error}"
                    : "Error occurred while fetching employee list"));
          }
        } catch (e) {
          emit(EmployeeListState.failed(
              error: "Exception occurred while fetching employee list :$e"));
        }
      });
    });
  }
}

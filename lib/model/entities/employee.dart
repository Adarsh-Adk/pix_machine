import 'package:freezed_annotation/freezed_annotation.dart';

import 'designation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Employee({
    final int? id,
    final String? firstName,
    final String? lastName,
    final String? joinDate,
    final String? dateOfBirth,
    final Designation? designation,
    final String? gender,
    final int? mobile,
    final int? landline,
    final String? email,
    final String? presentAddress,
    final String? permanentAddress,
    final String? profilePicture,
    final String? resume,
    final String? createdAt,
    final String? updatedAt,
    final String? status,
    final String? profileImage,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_input.freezed.dart';
part 'employee_input.g.dart';

@freezed
class EmployeeInput with _$EmployeeInput {
  const factory EmployeeInput({
    @JsonKey(name: "first_name")
        final String? firstName,
    @JsonKey(name: "last_name")
        final String? lastName,
    @JsonKey(name: "join_date")
        final String? joinDate,
    @JsonKey(name: "date_of_birth")
        final String? dateOfBirth,
    @JsonKey(name: "designation_id")
        final String? designationId,
    final String? gender,
    final String? email,
    final String? mobile,
    final String? landline,
    @JsonKey(name: "present_address")
        final String? presentAddress,
    @JsonKey(name: "permanent_address")
        final String? permanentAddress,
    final String? status,
    @JsonKey(includeFromJson: false, includeToJson: false, name: "profile_picture")
        final File? profilePicture,
    @JsonKey(includeFromJson: false, includeToJson: false)
        final File? resume,
  }) = _EmployeeInput;

  factory EmployeeInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInputFromJson(json);
}

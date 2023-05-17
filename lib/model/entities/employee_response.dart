import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_response.freezed.dart';
part 'employee_response.g.dart';

@freezed
class EmployeeResponse with _$EmployeeResponse {
  const factory EmployeeResponse({
    final int? id,
    @JsonKey(name: "first_name") final String? firstName,
    @JsonKey(name: "last_name") final String? lastName,
    @JsonKey(name: "join_date") final String? joinDate,
    @JsonKey(name: "date_of_birth") final String? dateOfBirth,
    @JsonKey(name: "designation_id") final int? designationId,
    final String? gender,
    final int? mobile,
    final int? landline,
    final String? email,
    @JsonKey(name: "present_address") final String? presentAddress,
    @JsonKey(name: "permanent_address") final String? permanentAddress,
    @JsonKey(name: "profile_picture") final String? profilePicture,
    final String? resume,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "updated_at") final String? updatedAt,
    final String? status,
    @JsonKey(name: "profile_image") final String? profileImage,
  }) = _EmployeeResponse;

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeResponseFromJson(json);
}

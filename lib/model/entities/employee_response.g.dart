// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeResponse _$$_EmployeeResponseFromJson(Map<String, dynamic> json) =>
    _$_EmployeeResponse(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      joinDate: json['join_date'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      designationId: json['designation_id'] as int?,
      gender: json['gender'] as String?,
      mobile: json['mobile'] as int?,
      landline: json['landline'] as int?,
      email: json['email'] as String?,
      presentAddress: json['present_address'] as String?,
      permanentAddress: json['permanent_address'] as String?,
      profilePicture: json['profile_picture'] as String?,
      resume: json['resume'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      status: json['status'] as String?,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$_EmployeeResponseToJson(_$_EmployeeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'join_date': instance.joinDate,
      'date_of_birth': instance.dateOfBirth,
      'designation_id': instance.designationId,
      'gender': instance.gender,
      'mobile': instance.mobile,
      'landline': instance.landline,
      'email': instance.email,
      'present_address': instance.presentAddress,
      'permanent_address': instance.permanentAddress,
      'profile_picture': instance.profilePicture,
      'resume': instance.resume,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status': instance.status,
      'profile_image': instance.profileImage,
    };

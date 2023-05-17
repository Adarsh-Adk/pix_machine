// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeInput _$$_EmployeeInputFromJson(Map<String, dynamic> json) =>
    _$_EmployeeInput(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      joinDate: json['join_date'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      designationId: json['designation_id'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      landline: json['landline'] as String?,
      presentAddress: json['present_address'] as String?,
      permanentAddress: json['permanent_address'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_EmployeeInputToJson(_$_EmployeeInput instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'join_date': instance.joinDate,
      'date_of_birth': instance.dateOfBirth,
      'designation_id': instance.designationId,
      'gender': instance.gender,
      'email': instance.email,
      'mobile': instance.mobile,
      'landline': instance.landline,
      'present_address': instance.presentAddress,
      'permanent_address': instance.permanentAddress,
      'status': instance.status,
    };

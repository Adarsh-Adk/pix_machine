// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      joinDate: json['joinDate'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      designation: json['designation'] == null
          ? null
          : Designation.fromJson(json['designation'] as Map<String, dynamic>),
      gender: json['gender'] as String?,
      mobile: json['mobile'] as int?,
      landline: json['landline'] as int?,
      email: json['email'] as String?,
      presentAddress: json['presentAddress'] as String?,
      permanentAddress: json['permanentAddress'] as String?,
      profilePicture: json['profilePicture'] as String?,
      resume: json['resume'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      status: json['status'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('joinDate', instance.joinDate);
  writeNotNull('dateOfBirth', instance.dateOfBirth);
  writeNotNull('designation', instance.designation?.toJson());
  writeNotNull('gender', instance.gender);
  writeNotNull('mobile', instance.mobile);
  writeNotNull('landline', instance.landline);
  writeNotNull('email', instance.email);
  writeNotNull('presentAddress', instance.presentAddress);
  writeNotNull('permanentAddress', instance.permanentAddress);
  writeNotNull('profilePicture', instance.profilePicture);
  writeNotNull('resume', instance.resume);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('status', instance.status);
  writeNotNull('profileImage', instance.profileImage);
  return val;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  int? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get joinDate => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  Designation? get designation => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  int? get mobile => throw _privateConstructorUsedError;
  int? get landline => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get presentAddress => throw _privateConstructorUsedError;
  String? get permanentAddress => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get resume => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String? joinDate,
      String? dateOfBirth,
      Designation? designation,
      String? gender,
      int? mobile,
      int? landline,
      String? email,
      String? presentAddress,
      String? permanentAddress,
      String? profilePicture,
      String? resume,
      String? createdAt,
      String? updatedAt,
      String? status,
      String? profileImage});

  $DesignationCopyWith<$Res>? get designation;
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? joinDate = freezed,
    Object? dateOfBirth = freezed,
    Object? designation = freezed,
    Object? gender = freezed,
    Object? mobile = freezed,
    Object? landline = freezed,
    Object? email = freezed,
    Object? presentAddress = freezed,
    Object? permanentAddress = freezed,
    Object? profilePicture = freezed,
    Object? resume = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? status = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as Designation?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
      landline: freezed == landline
          ? _value.landline
          : landline // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      presentAddress: freezed == presentAddress
          ? _value.presentAddress
          : presentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      permanentAddress: freezed == permanentAddress
          ? _value.permanentAddress
          : permanentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      resume: freezed == resume
          ? _value.resume
          : resume // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DesignationCopyWith<$Res>? get designation {
    if (_value.designation == null) {
      return null;
    }

    return $DesignationCopyWith<$Res>(_value.designation!, (value) {
      return _then(_value.copyWith(designation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$$_EmployeeCopyWith(
          _$_Employee value, $Res Function(_$_Employee) then) =
      __$$_EmployeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String? joinDate,
      String? dateOfBirth,
      Designation? designation,
      String? gender,
      int? mobile,
      int? landline,
      String? email,
      String? presentAddress,
      String? permanentAddress,
      String? profilePicture,
      String? resume,
      String? createdAt,
      String? updatedAt,
      String? status,
      String? profileImage});

  @override
  $DesignationCopyWith<$Res>? get designation;
}

/// @nodoc
class __$$_EmployeeCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$_Employee>
    implements _$$_EmployeeCopyWith<$Res> {
  __$$_EmployeeCopyWithImpl(
      _$_Employee _value, $Res Function(_$_Employee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? joinDate = freezed,
    Object? dateOfBirth = freezed,
    Object? designation = freezed,
    Object? gender = freezed,
    Object? mobile = freezed,
    Object? landline = freezed,
    Object? email = freezed,
    Object? presentAddress = freezed,
    Object? permanentAddress = freezed,
    Object? profilePicture = freezed,
    Object? resume = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? status = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_$_Employee(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as Designation?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
      landline: freezed == landline
          ? _value.landline
          : landline // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      presentAddress: freezed == presentAddress
          ? _value.presentAddress
          : presentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      permanentAddress: freezed == permanentAddress
          ? _value.permanentAddress
          : permanentAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      resume: freezed == resume
          ? _value.resume
          : resume // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_Employee implements _Employee {
  const _$_Employee(
      {this.id,
      this.firstName,
      this.lastName,
      this.joinDate,
      this.dateOfBirth,
      this.designation,
      this.gender,
      this.mobile,
      this.landline,
      this.email,
      this.presentAddress,
      this.permanentAddress,
      this.profilePicture,
      this.resume,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.profileImage});

  factory _$_Employee.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeFromJson(json);

  @override
  final int? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? joinDate;
  @override
  final String? dateOfBirth;
  @override
  final Designation? designation;
  @override
  final String? gender;
  @override
  final int? mobile;
  @override
  final int? landline;
  @override
  final String? email;
  @override
  final String? presentAddress;
  @override
  final String? permanentAddress;
  @override
  final String? profilePicture;
  @override
  final String? resume;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? status;
  @override
  final String? profileImage;

  @override
  String toString() {
    return 'Employee(id: $id, firstName: $firstName, lastName: $lastName, joinDate: $joinDate, dateOfBirth: $dateOfBirth, designation: $designation, gender: $gender, mobile: $mobile, landline: $landline, email: $email, presentAddress: $presentAddress, permanentAddress: $permanentAddress, profilePicture: $profilePicture, resume: $resume, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Employee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.landline, landline) ||
                other.landline == landline) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.presentAddress, presentAddress) ||
                other.presentAddress == presentAddress) &&
            (identical(other.permanentAddress, permanentAddress) ||
                other.permanentAddress == permanentAddress) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.resume, resume) || other.resume == resume) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      joinDate,
      dateOfBirth,
      designation,
      gender,
      mobile,
      landline,
      email,
      presentAddress,
      permanentAddress,
      profilePicture,
      resume,
      createdAt,
      updatedAt,
      status,
      profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      __$$_EmployeeCopyWithImpl<_$_Employee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeToJson(
      this,
    );
  }
}

abstract class _Employee implements Employee {
  const factory _Employee(
      {final int? id,
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
      final String? profileImage}) = _$_Employee;

  factory _Employee.fromJson(Map<String, dynamic> json) = _$_Employee.fromJson;

  @override
  int? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get joinDate;
  @override
  String? get dateOfBirth;
  @override
  Designation? get designation;
  @override
  String? get gender;
  @override
  int? get mobile;
  @override
  int? get landline;
  @override
  String? get email;
  @override
  String? get presentAddress;
  @override
  String? get permanentAddress;
  @override
  String? get profilePicture;
  @override
  String? get resume;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get status;
  @override
  String? get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

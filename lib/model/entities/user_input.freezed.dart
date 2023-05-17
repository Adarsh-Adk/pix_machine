// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInput _$UserInputFromJson(Map<String, dynamic> json) {
  return _UserInput.fromJson(json);
}

/// @nodoc
mixin _$UserInput {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInputCopyWith<UserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInputCopyWith<$Res> {
  factory $UserInputCopyWith(UserInput value, $Res Function(UserInput) then) =
      _$UserInputCopyWithImpl<$Res, UserInput>;
  @useResult
  $Res call({String? email, String? password});
}

/// @nodoc
class _$UserInputCopyWithImpl<$Res, $Val extends UserInput>
    implements $UserInputCopyWith<$Res> {
  _$UserInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInputCopyWith<$Res> implements $UserInputCopyWith<$Res> {
  factory _$$_UserInputCopyWith(
          _$_UserInput value, $Res Function(_$_UserInput) then) =
      __$$_UserInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? password});
}

/// @nodoc
class __$$_UserInputCopyWithImpl<$Res>
    extends _$UserInputCopyWithImpl<$Res, _$_UserInput>
    implements _$$_UserInputCopyWith<$Res> {
  __$$_UserInputCopyWithImpl(
      _$_UserInput _value, $Res Function(_$_UserInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_UserInput(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_UserInput implements _UserInput {
  const _$_UserInput({this.email, this.password});

  factory _$_UserInput.fromJson(Map<String, dynamic> json) =>
      _$$_UserInputFromJson(json);

  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'UserInput(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInput &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInputCopyWith<_$_UserInput> get copyWith =>
      __$$_UserInputCopyWithImpl<_$_UserInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInputToJson(
      this,
    );
  }
}

abstract class _UserInput implements UserInput {
  const factory _UserInput({final String? email, final String? password}) =
      _$_UserInput;

  factory _UserInput.fromJson(Map<String, dynamic> json) =
      _$_UserInput.fromJson;

  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_UserInputCopyWith<_$_UserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

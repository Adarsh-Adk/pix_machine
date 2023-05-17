// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerResponse _$ServerResponseFromJson(Map<String, dynamic> json) {
  return _ServerResponse.fromJson(json);
}

/// @nodoc
mixin _$ServerResponse {
  @JsonKey(name: "current_page")
  int? get currentPage => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;
  @JsonKey(name: "last_page")
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: "next_page_url")
  String? get nextPageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "per_page")
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerResponseCopyWith<ServerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerResponseCopyWith<$Res> {
  factory $ServerResponseCopyWith(
          ServerResponse value, $Res Function(ServerResponse) then) =
      _$ServerResponseCopyWithImpl<$Res, ServerResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "current_page") int? currentPage,
      dynamic data,
      @JsonKey(name: "last_page") int? lastPage,
      @JsonKey(name: "next_page_url") String? nextPageUrl,
      @JsonKey(name: "per_page") int? perPage,
      int? total});
}

/// @nodoc
class _$ServerResponseCopyWithImpl<$Res, $Val extends ServerResponse>
    implements $ServerResponseCopyWith<$Res> {
  _$ServerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = freezed,
    Object? lastPage = freezed,
    Object? nextPageUrl = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServerResponseCopyWith<$Res>
    implements $ServerResponseCopyWith<$Res> {
  factory _$$_ServerResponseCopyWith(
          _$_ServerResponse value, $Res Function(_$_ServerResponse) then) =
      __$$_ServerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "current_page") int? currentPage,
      dynamic data,
      @JsonKey(name: "last_page") int? lastPage,
      @JsonKey(name: "next_page_url") String? nextPageUrl,
      @JsonKey(name: "per_page") int? perPage,
      int? total});
}

/// @nodoc
class __$$_ServerResponseCopyWithImpl<$Res>
    extends _$ServerResponseCopyWithImpl<$Res, _$_ServerResponse>
    implements _$$_ServerResponseCopyWith<$Res> {
  __$$_ServerResponseCopyWithImpl(
      _$_ServerResponse _value, $Res Function(_$_ServerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = freezed,
    Object? lastPage = freezed,
    Object? nextPageUrl = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_ServerResponse(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServerResponse implements _ServerResponse {
  const _$_ServerResponse(
      {@JsonKey(name: "current_page") this.currentPage,
      this.data,
      @JsonKey(name: "last_page") this.lastPage,
      @JsonKey(name: "next_page_url") this.nextPageUrl,
      @JsonKey(name: "per_page") this.perPage,
      this.total});

  factory _$_ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ServerResponseFromJson(json);

  @override
  @JsonKey(name: "current_page")
  final int? currentPage;
  @override
  final dynamic data;
  @override
  @JsonKey(name: "last_page")
  final int? lastPage;
  @override
  @JsonKey(name: "next_page_url")
  final String? nextPageUrl;
  @override
  @JsonKey(name: "per_page")
  final int? perPage;
  @override
  final int? total;

  @override
  String toString() {
    return 'ServerResponse(currentPage: $currentPage, data: $data, lastPage: $lastPage, nextPageUrl: $nextPageUrl, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerResponse &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(data),
      lastPage,
      nextPageUrl,
      perPage,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerResponseCopyWith<_$_ServerResponse> get copyWith =>
      __$$_ServerResponseCopyWithImpl<_$_ServerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServerResponseToJson(
      this,
    );
  }
}

abstract class _ServerResponse implements ServerResponse {
  const factory _ServerResponse(
      {@JsonKey(name: "current_page") final int? currentPage,
      final dynamic data,
      @JsonKey(name: "last_page") final int? lastPage,
      @JsonKey(name: "next_page_url") final String? nextPageUrl,
      @JsonKey(name: "per_page") final int? perPage,
      final int? total}) = _$_ServerResponse;

  factory _ServerResponse.fromJson(Map<String, dynamic> json) =
      _$_ServerResponse.fromJson;

  @override
  @JsonKey(name: "current_page")
  int? get currentPage;
  @override
  dynamic get data;
  @override
  @JsonKey(name: "last_page")
  int? get lastPage;
  @override
  @JsonKey(name: "next_page_url")
  String? get nextPageUrl;
  @override
  @JsonKey(name: "per_page")
  int? get perPage;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$_ServerResponseCopyWith<_$_ServerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

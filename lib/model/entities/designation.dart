import 'package:freezed_annotation/freezed_annotation.dart';

part 'designation.freezed.dart';
part 'designation.g.dart';

@freezed
class Designation with _$Designation {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Designation({
    final int? id,
    final String? name,
    final String? deletedAt,
    final String? createdAt,
    final String? updatedAt,
  }) = _Designation;

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);
}

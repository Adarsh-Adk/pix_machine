import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_input.freezed.dart';
part 'user_input.g.dart';

@freezed
class UserInput with _$UserInput {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory UserInput({final String? email, final String? password}) =
      _UserInput;

  factory UserInput.fromJson(Map<String, dynamic> json) =>
      _$UserInputFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_response.freezed.dart';
part 'server_response.g.dart';

@freezed
class ServerResponse with _$ServerResponse {
  const factory ServerResponse(
      {@JsonKey(name: "current_page") final int? currentPage,
      final dynamic data,
      @JsonKey(name: "last_page") final int? lastPage,
      @JsonKey(name: "next_page_url") final String? nextPageUrl,
      @JsonKey(name: "per_page") final int? perPage,
      final int? total}) = _ServerResponse;

  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);
}

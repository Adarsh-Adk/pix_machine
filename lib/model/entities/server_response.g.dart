// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServerResponse _$$_ServerResponseFromJson(Map<String, dynamic> json) =>
    _$_ServerResponse(
      currentPage: json['current_page'] as int?,
      data: json['data'],
      lastPage: json['last_page'] as int?,
      nextPageUrl: json['next_page_url'] as String?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$_ServerResponseToJson(_$_ServerResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'last_page': instance.lastPage,
      'next_page_url': instance.nextPageUrl,
      'per_page': instance.perPage,
      'total': instance.total,
    };

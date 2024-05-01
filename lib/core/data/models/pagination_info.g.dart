// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationInfoPaginationInfoImpl _$$PaginationInfoPaginationInfoImplFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['currentPage', 'pageSize', 'total'],
  );
  return _$PaginationInfoPaginationInfoImpl(
    currentPage: json['currentPage'] as int,
    pageSize: json['pageSize'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$$PaginationInfoPaginationInfoImplToJson(
        _$PaginationInfoPaginationInfoImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'total': instance.total,
    };

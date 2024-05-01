// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_info.g.dart';
part 'pagination_info.freezed.dart';

@freezed
class PaginationInfo with _$PaginationInfo {
  const factory PaginationInfo({
    @JsonKey(name: 'currentPage', required: true) required int currentPage,
    @JsonKey(name: 'pageSize', required: true) required int pageSize,
    @JsonKey(name: 'total', required: true) required int total,
  }) = _PaginationInfoPaginationInfo;

  factory PaginationInfo.fromJson(Map json) => _$PaginationInfoFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}

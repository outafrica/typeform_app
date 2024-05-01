// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) {
  return _PaginationInfoPaginationInfo.fromJson(json);
}

/// @nodoc
mixin _$PaginationInfo {
  @JsonKey(name: 'currentPage', required: true)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageSize', required: true)
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'total', required: true)
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationInfoCopyWith<PaginationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationInfoCopyWith<$Res> {
  factory $PaginationInfoCopyWith(
          PaginationInfo value, $Res Function(PaginationInfo) then) =
      _$PaginationInfoCopyWithImpl<$Res, PaginationInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'currentPage', required: true) int currentPage,
      @JsonKey(name: 'pageSize', required: true) int pageSize,
      @JsonKey(name: 'total', required: true) int total});
}

/// @nodoc
class _$PaginationInfoCopyWithImpl<$Res, $Val extends PaginationInfo>
    implements $PaginationInfoCopyWith<$Res> {
  _$PaginationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? pageSize = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationInfoPaginationInfoImplCopyWith<$Res>
    implements $PaginationInfoCopyWith<$Res> {
  factory _$$PaginationInfoPaginationInfoImplCopyWith(
          _$PaginationInfoPaginationInfoImpl value,
          $Res Function(_$PaginationInfoPaginationInfoImpl) then) =
      __$$PaginationInfoPaginationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'currentPage', required: true) int currentPage,
      @JsonKey(name: 'pageSize', required: true) int pageSize,
      @JsonKey(name: 'total', required: true) int total});
}

/// @nodoc
class __$$PaginationInfoPaginationInfoImplCopyWithImpl<$Res>
    extends _$PaginationInfoCopyWithImpl<$Res,
        _$PaginationInfoPaginationInfoImpl>
    implements _$$PaginationInfoPaginationInfoImplCopyWith<$Res> {
  __$$PaginationInfoPaginationInfoImplCopyWithImpl(
      _$PaginationInfoPaginationInfoImpl _value,
      $Res Function(_$PaginationInfoPaginationInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? pageSize = null,
    Object? total = null,
  }) {
    return _then(_$PaginationInfoPaginationInfoImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationInfoPaginationInfoImpl
    implements _PaginationInfoPaginationInfo {
  const _$PaginationInfoPaginationInfoImpl(
      {@JsonKey(name: 'currentPage', required: true) required this.currentPage,
      @JsonKey(name: 'pageSize', required: true) required this.pageSize,
      @JsonKey(name: 'total', required: true) required this.total});

  factory _$PaginationInfoPaginationInfoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginationInfoPaginationInfoImplFromJson(json);

  @override
  @JsonKey(name: 'currentPage', required: true)
  final int currentPage;
  @override
  @JsonKey(name: 'pageSize', required: true)
  final int pageSize;
  @override
  @JsonKey(name: 'total', required: true)
  final int total;

  @override
  String toString() {
    return 'PaginationInfo(currentPage: $currentPage, pageSize: $pageSize, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationInfoPaginationInfoImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, pageSize, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationInfoPaginationInfoImplCopyWith<
          _$PaginationInfoPaginationInfoImpl>
      get copyWith => __$$PaginationInfoPaginationInfoImplCopyWithImpl<
          _$PaginationInfoPaginationInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationInfoPaginationInfoImplToJson(
      this,
    );
  }
}

abstract class _PaginationInfoPaginationInfo implements PaginationInfo {
  const factory _PaginationInfoPaginationInfo(
      {@JsonKey(name: 'currentPage', required: true)
      required final int currentPage,
      @JsonKey(name: 'pageSize', required: true) required final int pageSize,
      @JsonKey(name: 'total', required: true)
      required final int total}) = _$PaginationInfoPaginationInfoImpl;

  factory _PaginationInfoPaginationInfo.fromJson(Map<String, dynamic> json) =
      _$PaginationInfoPaginationInfoImpl.fromJson;

  @override
  @JsonKey(name: 'currentPage', required: true)
  int get currentPage;
  @override
  @JsonKey(name: 'pageSize', required: true)
  int get pageSize;
  @override
  @JsonKey(name: 'total', required: true)
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$PaginationInfoPaginationInfoImplCopyWith<
          _$PaginationInfoPaginationInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

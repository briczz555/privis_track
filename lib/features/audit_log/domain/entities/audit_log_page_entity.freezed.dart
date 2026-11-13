// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuditLogPageEntity {

 List<AuditLogEntity> get logs; int get page; int get limit; int get total; int get totalPages; bool get isLoadingMore;
/// Create a copy of AuditLogPageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogPageEntityCopyWith<AuditLogPageEntity> get copyWith => _$AuditLogPageEntityCopyWithImpl<AuditLogPageEntity>(this as AuditLogPageEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AuditLogPageEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLogPageEntity&&const DeepCollectionEquality().equals(other.logs, _this.logs)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.limit, _this.limit) || other.limit == _this.limit)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.totalPages, _this.totalPages) || other.totalPages == _this.totalPages)&&(identical(other.isLoadingMore, _this.isLoadingMore) || other.isLoadingMore == _this.isLoadingMore));
}


@override
int get hashCode {
  final _this = this as AuditLogPageEntity;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.logs),_this.page,_this.limit,_this.total,_this.totalPages,_this.isLoadingMore);
}

@override
String toString() {
  final _this = this as AuditLogPageEntity;
  return 'AuditLogPageEntity(logs: ${_this.logs}, page: ${_this.page}, limit: ${_this.limit}, total: ${_this.total}, totalPages: ${_this.totalPages}, isLoadingMore: ${_this.isLoadingMore})';
}


}

/// @nodoc
abstract mixin class $AuditLogPageEntityCopyWith<$Res>  {
  factory $AuditLogPageEntityCopyWith(AuditLogPageEntity value, $Res Function(AuditLogPageEntity) _then) = _$AuditLogPageEntityCopyWithImpl;
@useResult
$Res call({
 List<AuditLogEntity> logs, int page, int limit, int total, int totalPages, bool isLoadingMore
});




}
/// @nodoc
class _$AuditLogPageEntityCopyWithImpl<$Res>
    implements $AuditLogPageEntityCopyWith<$Res> {
  _$AuditLogPageEntityCopyWithImpl(this._self, this._then);

  final AuditLogPageEntity _self;
  final $Res Function(AuditLogPageEntity) _then;

/// Create a copy of AuditLogPageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logs = null,Object? page = null,Object? limit = null,Object? total = null,Object? totalPages = null,Object? isLoadingMore = null,}) {
  return _then(AuditLogPageEntity(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<AuditLogEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLogPageEntity].
extension AuditLogPageEntityPatterns on AuditLogPageEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLogPageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLogPageEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLogPageEntity value)  $default,){
final _that = this;
switch (_that) {
case _AuditLogPageEntity():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLogPageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLogPageEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AuditLogEntity> logs,  int page,  int limit,  int total,  int totalPages,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLogPageEntity() when $default != null:
return $default(_that.logs,_that.page,_that.limit,_that.total,_that.totalPages,_that.isLoadingMore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AuditLogEntity> logs,  int page,  int limit,  int total,  int totalPages,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _AuditLogPageEntity():
return $default(_that.logs,_that.page,_that.limit,_that.total,_that.totalPages,_that.isLoadingMore);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AuditLogEntity> logs,  int page,  int limit,  int total,  int totalPages,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _AuditLogPageEntity() when $default != null:
return $default(_that.logs,_that.page,_that.limit,_that.total,_that.totalPages,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _AuditLogPageEntity implements AuditLogPageEntity {
  const _AuditLogPageEntity({required  List<AuditLogEntity> logs, required this.page, required this.limit, required this.total, required this.totalPages, this.isLoadingMore = false}): _logs = logs;
  

 final  List<AuditLogEntity> _logs;
@override List<AuditLogEntity> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

@override final  int page;
@override final  int limit;
@override final  int total;
@override final  int totalPages;
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of AuditLogPageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogPageEntityCopyWith<_AuditLogPageEntity> get copyWith => __$AuditLogPageEntityCopyWithImpl<_AuditLogPageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLogPageEntity&&const DeepCollectionEquality().equals(other.logs, _logs)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs),page,limit,total,totalPages,isLoadingMore);
}

@override
String toString() {
    return 'AuditLogPageEntity(logs: $logs, page: $page, limit: $limit, total: $total, totalPages: $totalPages, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$AuditLogPageEntityCopyWith<$Res> implements $AuditLogPageEntityCopyWith<$Res> {
  factory _$AuditLogPageEntityCopyWith(_AuditLogPageEntity value, $Res Function(_AuditLogPageEntity) _then) = __$AuditLogPageEntityCopyWithImpl;
@override @useResult
$Res call({
 List<AuditLogEntity> logs, int page, int limit, int total, int totalPages, bool isLoadingMore
});




}
/// @nodoc
class __$AuditLogPageEntityCopyWithImpl<$Res>
    implements _$AuditLogPageEntityCopyWith<$Res> {
  __$AuditLogPageEntityCopyWithImpl(this._self, this._then);

  final _AuditLogPageEntity _self;
  final $Res Function(_AuditLogPageEntity) _then;

/// Create a copy of AuditLogPageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logs = null,Object? page = null,Object? limit = null,Object? total = null,Object? totalPages = null,Object? isLoadingMore = null,}) {
  return _then(_AuditLogPageEntity(
logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<AuditLogEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

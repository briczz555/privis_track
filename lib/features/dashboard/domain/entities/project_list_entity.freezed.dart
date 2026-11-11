// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectListEntity {

 List<ProjectEntity> get projects; int get page; int get limit; int get total; int get totalPages; bool get isFromCache; DateTime? get cachedAt;
/// Create a copy of ProjectListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListEntityCopyWith<ProjectListEntity> get copyWith => _$ProjectListEntityCopyWithImpl<ProjectListEntity>(this as ProjectListEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectListEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListEntity&&const DeepCollectionEquality().equals(other.projects, _this.projects)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.limit, _this.limit) || other.limit == _this.limit)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.totalPages, _this.totalPages) || other.totalPages == _this.totalPages)&&(identical(other.isFromCache, _this.isFromCache) || other.isFromCache == _this.isFromCache)&&(identical(other.cachedAt, _this.cachedAt) || other.cachedAt == _this.cachedAt));
}


@override
int get hashCode {
  final _this = this as ProjectListEntity;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.projects),_this.page,_this.limit,_this.total,_this.totalPages,_this.isFromCache,_this.cachedAt);
}

@override
String toString() {
  final _this = this as ProjectListEntity;
  return 'ProjectListEntity(projects: ${_this.projects}, page: ${_this.page}, limit: ${_this.limit}, total: ${_this.total}, totalPages: ${_this.totalPages}, isFromCache: ${_this.isFromCache}, cachedAt: ${_this.cachedAt})';
}


}

/// @nodoc
abstract mixin class $ProjectListEntityCopyWith<$Res>  {
  factory $ProjectListEntityCopyWith(ProjectListEntity value, $Res Function(ProjectListEntity) _then) = _$ProjectListEntityCopyWithImpl;
@useResult
$Res call({
 List<ProjectEntity> projects, int page, int limit, int total, int totalPages, bool isFromCache, DateTime? cachedAt
});




}
/// @nodoc
class _$ProjectListEntityCopyWithImpl<$Res>
    implements $ProjectListEntityCopyWith<$Res> {
  _$ProjectListEntityCopyWithImpl(this._self, this._then);

  final ProjectListEntity _self;
  final $Res Function(ProjectListEntity) _then;

/// Create a copy of ProjectListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? page = null,Object? limit = null,Object? total = null,Object? totalPages = null,Object? isFromCache = null,Object? cachedAt = freezed,}) {
  return _then(ProjectListEntity(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectListEntity].
extension ProjectListEntityPatterns on ProjectListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectListEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProjectListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectEntity> projects,  int page,  int limit,  int total,  int totalPages,  bool isFromCache,  DateTime? cachedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectListEntity() when $default != null:
return $default(_that.projects,_that.page,_that.limit,_that.total,_that.totalPages,_that.isFromCache,_that.cachedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectEntity> projects,  int page,  int limit,  int total,  int totalPages,  bool isFromCache,  DateTime? cachedAt)  $default,) {final _that = this;
switch (_that) {
case _ProjectListEntity():
return $default(_that.projects,_that.page,_that.limit,_that.total,_that.totalPages,_that.isFromCache,_that.cachedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectEntity> projects,  int page,  int limit,  int total,  int totalPages,  bool isFromCache,  DateTime? cachedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProjectListEntity() when $default != null:
return $default(_that.projects,_that.page,_that.limit,_that.total,_that.totalPages,_that.isFromCache,_that.cachedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectListEntity implements ProjectListEntity {
  const _ProjectListEntity({required  List<ProjectEntity> projects, required this.page, required this.limit, required this.total, required this.totalPages, this.isFromCache = false, this.cachedAt}): _projects = projects;
  

 final  List<ProjectEntity> _projects;
@override List<ProjectEntity> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override final  int page;
@override final  int limit;
@override final  int total;
@override final  int totalPages;
@override@JsonKey() final  bool isFromCache;
@override final  DateTime? cachedAt;

/// Create a copy of ProjectListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectListEntityCopyWith<_ProjectListEntity> get copyWith => __$ProjectListEntityCopyWithImpl<_ProjectListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectListEntity&&const DeepCollectionEquality().equals(other.projects, _projects)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.isFromCache, isFromCache) || other.isFromCache == isFromCache)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),page,limit,total,totalPages,isFromCache,cachedAt);
}

@override
String toString() {
    return 'ProjectListEntity(projects: $projects, page: $page, limit: $limit, total: $total, totalPages: $totalPages, isFromCache: $isFromCache, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectListEntityCopyWith<$Res> implements $ProjectListEntityCopyWith<$Res> {
  factory _$ProjectListEntityCopyWith(_ProjectListEntity value, $Res Function(_ProjectListEntity) _then) = __$ProjectListEntityCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectEntity> projects, int page, int limit, int total, int totalPages, bool isFromCache, DateTime? cachedAt
});




}
/// @nodoc
class __$ProjectListEntityCopyWithImpl<$Res>
    implements _$ProjectListEntityCopyWith<$Res> {
  __$ProjectListEntityCopyWithImpl(this._self, this._then);

  final _ProjectListEntity _self;
  final $Res Function(_ProjectListEntity) _then;

/// Create a copy of ProjectListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? page = null,Object? limit = null,Object? total = null,Object? totalPages = null,Object? isFromCache = null,Object? cachedAt = freezed,}) {
  return _then(_ProjectListEntity(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

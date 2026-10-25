// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardEntity {

 List<ProjectEntity> get projects; List<ActivityEntity> get activities;
/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardEntityCopyWith<DashboardEntity> get copyWith => _$DashboardEntityCopyWithImpl<DashboardEntity>(this as DashboardEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DashboardEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardEntity&&const DeepCollectionEquality().equals(other.projects, _this.projects)&&const DeepCollectionEquality().equals(other.activities, _this.activities));
}


@override
int get hashCode {
  final _this = this as DashboardEntity;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.projects),const DeepCollectionEquality().hash(_this.activities));
}

@override
String toString() {
  final _this = this as DashboardEntity;
  return 'DashboardEntity(projects: ${_this.projects}, activities: ${_this.activities})';
}


}

/// @nodoc
abstract mixin class $DashboardEntityCopyWith<$Res>  {
  factory $DashboardEntityCopyWith(DashboardEntity value, $Res Function(DashboardEntity) _then) = _$DashboardEntityCopyWithImpl;
@useResult
$Res call({
 List<ProjectEntity> projects, List<ActivityEntity> activities
});




}
/// @nodoc
class _$DashboardEntityCopyWithImpl<$Res>
    implements $DashboardEntityCopyWith<$Res> {
  _$DashboardEntityCopyWithImpl(this._self, this._then);

  final DashboardEntity _self;
  final $Res Function(DashboardEntity) _then;

/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? activities = null,}) {
  return _then(DashboardEntity(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardEntity].
extension DashboardEntityPatterns on DashboardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardEntity value)  $default,){
final _that = this;
switch (_that) {
case _DashboardEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectEntity> projects,  List<ActivityEntity> activities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardEntity() when $default != null:
return $default(_that.projects,_that.activities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectEntity> projects,  List<ActivityEntity> activities)  $default,) {final _that = this;
switch (_that) {
case _DashboardEntity():
return $default(_that.projects,_that.activities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectEntity> projects,  List<ActivityEntity> activities)?  $default,) {final _that = this;
switch (_that) {
case _DashboardEntity() when $default != null:
return $default(_that.projects,_that.activities);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardEntity extends DashboardEntity {
  const _DashboardEntity({required  List<ProjectEntity> projects, required  List<ActivityEntity> activities}): _projects = projects,_activities = activities,super._();
  

 final  List<ProjectEntity> _projects;
@override List<ProjectEntity> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

 final  List<ActivityEntity> _activities;
@override List<ActivityEntity> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}


/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardEntityCopyWith<_DashboardEntity> get copyWith => __$DashboardEntityCopyWithImpl<_DashboardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardEntity&&const DeepCollectionEquality().equals(other.projects, _projects)&&const DeepCollectionEquality().equals(other.activities, _activities));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_activities));
}

@override
String toString() {
    return 'DashboardEntity(projects: $projects, activities: $activities)';
}


}

/// @nodoc
abstract mixin class _$DashboardEntityCopyWith<$Res> implements $DashboardEntityCopyWith<$Res> {
  factory _$DashboardEntityCopyWith(_DashboardEntity value, $Res Function(_DashboardEntity) _then) = __$DashboardEntityCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectEntity> projects, List<ActivityEntity> activities
});




}
/// @nodoc
class __$DashboardEntityCopyWithImpl<$Res>
    implements _$DashboardEntityCopyWith<$Res> {
  __$DashboardEntityCopyWithImpl(this._self, this._then);

  final _DashboardEntity _self;
  final $Res Function(_DashboardEntity) _then;

/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? activities = null,}) {
  return _then(_DashboardEntity(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityEntity>,
  ));
}


}

// dart format on

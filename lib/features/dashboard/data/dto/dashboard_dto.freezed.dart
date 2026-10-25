// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardDto {

 List<ProjectDto> get projects; List<ActivityDto> get activities;
/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardDtoCopyWith<DashboardDto> get copyWith => _$DashboardDtoCopyWithImpl<DashboardDto>(this as DashboardDto, _$identity);

  /// Serializes this DashboardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardDto&&const DeepCollectionEquality().equals(other.projects, _this.projects)&&const DeepCollectionEquality().equals(other.activities, _this.activities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.projects),const DeepCollectionEquality().hash(_this.activities));
}

@override
String toString() {
  final _this = this as DashboardDto;
  return 'DashboardDto(projects: ${_this.projects}, activities: ${_this.activities})';
}


}

/// @nodoc
abstract mixin class $DashboardDtoCopyWith<$Res>  {
  factory $DashboardDtoCopyWith(DashboardDto value, $Res Function(DashboardDto) _then) = _$DashboardDtoCopyWithImpl;
@useResult
$Res call({
 List<ProjectDto> projects, List<ActivityDto> activities
});




}
/// @nodoc
class _$DashboardDtoCopyWithImpl<$Res>
    implements $DashboardDtoCopyWith<$Res> {
  _$DashboardDtoCopyWithImpl(this._self, this._then);

  final DashboardDto _self;
  final $Res Function(DashboardDto) _then;

/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? activities = null,}) {
  return _then(DashboardDto(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectDto>,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardDto].
extension DashboardDtoPatterns on DashboardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardDto value)  $default,){
final _that = this;
switch (_that) {
case _DashboardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardDto value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectDto> projects,  List<ActivityDto> activities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectDto> projects,  List<ActivityDto> activities)  $default,) {final _that = this;
switch (_that) {
case _DashboardDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectDto> projects,  List<ActivityDto> activities)?  $default,) {final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
return $default(_that.projects,_that.activities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardDto implements DashboardDto {
  const _DashboardDto({required  List<ProjectDto> projects, required  List<ActivityDto> activities}): _projects = projects,_activities = activities;
  factory _DashboardDto.fromJson(Map<String, dynamic> json) => _$DashboardDtoFromJson(json);

 final  List<ProjectDto> _projects;
@override List<ProjectDto> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

 final  List<ActivityDto> _activities;
@override List<ActivityDto> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}


/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardDtoCopyWith<_DashboardDto> get copyWith => __$DashboardDtoCopyWithImpl<_DashboardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardDto&&const DeepCollectionEquality().equals(other.projects, _projects)&&const DeepCollectionEquality().equals(other.activities, _activities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_activities));
}

@override
String toString() {
    return 'DashboardDto(projects: $projects, activities: $activities)';
}


}

/// @nodoc
abstract mixin class _$DashboardDtoCopyWith<$Res> implements $DashboardDtoCopyWith<$Res> {
  factory _$DashboardDtoCopyWith(_DashboardDto value, $Res Function(_DashboardDto) _then) = __$DashboardDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectDto> projects, List<ActivityDto> activities
});




}
/// @nodoc
class __$DashboardDtoCopyWithImpl<$Res>
    implements _$DashboardDtoCopyWith<$Res> {
  __$DashboardDtoCopyWithImpl(this._self, this._then);

  final _DashboardDto _self;
  final $Res Function(_DashboardDto) _then;

/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? activities = null,}) {
  return _then(_DashboardDto(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectDto>,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityDto>,
  ));
}


}

// dart format on

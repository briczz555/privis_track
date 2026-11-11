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

@JsonKey(name: 'generated_at') String get generatedAt;@JsonKey(name: 'total_projects') int get totalProjects; List<PortfolioSliceDto> get portfolio;@JsonKey(name: 'active_projects') List<ProjectSummaryDto> get activeProjects; List<ActivityDto> get activities;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardDto&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt)&&(identical(other.totalProjects, _this.totalProjects) || other.totalProjects == _this.totalProjects)&&const DeepCollectionEquality().equals(other.portfolio, _this.portfolio)&&const DeepCollectionEquality().equals(other.activeProjects, _this.activeProjects)&&const DeepCollectionEquality().equals(other.activities, _this.activities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardDto;
  return Object.hash(runtimeType,_this.generatedAt,_this.totalProjects,const DeepCollectionEquality().hash(_this.portfolio),const DeepCollectionEquality().hash(_this.activeProjects),const DeepCollectionEquality().hash(_this.activities));
}

@override
String toString() {
  final _this = this as DashboardDto;
  return 'DashboardDto(generatedAt: ${_this.generatedAt}, totalProjects: ${_this.totalProjects}, portfolio: ${_this.portfolio}, activeProjects: ${_this.activeProjects}, activities: ${_this.activities})';
}


}

/// @nodoc
abstract mixin class $DashboardDtoCopyWith<$Res>  {
  factory $DashboardDtoCopyWith(DashboardDto value, $Res Function(DashboardDto) _then) = _$DashboardDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'generated_at') String generatedAt,@JsonKey(name: 'total_projects') int totalProjects, List<PortfolioSliceDto> portfolio,@JsonKey(name: 'active_projects') List<ProjectSummaryDto> activeProjects, List<ActivityDto> activities
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
@pragma('vm:prefer-inline') @override $Res call({Object? generatedAt = null,Object? totalProjects = null,Object? portfolio = null,Object? activeProjects = null,Object? activities = null,}) {
  return _then(DashboardDto(
generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as String,totalProjects: null == totalProjects ? _self.totalProjects : totalProjects // ignore: cast_nullable_to_non_nullable
as int,portfolio: null == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as List<PortfolioSliceDto>,activeProjects: null == activeProjects ? _self.activeProjects : activeProjects // ignore: cast_nullable_to_non_nullable
as List<ProjectSummaryDto>,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'generated_at')  String generatedAt, @JsonKey(name: 'total_projects')  int totalProjects,  List<PortfolioSliceDto> portfolio, @JsonKey(name: 'active_projects')  List<ProjectSummaryDto> activeProjects,  List<ActivityDto> activities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
return $default(_that.generatedAt,_that.totalProjects,_that.portfolio,_that.activeProjects,_that.activities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'generated_at')  String generatedAt, @JsonKey(name: 'total_projects')  int totalProjects,  List<PortfolioSliceDto> portfolio, @JsonKey(name: 'active_projects')  List<ProjectSummaryDto> activeProjects,  List<ActivityDto> activities)  $default,) {final _that = this;
switch (_that) {
case _DashboardDto():
return $default(_that.generatedAt,_that.totalProjects,_that.portfolio,_that.activeProjects,_that.activities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'generated_at')  String generatedAt, @JsonKey(name: 'total_projects')  int totalProjects,  List<PortfolioSliceDto> portfolio, @JsonKey(name: 'active_projects')  List<ProjectSummaryDto> activeProjects,  List<ActivityDto> activities)?  $default,) {final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
return $default(_that.generatedAt,_that.totalProjects,_that.portfolio,_that.activeProjects,_that.activities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardDto implements DashboardDto {
  const _DashboardDto({@JsonKey(name: 'generated_at') required this.generatedAt, @JsonKey(name: 'total_projects') required this.totalProjects, required  List<PortfolioSliceDto> portfolio, @JsonKey(name: 'active_projects') required  List<ProjectSummaryDto> activeProjects, required  List<ActivityDto> activities}): _portfolio = portfolio,_activeProjects = activeProjects,_activities = activities;
  factory _DashboardDto.fromJson(Map<String, dynamic> json) => _$DashboardDtoFromJson(json);

@override@JsonKey(name: 'generated_at') final  String generatedAt;
@override@JsonKey(name: 'total_projects') final  int totalProjects;
 final  List<PortfolioSliceDto> _portfolio;
@override List<PortfolioSliceDto> get portfolio {
  if (_portfolio is EqualUnmodifiableListView) return _portfolio;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_portfolio);
}

 final  List<ProjectSummaryDto> _activeProjects;
@override@JsonKey(name: 'active_projects') List<ProjectSummaryDto> get activeProjects {
  if (_activeProjects is EqualUnmodifiableListView) return _activeProjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeProjects);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardDto&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.totalProjects, totalProjects) || other.totalProjects == totalProjects)&&const DeepCollectionEquality().equals(other.portfolio, _portfolio)&&const DeepCollectionEquality().equals(other.activeProjects, _activeProjects)&&const DeepCollectionEquality().equals(other.activities, _activities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,generatedAt,totalProjects,const DeepCollectionEquality().hash(_portfolio),const DeepCollectionEquality().hash(_activeProjects),const DeepCollectionEquality().hash(_activities));
}

@override
String toString() {
    return 'DashboardDto(generatedAt: $generatedAt, totalProjects: $totalProjects, portfolio: $portfolio, activeProjects: $activeProjects, activities: $activities)';
}


}

/// @nodoc
abstract mixin class _$DashboardDtoCopyWith<$Res> implements $DashboardDtoCopyWith<$Res> {
  factory _$DashboardDtoCopyWith(_DashboardDto value, $Res Function(_DashboardDto) _then) = __$DashboardDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'generated_at') String generatedAt,@JsonKey(name: 'total_projects') int totalProjects, List<PortfolioSliceDto> portfolio,@JsonKey(name: 'active_projects') List<ProjectSummaryDto> activeProjects, List<ActivityDto> activities
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
@override @pragma('vm:prefer-inline') $Res call({Object? generatedAt = null,Object? totalProjects = null,Object? portfolio = null,Object? activeProjects = null,Object? activities = null,}) {
  return _then(_DashboardDto(
generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as String,totalProjects: null == totalProjects ? _self.totalProjects : totalProjects // ignore: cast_nullable_to_non_nullable
as int,portfolio: null == portfolio ? _self._portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as List<PortfolioSliceDto>,activeProjects: null == activeProjects ? _self._activeProjects : activeProjects // ignore: cast_nullable_to_non_nullable
as List<ProjectSummaryDto>,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityDto>,
  ));
}


}

// dart format on

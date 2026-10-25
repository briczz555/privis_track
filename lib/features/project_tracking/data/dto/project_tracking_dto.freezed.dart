// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_tracking_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectTrackingDto {

 String get id; String get name; String get client; String get status;@JsonKey(name: 'current_stage') int get currentStage; List<ProjectStageDto> get stages;
/// Create a copy of ProjectTrackingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectTrackingDtoCopyWith<ProjectTrackingDto> get copyWith => _$ProjectTrackingDtoCopyWithImpl<ProjectTrackingDto>(this as ProjectTrackingDto, _$identity);

  /// Serializes this ProjectTrackingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectTrackingDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectTrackingDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.client, _this.client) || other.client == _this.client)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.currentStage, _this.currentStage) || other.currentStage == _this.currentStage)&&const DeepCollectionEquality().equals(other.stages, _this.stages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectTrackingDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.client,_this.status,_this.currentStage,const DeepCollectionEquality().hash(_this.stages));
}

@override
String toString() {
  final _this = this as ProjectTrackingDto;
  return 'ProjectTrackingDto(id: ${_this.id}, name: ${_this.name}, client: ${_this.client}, status: ${_this.status}, currentStage: ${_this.currentStage}, stages: ${_this.stages})';
}


}

/// @nodoc
abstract mixin class $ProjectTrackingDtoCopyWith<$Res>  {
  factory $ProjectTrackingDtoCopyWith(ProjectTrackingDto value, $Res Function(ProjectTrackingDto) _then) = _$ProjectTrackingDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String client, String status,@JsonKey(name: 'current_stage') int currentStage, List<ProjectStageDto> stages
});




}
/// @nodoc
class _$ProjectTrackingDtoCopyWithImpl<$Res>
    implements $ProjectTrackingDtoCopyWith<$Res> {
  _$ProjectTrackingDtoCopyWithImpl(this._self, this._then);

  final ProjectTrackingDto _self;
  final $Res Function(ProjectTrackingDto) _then;

/// Create a copy of ProjectTrackingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? stages = null,}) {
  return _then(ProjectTrackingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,stages: null == stages ? _self.stages : stages // ignore: cast_nullable_to_non_nullable
as List<ProjectStageDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectTrackingDto].
extension ProjectTrackingDtoPatterns on ProjectTrackingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectTrackingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectTrackingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectTrackingDto value)  $default,){
final _that = this;
switch (_that) {
case _ProjectTrackingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectTrackingDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectTrackingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String client,  String status, @JsonKey(name: 'current_stage')  int currentStage,  List<ProjectStageDto> stages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectTrackingDto() when $default != null:
return $default(_that.id,_that.name,_that.client,_that.status,_that.currentStage,_that.stages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String client,  String status, @JsonKey(name: 'current_stage')  int currentStage,  List<ProjectStageDto> stages)  $default,) {final _that = this;
switch (_that) {
case _ProjectTrackingDto():
return $default(_that.id,_that.name,_that.client,_that.status,_that.currentStage,_that.stages);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String client,  String status, @JsonKey(name: 'current_stage')  int currentStage,  List<ProjectStageDto> stages)?  $default,) {final _that = this;
switch (_that) {
case _ProjectTrackingDto() when $default != null:
return $default(_that.id,_that.name,_that.client,_that.status,_that.currentStage,_that.stages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectTrackingDto implements ProjectTrackingDto {
  const _ProjectTrackingDto({required this.id, required this.name, required this.client, required this.status, @JsonKey(name: 'current_stage') required this.currentStage, required  List<ProjectStageDto> stages}): _stages = stages;
  factory _ProjectTrackingDto.fromJson(Map<String, dynamic> json) => _$ProjectTrackingDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String client;
@override final  String status;
@override@JsonKey(name: 'current_stage') final  int currentStage;
 final  List<ProjectStageDto> _stages;
@override List<ProjectStageDto> get stages {
  if (_stages is EqualUnmodifiableListView) return _stages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stages);
}


/// Create a copy of ProjectTrackingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectTrackingDtoCopyWith<_ProjectTrackingDto> get copyWith => __$ProjectTrackingDtoCopyWithImpl<_ProjectTrackingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectTrackingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectTrackingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.client, client) || other.client == client)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&const DeepCollectionEquality().equals(other.stages, _stages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,client,status,currentStage,const DeepCollectionEquality().hash(_stages));
}

@override
String toString() {
    return 'ProjectTrackingDto(id: $id, name: $name, client: $client, status: $status, currentStage: $currentStage, stages: $stages)';
}


}

/// @nodoc
abstract mixin class _$ProjectTrackingDtoCopyWith<$Res> implements $ProjectTrackingDtoCopyWith<$Res> {
  factory _$ProjectTrackingDtoCopyWith(_ProjectTrackingDto value, $Res Function(_ProjectTrackingDto) _then) = __$ProjectTrackingDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String client, String status,@JsonKey(name: 'current_stage') int currentStage, List<ProjectStageDto> stages
});




}
/// @nodoc
class __$ProjectTrackingDtoCopyWithImpl<$Res>
    implements _$ProjectTrackingDtoCopyWith<$Res> {
  __$ProjectTrackingDtoCopyWithImpl(this._self, this._then);

  final _ProjectTrackingDto _self;
  final $Res Function(_ProjectTrackingDto) _then;

/// Create a copy of ProjectTrackingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? stages = null,}) {
  return _then(_ProjectTrackingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,stages: null == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<ProjectStageDto>,
  ));
}


}

// dart format on

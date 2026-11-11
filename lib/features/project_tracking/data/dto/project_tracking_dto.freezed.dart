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

 String get id; String get code; String get name; ClientInfoDto get client; String get status;@JsonKey(name: 'current_stage') int get currentStage;@JsonKey(name: 'current_stage_title') String get currentStageTitle;@JsonKey(name: 'completed_stages') int get completedStages;@JsonKey(name: 'progress_percent') int get progressPercent; List<ProjectStageDto> get stages;@JsonKey(name: 'start_date') String? get startDate;@JsonKey(name: 'due_date') String? get dueDate;@JsonKey(name: 'updated_at') String get updatedAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectTrackingDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.client, _this.client) || other.client == _this.client)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.currentStage, _this.currentStage) || other.currentStage == _this.currentStage)&&(identical(other.currentStageTitle, _this.currentStageTitle) || other.currentStageTitle == _this.currentStageTitle)&&(identical(other.completedStages, _this.completedStages) || other.completedStages == _this.completedStages)&&(identical(other.progressPercent, _this.progressPercent) || other.progressPercent == _this.progressPercent)&&const DeepCollectionEquality().equals(other.stages, _this.stages)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectTrackingDto;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.client,_this.status,_this.currentStage,_this.currentStageTitle,_this.completedStages,_this.progressPercent,const DeepCollectionEquality().hash(_this.stages),_this.startDate,_this.dueDate,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ProjectTrackingDto;
  return 'ProjectTrackingDto(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, client: ${_this.client}, status: ${_this.status}, currentStage: ${_this.currentStage}, currentStageTitle: ${_this.currentStageTitle}, completedStages: ${_this.completedStages}, progressPercent: ${_this.progressPercent}, stages: ${_this.stages}, startDate: ${_this.startDate}, dueDate: ${_this.dueDate}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ProjectTrackingDtoCopyWith<$Res>  {
  factory $ProjectTrackingDtoCopyWith(ProjectTrackingDto value, $Res Function(ProjectTrackingDto) _then) = _$ProjectTrackingDtoCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, ClientInfoDto client, String status,@JsonKey(name: 'current_stage') int currentStage,@JsonKey(name: 'current_stage_title') String currentStageTitle,@JsonKey(name: 'completed_stages') int completedStages,@JsonKey(name: 'progress_percent') int progressPercent, List<ProjectStageDto> stages,@JsonKey(name: 'start_date') String? startDate,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'updated_at') String updatedAt
});


$ClientInfoDtoCopyWith<$Res> get client;

}
/// @nodoc
class _$ProjectTrackingDtoCopyWithImpl<$Res>
    implements $ProjectTrackingDtoCopyWith<$Res> {
  _$ProjectTrackingDtoCopyWithImpl(this._self, this._then);

  final ProjectTrackingDto _self;
  final $Res Function(ProjectTrackingDto) _then;

/// Create a copy of ProjectTrackingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? currentStageTitle = null,Object? completedStages = null,Object? progressPercent = null,Object? stages = null,Object? startDate = freezed,Object? dueDate = freezed,Object? updatedAt = null,}) {
  return _then(ProjectTrackingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as ClientInfoDto,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,currentStageTitle: null == currentStageTitle ? _self.currentStageTitle : currentStageTitle // ignore: cast_nullable_to_non_nullable
as String,completedStages: null == completedStages ? _self.completedStages : completedStages // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as int,stages: null == stages ? _self.stages : stages // ignore: cast_nullable_to_non_nullable
as List<ProjectStageDto>,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProjectTrackingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientInfoDtoCopyWith<$Res> get client {
  
  return $ClientInfoDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  ClientInfoDto client,  String status, @JsonKey(name: 'current_stage')  int currentStage, @JsonKey(name: 'current_stage_title')  String currentStageTitle, @JsonKey(name: 'completed_stages')  int completedStages, @JsonKey(name: 'progress_percent')  int progressPercent,  List<ProjectStageDto> stages, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectTrackingDto() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.completedStages,_that.progressPercent,_that.stages,_that.startDate,_that.dueDate,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  ClientInfoDto client,  String status, @JsonKey(name: 'current_stage')  int currentStage, @JsonKey(name: 'current_stage_title')  String currentStageTitle, @JsonKey(name: 'completed_stages')  int completedStages, @JsonKey(name: 'progress_percent')  int progressPercent,  List<ProjectStageDto> stages, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProjectTrackingDto():
return $default(_that.id,_that.code,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.completedStages,_that.progressPercent,_that.stages,_that.startDate,_that.dueDate,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  ClientInfoDto client,  String status, @JsonKey(name: 'current_stage')  int currentStage, @JsonKey(name: 'current_stage_title')  String currentStageTitle, @JsonKey(name: 'completed_stages')  int completedStages, @JsonKey(name: 'progress_percent')  int progressPercent,  List<ProjectStageDto> stages, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProjectTrackingDto() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.completedStages,_that.progressPercent,_that.stages,_that.startDate,_that.dueDate,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectTrackingDto implements ProjectTrackingDto {
  const _ProjectTrackingDto({required this.id, required this.code, required this.name, required this.client, required this.status, @JsonKey(name: 'current_stage') required this.currentStage, @JsonKey(name: 'current_stage_title') required this.currentStageTitle, @JsonKey(name: 'completed_stages') required this.completedStages, @JsonKey(name: 'progress_percent') required this.progressPercent, required  List<ProjectStageDto> stages, @JsonKey(name: 'start_date') this.startDate, @JsonKey(name: 'due_date') this.dueDate, @JsonKey(name: 'updated_at') required this.updatedAt}): _stages = stages;
  factory _ProjectTrackingDto.fromJson(Map<String, dynamic> json) => _$ProjectTrackingDtoFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override final  ClientInfoDto client;
@override final  String status;
@override@JsonKey(name: 'current_stage') final  int currentStage;
@override@JsonKey(name: 'current_stage_title') final  String currentStageTitle;
@override@JsonKey(name: 'completed_stages') final  int completedStages;
@override@JsonKey(name: 'progress_percent') final  int progressPercent;
 final  List<ProjectStageDto> _stages;
@override List<ProjectStageDto> get stages {
  if (_stages is EqualUnmodifiableListView) return _stages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stages);
}

@override@JsonKey(name: 'start_date') final  String? startDate;
@override@JsonKey(name: 'due_date') final  String? dueDate;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectTrackingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.client, client) || other.client == client)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&(identical(other.currentStageTitle, currentStageTitle) || other.currentStageTitle == currentStageTitle)&&(identical(other.completedStages, completedStages) || other.completedStages == completedStages)&&(identical(other.progressPercent, progressPercent) || other.progressPercent == progressPercent)&&const DeepCollectionEquality().equals(other.stages, _stages)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,client,status,currentStage,currentStageTitle,completedStages,progressPercent,const DeepCollectionEquality().hash(_stages),startDate,dueDate,updatedAt);
}

@override
String toString() {
    return 'ProjectTrackingDto(id: $id, code: $code, name: $name, client: $client, status: $status, currentStage: $currentStage, currentStageTitle: $currentStageTitle, completedStages: $completedStages, progressPercent: $progressPercent, stages: $stages, startDate: $startDate, dueDate: $dueDate, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectTrackingDtoCopyWith<$Res> implements $ProjectTrackingDtoCopyWith<$Res> {
  factory _$ProjectTrackingDtoCopyWith(_ProjectTrackingDto value, $Res Function(_ProjectTrackingDto) _then) = __$ProjectTrackingDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, ClientInfoDto client, String status,@JsonKey(name: 'current_stage') int currentStage,@JsonKey(name: 'current_stage_title') String currentStageTitle,@JsonKey(name: 'completed_stages') int completedStages,@JsonKey(name: 'progress_percent') int progressPercent, List<ProjectStageDto> stages,@JsonKey(name: 'start_date') String? startDate,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'updated_at') String updatedAt
});


@override $ClientInfoDtoCopyWith<$Res> get client;

}
/// @nodoc
class __$ProjectTrackingDtoCopyWithImpl<$Res>
    implements _$ProjectTrackingDtoCopyWith<$Res> {
  __$ProjectTrackingDtoCopyWithImpl(this._self, this._then);

  final _ProjectTrackingDto _self;
  final $Res Function(_ProjectTrackingDto) _then;

/// Create a copy of ProjectTrackingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? currentStageTitle = null,Object? completedStages = null,Object? progressPercent = null,Object? stages = null,Object? startDate = freezed,Object? dueDate = freezed,Object? updatedAt = null,}) {
  return _then(_ProjectTrackingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as ClientInfoDto,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,currentStageTitle: null == currentStageTitle ? _self.currentStageTitle : currentStageTitle // ignore: cast_nullable_to_non_nullable
as String,completedStages: null == completedStages ? _self.completedStages : completedStages // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as int,stages: null == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<ProjectStageDto>,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProjectTrackingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientInfoDtoCopyWith<$Res> get client {
  
  return $ClientInfoDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}

// dart format on

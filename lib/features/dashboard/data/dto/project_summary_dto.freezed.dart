// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectSummaryDto {

 String get id; String get code; String get name; ClientSummaryDto get client; String get status;@JsonKey(name: 'current_stage') int get currentStage;@JsonKey(name: 'current_stage_title') String get currentStageTitle;@JsonKey(name: 'completed_stages') int get completedStages;@JsonKey(name: 'progress_percent') int get progressPercent;@JsonKey(name: 'document_count') int get documentCount;@JsonKey(name: 'due_date') String? get dueDate;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of ProjectSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSummaryDtoCopyWith<ProjectSummaryDto> get copyWith => _$ProjectSummaryDtoCopyWithImpl<ProjectSummaryDto>(this as ProjectSummaryDto, _$identity);

  /// Serializes this ProjectSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectSummaryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSummaryDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.client, _this.client) || other.client == _this.client)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.currentStage, _this.currentStage) || other.currentStage == _this.currentStage)&&(identical(other.currentStageTitle, _this.currentStageTitle) || other.currentStageTitle == _this.currentStageTitle)&&(identical(other.completedStages, _this.completedStages) || other.completedStages == _this.completedStages)&&(identical(other.progressPercent, _this.progressPercent) || other.progressPercent == _this.progressPercent)&&(identical(other.documentCount, _this.documentCount) || other.documentCount == _this.documentCount)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectSummaryDto;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.client,_this.status,_this.currentStage,_this.currentStageTitle,_this.completedStages,_this.progressPercent,_this.documentCount,_this.dueDate,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ProjectSummaryDto;
  return 'ProjectSummaryDto(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, client: ${_this.client}, status: ${_this.status}, currentStage: ${_this.currentStage}, currentStageTitle: ${_this.currentStageTitle}, completedStages: ${_this.completedStages}, progressPercent: ${_this.progressPercent}, documentCount: ${_this.documentCount}, dueDate: ${_this.dueDate}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ProjectSummaryDtoCopyWith<$Res>  {
  factory $ProjectSummaryDtoCopyWith(ProjectSummaryDto value, $Res Function(ProjectSummaryDto) _then) = _$ProjectSummaryDtoCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, ClientSummaryDto client, String status,@JsonKey(name: 'current_stage') int currentStage,@JsonKey(name: 'current_stage_title') String currentStageTitle,@JsonKey(name: 'completed_stages') int completedStages,@JsonKey(name: 'progress_percent') int progressPercent,@JsonKey(name: 'document_count') int documentCount,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'updated_at') String updatedAt
});


$ClientSummaryDtoCopyWith<$Res> get client;

}
/// @nodoc
class _$ProjectSummaryDtoCopyWithImpl<$Res>
    implements $ProjectSummaryDtoCopyWith<$Res> {
  _$ProjectSummaryDtoCopyWithImpl(this._self, this._then);

  final ProjectSummaryDto _self;
  final $Res Function(ProjectSummaryDto) _then;

/// Create a copy of ProjectSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? currentStageTitle = null,Object? completedStages = null,Object? progressPercent = null,Object? documentCount = null,Object? dueDate = freezed,Object? updatedAt = null,}) {
  return _then(ProjectSummaryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as ClientSummaryDto,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,currentStageTitle: null == currentStageTitle ? _self.currentStageTitle : currentStageTitle // ignore: cast_nullable_to_non_nullable
as String,completedStages: null == completedStages ? _self.completedStages : completedStages // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as int,documentCount: null == documentCount ? _self.documentCount : documentCount // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProjectSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientSummaryDtoCopyWith<$Res> get client {
  
  return $ClientSummaryDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectSummaryDto].
extension ProjectSummaryDtoPatterns on ProjectSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _ProjectSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  ClientSummaryDto client,  String status, @JsonKey(name: 'current_stage')  int currentStage, @JsonKey(name: 'current_stage_title')  String currentStageTitle, @JsonKey(name: 'completed_stages')  int completedStages, @JsonKey(name: 'progress_percent')  int progressPercent, @JsonKey(name: 'document_count')  int documentCount, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectSummaryDto() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.completedStages,_that.progressPercent,_that.documentCount,_that.dueDate,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  ClientSummaryDto client,  String status, @JsonKey(name: 'current_stage')  int currentStage, @JsonKey(name: 'current_stage_title')  String currentStageTitle, @JsonKey(name: 'completed_stages')  int completedStages, @JsonKey(name: 'progress_percent')  int progressPercent, @JsonKey(name: 'document_count')  int documentCount, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProjectSummaryDto():
return $default(_that.id,_that.code,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.completedStages,_that.progressPercent,_that.documentCount,_that.dueDate,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  ClientSummaryDto client,  String status, @JsonKey(name: 'current_stage')  int currentStage, @JsonKey(name: 'current_stage_title')  String currentStageTitle, @JsonKey(name: 'completed_stages')  int completedStages, @JsonKey(name: 'progress_percent')  int progressPercent, @JsonKey(name: 'document_count')  int documentCount, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProjectSummaryDto() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.completedStages,_that.progressPercent,_that.documentCount,_that.dueDate,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectSummaryDto implements ProjectSummaryDto {
  const _ProjectSummaryDto({required this.id, required this.code, required this.name, required this.client, required this.status, @JsonKey(name: 'current_stage') required this.currentStage, @JsonKey(name: 'current_stage_title') required this.currentStageTitle, @JsonKey(name: 'completed_stages') required this.completedStages, @JsonKey(name: 'progress_percent') required this.progressPercent, @JsonKey(name: 'document_count') required this.documentCount, @JsonKey(name: 'due_date') this.dueDate, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ProjectSummaryDto.fromJson(Map<String, dynamic> json) => _$ProjectSummaryDtoFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override final  ClientSummaryDto client;
@override final  String status;
@override@JsonKey(name: 'current_stage') final  int currentStage;
@override@JsonKey(name: 'current_stage_title') final  String currentStageTitle;
@override@JsonKey(name: 'completed_stages') final  int completedStages;
@override@JsonKey(name: 'progress_percent') final  int progressPercent;
@override@JsonKey(name: 'document_count') final  int documentCount;
@override@JsonKey(name: 'due_date') final  String? dueDate;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of ProjectSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectSummaryDtoCopyWith<_ProjectSummaryDto> get copyWith => __$ProjectSummaryDtoCopyWithImpl<_ProjectSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.client, client) || other.client == client)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&(identical(other.currentStageTitle, currentStageTitle) || other.currentStageTitle == currentStageTitle)&&(identical(other.completedStages, completedStages) || other.completedStages == completedStages)&&(identical(other.progressPercent, progressPercent) || other.progressPercent == progressPercent)&&(identical(other.documentCount, documentCount) || other.documentCount == documentCount)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,client,status,currentStage,currentStageTitle,completedStages,progressPercent,documentCount,dueDate,updatedAt);
}

@override
String toString() {
    return 'ProjectSummaryDto(id: $id, code: $code, name: $name, client: $client, status: $status, currentStage: $currentStage, currentStageTitle: $currentStageTitle, completedStages: $completedStages, progressPercent: $progressPercent, documentCount: $documentCount, dueDate: $dueDate, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectSummaryDtoCopyWith<$Res> implements $ProjectSummaryDtoCopyWith<$Res> {
  factory _$ProjectSummaryDtoCopyWith(_ProjectSummaryDto value, $Res Function(_ProjectSummaryDto) _then) = __$ProjectSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, ClientSummaryDto client, String status,@JsonKey(name: 'current_stage') int currentStage,@JsonKey(name: 'current_stage_title') String currentStageTitle,@JsonKey(name: 'completed_stages') int completedStages,@JsonKey(name: 'progress_percent') int progressPercent,@JsonKey(name: 'document_count') int documentCount,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'updated_at') String updatedAt
});


@override $ClientSummaryDtoCopyWith<$Res> get client;

}
/// @nodoc
class __$ProjectSummaryDtoCopyWithImpl<$Res>
    implements _$ProjectSummaryDtoCopyWith<$Res> {
  __$ProjectSummaryDtoCopyWithImpl(this._self, this._then);

  final _ProjectSummaryDto _self;
  final $Res Function(_ProjectSummaryDto) _then;

/// Create a copy of ProjectSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? currentStageTitle = null,Object? completedStages = null,Object? progressPercent = null,Object? documentCount = null,Object? dueDate = freezed,Object? updatedAt = null,}) {
  return _then(_ProjectSummaryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as ClientSummaryDto,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,currentStageTitle: null == currentStageTitle ? _self.currentStageTitle : currentStageTitle // ignore: cast_nullable_to_non_nullable
as String,completedStages: null == completedStages ? _self.completedStages : completedStages // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as int,documentCount: null == documentCount ? _self.documentCount : documentCount // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProjectSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientSummaryDtoCopyWith<$Res> get client {
  
  return $ClientSummaryDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}

// dart format on

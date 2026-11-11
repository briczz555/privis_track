// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectModel {

 String get id; String get code; String get name; String get client; ProjectStatus get status; int get currentStage; String get currentStageTitle; int get completedStages; int get progressPercent; int get documentCount; DateTime? get dueDate; DateTime get updatedAt;
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<ProjectModel> get copyWith => _$ProjectModelCopyWithImpl<ProjectModel>(this as ProjectModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.client, _this.client) || other.client == _this.client)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.currentStage, _this.currentStage) || other.currentStage == _this.currentStage)&&(identical(other.currentStageTitle, _this.currentStageTitle) || other.currentStageTitle == _this.currentStageTitle)&&(identical(other.completedStages, _this.completedStages) || other.completedStages == _this.completedStages)&&(identical(other.progressPercent, _this.progressPercent) || other.progressPercent == _this.progressPercent)&&(identical(other.documentCount, _this.documentCount) || other.documentCount == _this.documentCount)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as ProjectModel;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.client,_this.status,_this.currentStage,_this.currentStageTitle,_this.completedStages,_this.progressPercent,_this.documentCount,_this.dueDate,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ProjectModel;
  return 'ProjectModel(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, client: ${_this.client}, status: ${_this.status}, currentStage: ${_this.currentStage}, currentStageTitle: ${_this.currentStageTitle}, completedStages: ${_this.completedStages}, progressPercent: ${_this.progressPercent}, documentCount: ${_this.documentCount}, dueDate: ${_this.dueDate}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, String client, ProjectStatus status, int currentStage, String currentStageTitle, int completedStages, int progressPercent, int documentCount, DateTime? dueDate, DateTime updatedAt
});




}
/// @nodoc
class _$ProjectModelCopyWithImpl<$Res>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? currentStageTitle = null,Object? completedStages = null,Object? progressPercent = null,Object? documentCount = null,Object? dueDate = freezed,Object? updatedAt = null,}) {
  return _then(ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,currentStageTitle: null == currentStageTitle ? _self.currentStageTitle : currentStageTitle // ignore: cast_nullable_to_non_nullable
as String,completedStages: null == completedStages ? _self.completedStages : completedStages // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as int,documentCount: null == documentCount ? _self.documentCount : documentCount // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String client,  ProjectStatus status,  int currentStage,  String currentStageTitle,  int completedStages,  int progressPercent,  int documentCount,  DateTime? dueDate,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String client,  ProjectStatus status,  int currentStage,  String currentStageTitle,  int completedStages,  int progressPercent,  int documentCount,  DateTime? dueDate,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  String client,  ProjectStatus status,  int currentStage,  String currentStageTitle,  int completedStages,  int progressPercent,  int documentCount,  DateTime? dueDate,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.completedStages,_that.progressPercent,_that.documentCount,_that.dueDate,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectModel extends ProjectModel {
  const _ProjectModel({required this.id, required this.code, required this.name, required this.client, required this.status, required this.currentStage, required this.currentStageTitle, required this.completedStages, required this.progressPercent, required this.documentCount, this.dueDate, required this.updatedAt}): super._();
  

@override final  String id;
@override final  String code;
@override final  String name;
@override final  String client;
@override final  ProjectStatus status;
@override final  int currentStage;
@override final  String currentStageTitle;
@override final  int completedStages;
@override final  int progressPercent;
@override final  int documentCount;
@override final  DateTime? dueDate;
@override final  DateTime updatedAt;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectModelCopyWith<_ProjectModel> get copyWith => __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.client, client) || other.client == client)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&(identical(other.currentStageTitle, currentStageTitle) || other.currentStageTitle == currentStageTitle)&&(identical(other.completedStages, completedStages) || other.completedStages == completedStages)&&(identical(other.progressPercent, progressPercent) || other.progressPercent == progressPercent)&&(identical(other.documentCount, documentCount) || other.documentCount == documentCount)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,client,status,currentStage,currentStageTitle,completedStages,progressPercent,documentCount,dueDate,updatedAt);
}

@override
String toString() {
    return 'ProjectModel(id: $id, code: $code, name: $name, client: $client, status: $status, currentStage: $currentStage, currentStageTitle: $currentStageTitle, completedStages: $completedStages, progressPercent: $progressPercent, documentCount: $documentCount, dueDate: $dueDate, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, String client, ProjectStatus status, int currentStage, String currentStageTitle, int completedStages, int progressPercent, int documentCount, DateTime? dueDate, DateTime updatedAt
});




}
/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? currentStageTitle = null,Object? completedStages = null,Object? progressPercent = null,Object? documentCount = null,Object? dueDate = freezed,Object? updatedAt = null,}) {
  return _then(_ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,currentStageTitle: null == currentStageTitle ? _self.currentStageTitle : currentStageTitle // ignore: cast_nullable_to_non_nullable
as String,completedStages: null == completedStages ? _self.completedStages : completedStages // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as int,documentCount: null == documentCount ? _self.documentCount : documentCount // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

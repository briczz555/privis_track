// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectEntity {

 String get id; String get name; String get client; ProjectStatus get status; int get currentStage; String get currentStageTitle; int get documentCount; DateTime? get dueDate;
/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectEntityCopyWith<ProjectEntity> get copyWith => _$ProjectEntityCopyWithImpl<ProjectEntity>(this as ProjectEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.client, _this.client) || other.client == _this.client)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.currentStage, _this.currentStage) || other.currentStage == _this.currentStage)&&(identical(other.currentStageTitle, _this.currentStageTitle) || other.currentStageTitle == _this.currentStageTitle)&&(identical(other.documentCount, _this.documentCount) || other.documentCount == _this.documentCount)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate));
}


@override
int get hashCode {
  final _this = this as ProjectEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.client,_this.status,_this.currentStage,_this.currentStageTitle,_this.documentCount,_this.dueDate);
}

@override
String toString() {
  final _this = this as ProjectEntity;
  return 'ProjectEntity(id: ${_this.id}, name: ${_this.name}, client: ${_this.client}, status: ${_this.status}, currentStage: ${_this.currentStage}, currentStageTitle: ${_this.currentStageTitle}, documentCount: ${_this.documentCount}, dueDate: ${_this.dueDate})';
}


}

/// @nodoc
abstract mixin class $ProjectEntityCopyWith<$Res>  {
  factory $ProjectEntityCopyWith(ProjectEntity value, $Res Function(ProjectEntity) _then) = _$ProjectEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String client, ProjectStatus status, int currentStage, String currentStageTitle, int documentCount, DateTime? dueDate
});




}
/// @nodoc
class _$ProjectEntityCopyWithImpl<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  _$ProjectEntityCopyWithImpl(this._self, this._then);

  final ProjectEntity _self;
  final $Res Function(ProjectEntity) _then;

/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? currentStageTitle = null,Object? documentCount = null,Object? dueDate = freezed,}) {
  return _then(ProjectEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,currentStageTitle: null == currentStageTitle ? _self.currentStageTitle : currentStageTitle // ignore: cast_nullable_to_non_nullable
as String,documentCount: null == documentCount ? _self.documentCount : documentCount // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectEntity].
extension ProjectEntityPatterns on ProjectEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProjectEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String client,  ProjectStatus status,  int currentStage,  String currentStageTitle,  int documentCount,  DateTime? dueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
return $default(_that.id,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.documentCount,_that.dueDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String client,  ProjectStatus status,  int currentStage,  String currentStageTitle,  int documentCount,  DateTime? dueDate)  $default,) {final _that = this;
switch (_that) {
case _ProjectEntity():
return $default(_that.id,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.documentCount,_that.dueDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String client,  ProjectStatus status,  int currentStage,  String currentStageTitle,  int documentCount,  DateTime? dueDate)?  $default,) {final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
return $default(_that.id,_that.name,_that.client,_that.status,_that.currentStage,_that.currentStageTitle,_that.documentCount,_that.dueDate);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectEntity extends ProjectEntity {
  const _ProjectEntity({required this.id, required this.name, required this.client, required this.status, required this.currentStage, required this.currentStageTitle, required this.documentCount, this.dueDate}): super._();
  

@override final  String id;
@override final  String name;
@override final  String client;
@override final  ProjectStatus status;
@override final  int currentStage;
@override final  String currentStageTitle;
@override final  int documentCount;
@override final  DateTime? dueDate;

/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectEntityCopyWith<_ProjectEntity> get copyWith => __$ProjectEntityCopyWithImpl<_ProjectEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.client, client) || other.client == client)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&(identical(other.currentStageTitle, currentStageTitle) || other.currentStageTitle == currentStageTitle)&&(identical(other.documentCount, documentCount) || other.documentCount == documentCount)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,client,status,currentStage,currentStageTitle,documentCount,dueDate);
}

@override
String toString() {
    return 'ProjectEntity(id: $id, name: $name, client: $client, status: $status, currentStage: $currentStage, currentStageTitle: $currentStageTitle, documentCount: $documentCount, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$ProjectEntityCopyWith<$Res> implements $ProjectEntityCopyWith<$Res> {
  factory _$ProjectEntityCopyWith(_ProjectEntity value, $Res Function(_ProjectEntity) _then) = __$ProjectEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String client, ProjectStatus status, int currentStage, String currentStageTitle, int documentCount, DateTime? dueDate
});




}
/// @nodoc
class __$ProjectEntityCopyWithImpl<$Res>
    implements _$ProjectEntityCopyWith<$Res> {
  __$ProjectEntityCopyWithImpl(this._self, this._then);

  final _ProjectEntity _self;
  final $Res Function(_ProjectEntity) _then;

/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? currentStageTitle = null,Object? documentCount = null,Object? dueDate = freezed,}) {
  return _then(_ProjectEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,currentStageTitle: null == currentStageTitle ? _self.currentStageTitle : currentStageTitle // ignore: cast_nullable_to_non_nullable
as String,documentCount: null == documentCount ? _self.documentCount : documentCount // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

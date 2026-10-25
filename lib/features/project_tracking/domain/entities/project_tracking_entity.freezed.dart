// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_tracking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectTrackingEntity {

 String get id; String get name; String get client; ProjectStatus get status; int get currentStage; List<ProjectStageEntity> get stages;
/// Create a copy of ProjectTrackingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectTrackingEntityCopyWith<ProjectTrackingEntity> get copyWith => _$ProjectTrackingEntityCopyWithImpl<ProjectTrackingEntity>(this as ProjectTrackingEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectTrackingEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectTrackingEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.client, _this.client) || other.client == _this.client)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.currentStage, _this.currentStage) || other.currentStage == _this.currentStage)&&const DeepCollectionEquality().equals(other.stages, _this.stages));
}


@override
int get hashCode {
  final _this = this as ProjectTrackingEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.client,_this.status,_this.currentStage,const DeepCollectionEquality().hash(_this.stages));
}

@override
String toString() {
  final _this = this as ProjectTrackingEntity;
  return 'ProjectTrackingEntity(id: ${_this.id}, name: ${_this.name}, client: ${_this.client}, status: ${_this.status}, currentStage: ${_this.currentStage}, stages: ${_this.stages})';
}


}

/// @nodoc
abstract mixin class $ProjectTrackingEntityCopyWith<$Res>  {
  factory $ProjectTrackingEntityCopyWith(ProjectTrackingEntity value, $Res Function(ProjectTrackingEntity) _then) = _$ProjectTrackingEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String client, ProjectStatus status, int currentStage, List<ProjectStageEntity> stages
});




}
/// @nodoc
class _$ProjectTrackingEntityCopyWithImpl<$Res>
    implements $ProjectTrackingEntityCopyWith<$Res> {
  _$ProjectTrackingEntityCopyWithImpl(this._self, this._then);

  final ProjectTrackingEntity _self;
  final $Res Function(ProjectTrackingEntity) _then;

/// Create a copy of ProjectTrackingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? stages = null,}) {
  return _then(ProjectTrackingEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,stages: null == stages ? _self.stages : stages // ignore: cast_nullable_to_non_nullable
as List<ProjectStageEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectTrackingEntity].
extension ProjectTrackingEntityPatterns on ProjectTrackingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectTrackingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectTrackingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectTrackingEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProjectTrackingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectTrackingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectTrackingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String client,  ProjectStatus status,  int currentStage,  List<ProjectStageEntity> stages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectTrackingEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String client,  ProjectStatus status,  int currentStage,  List<ProjectStageEntity> stages)  $default,) {final _that = this;
switch (_that) {
case _ProjectTrackingEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String client,  ProjectStatus status,  int currentStage,  List<ProjectStageEntity> stages)?  $default,) {final _that = this;
switch (_that) {
case _ProjectTrackingEntity() when $default != null:
return $default(_that.id,_that.name,_that.client,_that.status,_that.currentStage,_that.stages);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectTrackingEntity extends ProjectTrackingEntity {
  const _ProjectTrackingEntity({required this.id, required this.name, required this.client, required this.status, required this.currentStage, required  List<ProjectStageEntity> stages}): _stages = stages,super._();
  

@override final  String id;
@override final  String name;
@override final  String client;
@override final  ProjectStatus status;
@override final  int currentStage;
 final  List<ProjectStageEntity> _stages;
@override List<ProjectStageEntity> get stages {
  if (_stages is EqualUnmodifiableListView) return _stages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stages);
}


/// Create a copy of ProjectTrackingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectTrackingEntityCopyWith<_ProjectTrackingEntity> get copyWith => __$ProjectTrackingEntityCopyWithImpl<_ProjectTrackingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectTrackingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.client, client) || other.client == client)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&const DeepCollectionEquality().equals(other.stages, _stages));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,client,status,currentStage,const DeepCollectionEquality().hash(_stages));
}

@override
String toString() {
    return 'ProjectTrackingEntity(id: $id, name: $name, client: $client, status: $status, currentStage: $currentStage, stages: $stages)';
}


}

/// @nodoc
abstract mixin class _$ProjectTrackingEntityCopyWith<$Res> implements $ProjectTrackingEntityCopyWith<$Res> {
  factory _$ProjectTrackingEntityCopyWith(_ProjectTrackingEntity value, $Res Function(_ProjectTrackingEntity) _then) = __$ProjectTrackingEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String client, ProjectStatus status, int currentStage, List<ProjectStageEntity> stages
});




}
/// @nodoc
class __$ProjectTrackingEntityCopyWithImpl<$Res>
    implements _$ProjectTrackingEntityCopyWith<$Res> {
  __$ProjectTrackingEntityCopyWithImpl(this._self, this._then);

  final _ProjectTrackingEntity _self;
  final $Res Function(_ProjectTrackingEntity) _then;

/// Create a copy of ProjectTrackingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? client = null,Object? status = null,Object? currentStage = null,Object? stages = null,}) {
  return _then(_ProjectTrackingEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as int,stages: null == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<ProjectStageEntity>,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityEntity {

 String get id; String get actor; String get division; String get action; String get target; String get projectName; DateTime get occurredAt;
/// Create a copy of ActivityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityEntityCopyWith<ActivityEntity> get copyWith => _$ActivityEntityCopyWithImpl<ActivityEntity>(this as ActivityEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ActivityEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.actor, _this.actor) || other.actor == _this.actor)&&(identical(other.division, _this.division) || other.division == _this.division)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.projectName, _this.projectName) || other.projectName == _this.projectName)&&(identical(other.occurredAt, _this.occurredAt) || other.occurredAt == _this.occurredAt));
}


@override
int get hashCode {
  final _this = this as ActivityEntity;
  return Object.hash(runtimeType,_this.id,_this.actor,_this.division,_this.action,_this.target,_this.projectName,_this.occurredAt);
}

@override
String toString() {
  final _this = this as ActivityEntity;
  return 'ActivityEntity(id: ${_this.id}, actor: ${_this.actor}, division: ${_this.division}, action: ${_this.action}, target: ${_this.target}, projectName: ${_this.projectName}, occurredAt: ${_this.occurredAt})';
}


}

/// @nodoc
abstract mixin class $ActivityEntityCopyWith<$Res>  {
  factory $ActivityEntityCopyWith(ActivityEntity value, $Res Function(ActivityEntity) _then) = _$ActivityEntityCopyWithImpl;
@useResult
$Res call({
 String id, String actor, String division, String action, String target, String projectName, DateTime occurredAt
});




}
/// @nodoc
class _$ActivityEntityCopyWithImpl<$Res>
    implements $ActivityEntityCopyWith<$Res> {
  _$ActivityEntityCopyWithImpl(this._self, this._then);

  final ActivityEntity _self;
  final $Res Function(ActivityEntity) _then;

/// Create a copy of ActivityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? actor = null,Object? division = null,Object? action = null,Object? target = null,Object? projectName = null,Object? occurredAt = null,}) {
  return _then(ActivityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String,division: null == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityEntity].
extension ActivityEntityPatterns on ActivityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityEntity value)  $default,){
final _that = this;
switch (_that) {
case _ActivityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String actor,  String division,  String action,  String target,  String projectName,  DateTime occurredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityEntity() when $default != null:
return $default(_that.id,_that.actor,_that.division,_that.action,_that.target,_that.projectName,_that.occurredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String actor,  String division,  String action,  String target,  String projectName,  DateTime occurredAt)  $default,) {final _that = this;
switch (_that) {
case _ActivityEntity():
return $default(_that.id,_that.actor,_that.division,_that.action,_that.target,_that.projectName,_that.occurredAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String actor,  String division,  String action,  String target,  String projectName,  DateTime occurredAt)?  $default,) {final _that = this;
switch (_that) {
case _ActivityEntity() when $default != null:
return $default(_that.id,_that.actor,_that.division,_that.action,_that.target,_that.projectName,_that.occurredAt);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityEntity implements ActivityEntity {
  const _ActivityEntity({required this.id, required this.actor, required this.division, required this.action, required this.target, required this.projectName, required this.occurredAt});
  

@override final  String id;
@override final  String actor;
@override final  String division;
@override final  String action;
@override final  String target;
@override final  String projectName;
@override final  DateTime occurredAt;

/// Create a copy of ActivityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityEntityCopyWith<_ActivityEntity> get copyWith => __$ActivityEntityCopyWithImpl<_ActivityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.division, division) || other.division == division)&&(identical(other.action, action) || other.action == action)&&(identical(other.target, target) || other.target == target)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,actor,division,action,target,projectName,occurredAt);
}

@override
String toString() {
    return 'ActivityEntity(id: $id, actor: $actor, division: $division, action: $action, target: $target, projectName: $projectName, occurredAt: $occurredAt)';
}


}

/// @nodoc
abstract mixin class _$ActivityEntityCopyWith<$Res> implements $ActivityEntityCopyWith<$Res> {
  factory _$ActivityEntityCopyWith(_ActivityEntity value, $Res Function(_ActivityEntity) _then) = __$ActivityEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String actor, String division, String action, String target, String projectName, DateTime occurredAt
});




}
/// @nodoc
class __$ActivityEntityCopyWithImpl<$Res>
    implements _$ActivityEntityCopyWith<$Res> {
  __$ActivityEntityCopyWithImpl(this._self, this._then);

  final _ActivityEntity _self;
  final $Res Function(_ActivityEntity) _then;

/// Create a copy of ActivityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actor = null,Object? division = null,Object? action = null,Object? target = null,Object? projectName = null,Object? occurredAt = null,}) {
  return _then(_ActivityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String,division: null == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

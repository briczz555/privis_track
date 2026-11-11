// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityDto {

 String get id; String get type; ActivityActorDto get actor; String get action; String get target; ActivityProjectDto get project;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of ActivityDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityDtoCopyWith<ActivityDto> get copyWith => _$ActivityDtoCopyWithImpl<ActivityDto>(this as ActivityDto, _$identity);

  /// Serializes this ActivityDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ActivityDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.actor, _this.actor) || other.actor == _this.actor)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.project, _this.project) || other.project == _this.project)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ActivityDto;
  return Object.hash(runtimeType,_this.id,_this.type,_this.actor,_this.action,_this.target,_this.project,_this.createdAt);
}

@override
String toString() {
  final _this = this as ActivityDto;
  return 'ActivityDto(id: ${_this.id}, type: ${_this.type}, actor: ${_this.actor}, action: ${_this.action}, target: ${_this.target}, project: ${_this.project}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ActivityDtoCopyWith<$Res>  {
  factory $ActivityDtoCopyWith(ActivityDto value, $Res Function(ActivityDto) _then) = _$ActivityDtoCopyWithImpl;
@useResult
$Res call({
 String id, String type, ActivityActorDto actor, String action, String target, ActivityProjectDto project,@JsonKey(name: 'created_at') String createdAt
});


$ActivityActorDtoCopyWith<$Res> get actor;$ActivityProjectDtoCopyWith<$Res> get project;

}
/// @nodoc
class _$ActivityDtoCopyWithImpl<$Res>
    implements $ActivityDtoCopyWith<$Res> {
  _$ActivityDtoCopyWithImpl(this._self, this._then);

  final ActivityDto _self;
  final $Res Function(ActivityDto) _then;

/// Create a copy of ActivityDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? actor = null,Object? action = null,Object? target = null,Object? project = null,Object? createdAt = null,}) {
  return _then(ActivityDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as ActivityActorDto,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ActivityProjectDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ActivityDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityActorDtoCopyWith<$Res> get actor {
  
  return $ActivityActorDtoCopyWith<$Res>(_self.actor, (value) {
    return _then(_self.copyWith(actor: value));
  });
}/// Create a copy of ActivityDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityProjectDtoCopyWith<$Res> get project {
  
  return $ActivityProjectDtoCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActivityDto].
extension ActivityDtoPatterns on ActivityDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityDto value)  $default,){
final _that = this;
switch (_that) {
case _ActivityDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityDto value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  ActivityActorDto actor,  String action,  String target,  ActivityProjectDto project, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityDto() when $default != null:
return $default(_that.id,_that.type,_that.actor,_that.action,_that.target,_that.project,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  ActivityActorDto actor,  String action,  String target,  ActivityProjectDto project, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _ActivityDto():
return $default(_that.id,_that.type,_that.actor,_that.action,_that.target,_that.project,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  ActivityActorDto actor,  String action,  String target,  ActivityProjectDto project, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ActivityDto() when $default != null:
return $default(_that.id,_that.type,_that.actor,_that.action,_that.target,_that.project,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityDto implements ActivityDto {
  const _ActivityDto({required this.id, required this.type, required this.actor, required this.action, required this.target, required this.project, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ActivityDto.fromJson(Map<String, dynamic> json) => _$ActivityDtoFromJson(json);

@override final  String id;
@override final  String type;
@override final  ActivityActorDto actor;
@override final  String action;
@override final  String target;
@override final  ActivityProjectDto project;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of ActivityDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityDtoCopyWith<_ActivityDto> get copyWith => __$ActivityDtoCopyWithImpl<_ActivityDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.action, action) || other.action == action)&&(identical(other.target, target) || other.target == target)&&(identical(other.project, project) || other.project == project)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,actor,action,target,project,createdAt);
}

@override
String toString() {
    return 'ActivityDto(id: $id, type: $type, actor: $actor, action: $action, target: $target, project: $project, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ActivityDtoCopyWith<$Res> implements $ActivityDtoCopyWith<$Res> {
  factory _$ActivityDtoCopyWith(_ActivityDto value, $Res Function(_ActivityDto) _then) = __$ActivityDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, ActivityActorDto actor, String action, String target, ActivityProjectDto project,@JsonKey(name: 'created_at') String createdAt
});


@override $ActivityActorDtoCopyWith<$Res> get actor;@override $ActivityProjectDtoCopyWith<$Res> get project;

}
/// @nodoc
class __$ActivityDtoCopyWithImpl<$Res>
    implements _$ActivityDtoCopyWith<$Res> {
  __$ActivityDtoCopyWithImpl(this._self, this._then);

  final _ActivityDto _self;
  final $Res Function(_ActivityDto) _then;

/// Create a copy of ActivityDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? actor = null,Object? action = null,Object? target = null,Object? project = null,Object? createdAt = null,}) {
  return _then(_ActivityDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as ActivityActorDto,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ActivityProjectDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ActivityDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityActorDtoCopyWith<$Res> get actor {
  
  return $ActivityActorDtoCopyWith<$Res>(_self.actor, (value) {
    return _then(_self.copyWith(actor: value));
  });
}/// Create a copy of ActivityDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityProjectDtoCopyWith<$Res> get project {
  
  return $ActivityProjectDtoCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on

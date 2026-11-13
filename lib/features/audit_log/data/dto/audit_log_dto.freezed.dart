// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLogDto {

 String get id;@JsonKey(name: 'actor_name') String get actorName;@JsonKey(name: 'actor_role') String get actorRole; String get action; String get entity;@JsonKey(name: 'entity_id') String? get entityId; String get summary;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of AuditLogDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogDtoCopyWith<AuditLogDto> get copyWith => _$AuditLogDtoCopyWithImpl<AuditLogDto>(this as AuditLogDto, _$identity);

  /// Serializes this AuditLogDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuditLogDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLogDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.actorName, _this.actorName) || other.actorName == _this.actorName)&&(identical(other.actorRole, _this.actorRole) || other.actorRole == _this.actorRole)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.entity, _this.entity) || other.entity == _this.entity)&&(identical(other.entityId, _this.entityId) || other.entityId == _this.entityId)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuditLogDto;
  return Object.hash(runtimeType,_this.id,_this.actorName,_this.actorRole,_this.action,_this.entity,_this.entityId,_this.summary,_this.createdAt);
}

@override
String toString() {
  final _this = this as AuditLogDto;
  return 'AuditLogDto(id: ${_this.id}, actorName: ${_this.actorName}, actorRole: ${_this.actorRole}, action: ${_this.action}, entity: ${_this.entity}, entityId: ${_this.entityId}, summary: ${_this.summary}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $AuditLogDtoCopyWith<$Res>  {
  factory $AuditLogDtoCopyWith(AuditLogDto value, $Res Function(AuditLogDto) _then) = _$AuditLogDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'actor_name') String actorName,@JsonKey(name: 'actor_role') String actorRole, String action, String entity,@JsonKey(name: 'entity_id') String? entityId, String summary,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$AuditLogDtoCopyWithImpl<$Res>
    implements $AuditLogDtoCopyWith<$Res> {
  _$AuditLogDtoCopyWithImpl(this._self, this._then);

  final AuditLogDto _self;
  final $Res Function(AuditLogDto) _then;

/// Create a copy of AuditLogDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? actorName = null,Object? actorRole = null,Object? action = null,Object? entity = null,Object? entityId = freezed,Object? summary = null,Object? createdAt = null,}) {
  return _then(AuditLogDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actorName: null == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as String,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLogDto].
extension AuditLogDtoPatterns on AuditLogDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLogDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLogDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLogDto value)  $default,){
final _that = this;
switch (_that) {
case _AuditLogDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLogDto value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLogDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'actor_name')  String actorName, @JsonKey(name: 'actor_role')  String actorRole,  String action,  String entity, @JsonKey(name: 'entity_id')  String? entityId,  String summary, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLogDto() when $default != null:
return $default(_that.id,_that.actorName,_that.actorRole,_that.action,_that.entity,_that.entityId,_that.summary,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'actor_name')  String actorName, @JsonKey(name: 'actor_role')  String actorRole,  String action,  String entity, @JsonKey(name: 'entity_id')  String? entityId,  String summary, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AuditLogDto():
return $default(_that.id,_that.actorName,_that.actorRole,_that.action,_that.entity,_that.entityId,_that.summary,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'actor_name')  String actorName, @JsonKey(name: 'actor_role')  String actorRole,  String action,  String entity, @JsonKey(name: 'entity_id')  String? entityId,  String summary, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AuditLogDto() when $default != null:
return $default(_that.id,_that.actorName,_that.actorRole,_that.action,_that.entity,_that.entityId,_that.summary,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLogDto implements AuditLogDto {
  const _AuditLogDto({required this.id, @JsonKey(name: 'actor_name') required this.actorName, @JsonKey(name: 'actor_role') required this.actorRole, required this.action, required this.entity, @JsonKey(name: 'entity_id') this.entityId, required this.summary, @JsonKey(name: 'created_at') required this.createdAt});
  factory _AuditLogDto.fromJson(Map<String, dynamic> json) => _$AuditLogDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'actor_name') final  String actorName;
@override@JsonKey(name: 'actor_role') final  String actorRole;
@override final  String action;
@override final  String entity;
@override@JsonKey(name: 'entity_id') final  String? entityId;
@override final  String summary;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of AuditLogDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogDtoCopyWith<_AuditLogDto> get copyWith => __$AuditLogDtoCopyWithImpl<_AuditLogDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.actorName, actorName) || other.actorName == actorName)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.action, action) || other.action == action)&&(identical(other.entity, entity) || other.entity == entity)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,actorName,actorRole,action,entity,entityId,summary,createdAt);
}

@override
String toString() {
    return 'AuditLogDto(id: $id, actorName: $actorName, actorRole: $actorRole, action: $action, entity: $entity, entityId: $entityId, summary: $summary, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AuditLogDtoCopyWith<$Res> implements $AuditLogDtoCopyWith<$Res> {
  factory _$AuditLogDtoCopyWith(_AuditLogDto value, $Res Function(_AuditLogDto) _then) = __$AuditLogDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'actor_name') String actorName,@JsonKey(name: 'actor_role') String actorRole, String action, String entity,@JsonKey(name: 'entity_id') String? entityId, String summary,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$AuditLogDtoCopyWithImpl<$Res>
    implements _$AuditLogDtoCopyWith<$Res> {
  __$AuditLogDtoCopyWithImpl(this._self, this._then);

  final _AuditLogDto _self;
  final $Res Function(_AuditLogDto) _then;

/// Create a copy of AuditLogDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actorName = null,Object? actorRole = null,Object? action = null,Object? entity = null,Object? entityId = freezed,Object? summary = null,Object? createdAt = null,}) {
  return _then(_AuditLogDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actorName: null == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as String,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

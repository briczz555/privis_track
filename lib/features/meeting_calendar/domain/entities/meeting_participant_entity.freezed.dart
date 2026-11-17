// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_participant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingParticipantEntity {

 String get id; String get name; AuthRole get role; String? get division;
/// Create a copy of MeetingParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingParticipantEntityCopyWith<MeetingParticipantEntity> get copyWith => _$MeetingParticipantEntityCopyWithImpl<MeetingParticipantEntity>(this as MeetingParticipantEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MeetingParticipantEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingParticipantEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.division, _this.division) || other.division == _this.division));
}


@override
int get hashCode {
  final _this = this as MeetingParticipantEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.role,_this.division);
}

@override
String toString() {
  final _this = this as MeetingParticipantEntity;
  return 'MeetingParticipantEntity(id: ${_this.id}, name: ${_this.name}, role: ${_this.role}, division: ${_this.division})';
}


}

/// @nodoc
abstract mixin class $MeetingParticipantEntityCopyWith<$Res>  {
  factory $MeetingParticipantEntityCopyWith(MeetingParticipantEntity value, $Res Function(MeetingParticipantEntity) _then) = _$MeetingParticipantEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, AuthRole role, String? division
});




}
/// @nodoc
class _$MeetingParticipantEntityCopyWithImpl<$Res>
    implements $MeetingParticipantEntityCopyWith<$Res> {
  _$MeetingParticipantEntityCopyWithImpl(this._self, this._then);

  final MeetingParticipantEntity _self;
  final $Res Function(MeetingParticipantEntity) _then;

/// Create a copy of MeetingParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,Object? division = freezed,}) {
  return _then(MeetingParticipantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AuthRole,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MeetingParticipantEntity].
extension MeetingParticipantEntityPatterns on MeetingParticipantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeetingParticipantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeetingParticipantEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeetingParticipantEntity value)  $default,){
final _that = this;
switch (_that) {
case _MeetingParticipantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeetingParticipantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MeetingParticipantEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  AuthRole role,  String? division)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeetingParticipantEntity() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.division);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  AuthRole role,  String? division)  $default,) {final _that = this;
switch (_that) {
case _MeetingParticipantEntity():
return $default(_that.id,_that.name,_that.role,_that.division);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  AuthRole role,  String? division)?  $default,) {final _that = this;
switch (_that) {
case _MeetingParticipantEntity() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.division);case _:
  return null;

}
}

}

/// @nodoc


class _MeetingParticipantEntity implements MeetingParticipantEntity {
  const _MeetingParticipantEntity({required this.id, required this.name, required this.role, this.division});
  

@override final  String id;
@override final  String name;
@override final  AuthRole role;
@override final  String? division;

/// Create a copy of MeetingParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeetingParticipantEntityCopyWith<_MeetingParticipantEntity> get copyWith => __$MeetingParticipantEntityCopyWithImpl<_MeetingParticipantEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeetingParticipantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.division, division) || other.division == division));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,role,division);
}

@override
String toString() {
    return 'MeetingParticipantEntity(id: $id, name: $name, role: $role, division: $division)';
}


}

/// @nodoc
abstract mixin class _$MeetingParticipantEntityCopyWith<$Res> implements $MeetingParticipantEntityCopyWith<$Res> {
  factory _$MeetingParticipantEntityCopyWith(_MeetingParticipantEntity value, $Res Function(_MeetingParticipantEntity) _then) = __$MeetingParticipantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, AuthRole role, String? division
});




}
/// @nodoc
class __$MeetingParticipantEntityCopyWithImpl<$Res>
    implements _$MeetingParticipantEntityCopyWith<$Res> {
  __$MeetingParticipantEntityCopyWithImpl(this._self, this._then);

  final _MeetingParticipantEntity _self;
  final $Res Function(_MeetingParticipantEntity) _then;

/// Create a copy of MeetingParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,Object? division = freezed,}) {
  return _then(_MeetingParticipantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AuthRole,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

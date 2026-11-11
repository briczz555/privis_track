// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'managed_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManagedUserEntity {

 String get id; String get name; String get email; AuthRole get role; String? get division; bool get isActive; DateTime get createdAt;
/// Create a copy of ManagedUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedUserEntityCopyWith<ManagedUserEntity> get copyWith => _$ManagedUserEntityCopyWithImpl<ManagedUserEntity>(this as ManagedUserEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ManagedUserEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedUserEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.division, _this.division) || other.division == _this.division)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as ManagedUserEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.email,_this.role,_this.division,_this.isActive,_this.createdAt);
}

@override
String toString() {
  final _this = this as ManagedUserEntity;
  return 'ManagedUserEntity(id: ${_this.id}, name: ${_this.name}, email: ${_this.email}, role: ${_this.role}, division: ${_this.division}, isActive: ${_this.isActive}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ManagedUserEntityCopyWith<$Res>  {
  factory $ManagedUserEntityCopyWith(ManagedUserEntity value, $Res Function(ManagedUserEntity) _then) = _$ManagedUserEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, AuthRole role, String? division, bool isActive, DateTime createdAt
});




}
/// @nodoc
class _$ManagedUserEntityCopyWithImpl<$Res>
    implements $ManagedUserEntityCopyWith<$Res> {
  _$ManagedUserEntityCopyWithImpl(this._self, this._then);

  final ManagedUserEntity _self;
  final $Res Function(ManagedUserEntity) _then;

/// Create a copy of ManagedUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? division = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(ManagedUserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AuthRole,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagedUserEntity].
extension ManagedUserEntityPatterns on ManagedUserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedUserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedUserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedUserEntity value)  $default,){
final _that = this;
switch (_that) {
case _ManagedUserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedUserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedUserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  AuthRole role,  String? division,  bool isActive,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedUserEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.division,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  AuthRole role,  String? division,  bool isActive,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ManagedUserEntity():
return $default(_that.id,_that.name,_that.email,_that.role,_that.division,_that.isActive,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  AuthRole role,  String? division,  bool isActive,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ManagedUserEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.division,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ManagedUserEntity implements ManagedUserEntity {
  const _ManagedUserEntity({required this.id, required this.name, required this.email, required this.role, this.division, required this.isActive, required this.createdAt});
  

@override final  String id;
@override final  String name;
@override final  String email;
@override final  AuthRole role;
@override final  String? division;
@override final  bool isActive;
@override final  DateTime createdAt;

/// Create a copy of ManagedUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedUserEntityCopyWith<_ManagedUserEntity> get copyWith => __$ManagedUserEntityCopyWithImpl<_ManagedUserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.division, division) || other.division == division)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,email,role,division,isActive,createdAt);
}

@override
String toString() {
    return 'ManagedUserEntity(id: $id, name: $name, email: $email, role: $role, division: $division, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ManagedUserEntityCopyWith<$Res> implements $ManagedUserEntityCopyWith<$Res> {
  factory _$ManagedUserEntityCopyWith(_ManagedUserEntity value, $Res Function(_ManagedUserEntity) _then) = __$ManagedUserEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, AuthRole role, String? division, bool isActive, DateTime createdAt
});




}
/// @nodoc
class __$ManagedUserEntityCopyWithImpl<$Res>
    implements _$ManagedUserEntityCopyWith<$Res> {
  __$ManagedUserEntityCopyWithImpl(this._self, this._then);

  final _ManagedUserEntity _self;
  final $Res Function(_ManagedUserEntity) _then;

/// Create a copy of ManagedUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? division = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_ManagedUserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AuthRole,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

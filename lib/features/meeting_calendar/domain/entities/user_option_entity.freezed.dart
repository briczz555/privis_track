// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_option_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserOptionEntity {

 String get id; String get name; AuthRole get role; String? get division;
/// Create a copy of UserOptionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserOptionEntityCopyWith<UserOptionEntity> get copyWith => _$UserOptionEntityCopyWithImpl<UserOptionEntity>(this as UserOptionEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UserOptionEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOptionEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.division, _this.division) || other.division == _this.division));
}


@override
int get hashCode {
  final _this = this as UserOptionEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.role,_this.division);
}

@override
String toString() {
  final _this = this as UserOptionEntity;
  return 'UserOptionEntity(id: ${_this.id}, name: ${_this.name}, role: ${_this.role}, division: ${_this.division})';
}


}

/// @nodoc
abstract mixin class $UserOptionEntityCopyWith<$Res>  {
  factory $UserOptionEntityCopyWith(UserOptionEntity value, $Res Function(UserOptionEntity) _then) = _$UserOptionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, AuthRole role, String? division
});




}
/// @nodoc
class _$UserOptionEntityCopyWithImpl<$Res>
    implements $UserOptionEntityCopyWith<$Res> {
  _$UserOptionEntityCopyWithImpl(this._self, this._then);

  final UserOptionEntity _self;
  final $Res Function(UserOptionEntity) _then;

/// Create a copy of UserOptionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,Object? division = freezed,}) {
  return _then(UserOptionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AuthRole,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserOptionEntity].
extension UserOptionEntityPatterns on UserOptionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserOptionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserOptionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserOptionEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserOptionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserOptionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserOptionEntity() when $default != null:
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
case _UserOptionEntity() when $default != null:
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
case _UserOptionEntity():
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
case _UserOptionEntity() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.division);case _:
  return null;

}
}

}

/// @nodoc


class _UserOptionEntity implements UserOptionEntity {
  const _UserOptionEntity({required this.id, required this.name, required this.role, this.division});
  

@override final  String id;
@override final  String name;
@override final  AuthRole role;
@override final  String? division;

/// Create a copy of UserOptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserOptionEntityCopyWith<_UserOptionEntity> get copyWith => __$UserOptionEntityCopyWithImpl<_UserOptionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserOptionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.division, division) || other.division == division));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,role,division);
}

@override
String toString() {
    return 'UserOptionEntity(id: $id, name: $name, role: $role, division: $division)';
}


}

/// @nodoc
abstract mixin class _$UserOptionEntityCopyWith<$Res> implements $UserOptionEntityCopyWith<$Res> {
  factory _$UserOptionEntityCopyWith(_UserOptionEntity value, $Res Function(_UserOptionEntity) _then) = __$UserOptionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, AuthRole role, String? division
});




}
/// @nodoc
class __$UserOptionEntityCopyWithImpl<$Res>
    implements _$UserOptionEntityCopyWith<$Res> {
  __$UserOptionEntityCopyWithImpl(this._self, this._then);

  final _UserOptionEntity _self;
  final $Res Function(_UserOptionEntity) _then;

/// Create a copy of UserOptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,Object? division = freezed,}) {
  return _then(_UserOptionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AuthRole,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

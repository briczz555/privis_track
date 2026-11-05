// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientInfoEntity {

 String get name; String get address; String get contactName; String get contactRole; String get phone;
/// Create a copy of ClientInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientInfoEntityCopyWith<ClientInfoEntity> get copyWith => _$ClientInfoEntityCopyWithImpl<ClientInfoEntity>(this as ClientInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ClientInfoEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientInfoEntity&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.contactName, _this.contactName) || other.contactName == _this.contactName)&&(identical(other.contactRole, _this.contactRole) || other.contactRole == _this.contactRole)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}


@override
int get hashCode {
  final _this = this as ClientInfoEntity;
  return Object.hash(runtimeType,_this.name,_this.address,_this.contactName,_this.contactRole,_this.phone);
}

@override
String toString() {
  final _this = this as ClientInfoEntity;
  return 'ClientInfoEntity(name: ${_this.name}, address: ${_this.address}, contactName: ${_this.contactName}, contactRole: ${_this.contactRole}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $ClientInfoEntityCopyWith<$Res>  {
  factory $ClientInfoEntityCopyWith(ClientInfoEntity value, $Res Function(ClientInfoEntity) _then) = _$ClientInfoEntityCopyWithImpl;
@useResult
$Res call({
 String name, String address, String contactName, String contactRole, String phone
});




}
/// @nodoc
class _$ClientInfoEntityCopyWithImpl<$Res>
    implements $ClientInfoEntityCopyWith<$Res> {
  _$ClientInfoEntityCopyWithImpl(this._self, this._then);

  final ClientInfoEntity _self;
  final $Res Function(ClientInfoEntity) _then;

/// Create a copy of ClientInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = null,Object? contactName = null,Object? contactRole = null,Object? phone = null,}) {
  return _then(ClientInfoEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,contactRole: null == contactRole ? _self.contactRole : contactRole // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientInfoEntity].
extension ClientInfoEntityPatterns on ClientInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _ClientInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ClientInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String address,  String contactName,  String contactRole,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientInfoEntity() when $default != null:
return $default(_that.name,_that.address,_that.contactName,_that.contactRole,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String address,  String contactName,  String contactRole,  String phone)  $default,) {final _that = this;
switch (_that) {
case _ClientInfoEntity():
return $default(_that.name,_that.address,_that.contactName,_that.contactRole,_that.phone);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String address,  String contactName,  String contactRole,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _ClientInfoEntity() when $default != null:
return $default(_that.name,_that.address,_that.contactName,_that.contactRole,_that.phone);case _:
  return null;

}
}

}

/// @nodoc


class _ClientInfoEntity implements ClientInfoEntity {
  const _ClientInfoEntity({required this.name, required this.address, required this.contactName, required this.contactRole, required this.phone});
  

@override final  String name;
@override final  String address;
@override final  String contactName;
@override final  String contactRole;
@override final  String phone;

/// Create a copy of ClientInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientInfoEntityCopyWith<_ClientInfoEntity> get copyWith => __$ClientInfoEntityCopyWithImpl<_ClientInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientInfoEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactRole, contactRole) || other.contactRole == contactRole)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,address,contactName,contactRole,phone);
}

@override
String toString() {
    return 'ClientInfoEntity(name: $name, address: $address, contactName: $contactName, contactRole: $contactRole, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ClientInfoEntityCopyWith<$Res> implements $ClientInfoEntityCopyWith<$Res> {
  factory _$ClientInfoEntityCopyWith(_ClientInfoEntity value, $Res Function(_ClientInfoEntity) _then) = __$ClientInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String address, String contactName, String contactRole, String phone
});




}
/// @nodoc
class __$ClientInfoEntityCopyWithImpl<$Res>
    implements _$ClientInfoEntityCopyWith<$Res> {
  __$ClientInfoEntityCopyWithImpl(this._self, this._then);

  final _ClientInfoEntity _self;
  final $Res Function(_ClientInfoEntity) _then;

/// Create a copy of ClientInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = null,Object? contactName = null,Object? contactRole = null,Object? phone = null,}) {
  return _then(_ClientInfoEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,contactRole: null == contactRole ? _self.contactRole : contactRole // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

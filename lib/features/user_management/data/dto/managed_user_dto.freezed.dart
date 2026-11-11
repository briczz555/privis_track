// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'managed_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagedUserDto {

 String get id; String get name; String get email; String get role; String? get division;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of ManagedUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedUserDtoCopyWith<ManagedUserDto> get copyWith => _$ManagedUserDtoCopyWithImpl<ManagedUserDto>(this as ManagedUserDto, _$identity);

  /// Serializes this ManagedUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManagedUserDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedUserDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.division, _this.division) || other.division == _this.division)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManagedUserDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.email,_this.role,_this.division,_this.isActive,_this.createdAt);
}

@override
String toString() {
  final _this = this as ManagedUserDto;
  return 'ManagedUserDto(id: ${_this.id}, name: ${_this.name}, email: ${_this.email}, role: ${_this.role}, division: ${_this.division}, isActive: ${_this.isActive}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ManagedUserDtoCopyWith<$Res>  {
  factory $ManagedUserDtoCopyWith(ManagedUserDto value, $Res Function(ManagedUserDto) _then) = _$ManagedUserDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String role, String? division,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$ManagedUserDtoCopyWithImpl<$Res>
    implements $ManagedUserDtoCopyWith<$Res> {
  _$ManagedUserDtoCopyWithImpl(this._self, this._then);

  final ManagedUserDto _self;
  final $Res Function(ManagedUserDto) _then;

/// Create a copy of ManagedUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? division = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(ManagedUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagedUserDto].
extension ManagedUserDtoPatterns on ManagedUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedUserDto value)  $default,){
final _that = this;
switch (_that) {
case _ManagedUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedUserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String role,  String? division, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedUserDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String role,  String? division, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ManagedUserDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String role,  String? division, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ManagedUserDto() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.division,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagedUserDto implements ManagedUserDto {
  const _ManagedUserDto({required this.id, required this.name, required this.email, required this.role, this.division, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ManagedUserDto.fromJson(Map<String, dynamic> json) => _$ManagedUserDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String role;
@override final  String? division;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of ManagedUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedUserDtoCopyWith<_ManagedUserDto> get copyWith => __$ManagedUserDtoCopyWithImpl<_ManagedUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagedUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.division, division) || other.division == division)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,email,role,division,isActive,createdAt);
}

@override
String toString() {
    return 'ManagedUserDto(id: $id, name: $name, email: $email, role: $role, division: $division, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ManagedUserDtoCopyWith<$Res> implements $ManagedUserDtoCopyWith<$Res> {
  factory _$ManagedUserDtoCopyWith(_ManagedUserDto value, $Res Function(_ManagedUserDto) _then) = __$ManagedUserDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String role, String? division,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$ManagedUserDtoCopyWithImpl<$Res>
    implements _$ManagedUserDtoCopyWith<$Res> {
  __$ManagedUserDtoCopyWithImpl(this._self, this._then);

  final _ManagedUserDto _self;
  final $Res Function(_ManagedUserDto) _then;

/// Create a copy of ManagedUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? division = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_ManagedUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

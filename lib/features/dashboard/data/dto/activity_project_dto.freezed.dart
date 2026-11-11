// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_project_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityProjectDto {

 String get id; String get code; String get name;
/// Create a copy of ActivityProjectDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityProjectDtoCopyWith<ActivityProjectDto> get copyWith => _$ActivityProjectDtoCopyWithImpl<ActivityProjectDto>(this as ActivityProjectDto, _$identity);

  /// Serializes this ActivityProjectDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ActivityProjectDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityProjectDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ActivityProjectDto;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name);
}

@override
String toString() {
  final _this = this as ActivityProjectDto;
  return 'ActivityProjectDto(id: ${_this.id}, code: ${_this.code}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $ActivityProjectDtoCopyWith<$Res>  {
  factory $ActivityProjectDtoCopyWith(ActivityProjectDto value, $Res Function(ActivityProjectDto) _then) = _$ActivityProjectDtoCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name
});




}
/// @nodoc
class _$ActivityProjectDtoCopyWithImpl<$Res>
    implements $ActivityProjectDtoCopyWith<$Res> {
  _$ActivityProjectDtoCopyWithImpl(this._self, this._then);

  final ActivityProjectDto _self;
  final $Res Function(ActivityProjectDto) _then;

/// Create a copy of ActivityProjectDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,}) {
  return _then(ActivityProjectDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityProjectDto].
extension ActivityProjectDtoPatterns on ActivityProjectDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityProjectDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityProjectDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityProjectDto value)  $default,){
final _that = this;
switch (_that) {
case _ActivityProjectDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityProjectDto value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityProjectDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityProjectDto() when $default != null:
return $default(_that.id,_that.code,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name)  $default,) {final _that = this;
switch (_that) {
case _ActivityProjectDto():
return $default(_that.id,_that.code,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name)?  $default,) {final _that = this;
switch (_that) {
case _ActivityProjectDto() when $default != null:
return $default(_that.id,_that.code,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityProjectDto implements ActivityProjectDto {
  const _ActivityProjectDto({required this.id, required this.code, required this.name});
  factory _ActivityProjectDto.fromJson(Map<String, dynamic> json) => _$ActivityProjectDtoFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;

/// Create a copy of ActivityProjectDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityProjectDtoCopyWith<_ActivityProjectDto> get copyWith => __$ActivityProjectDtoCopyWithImpl<_ActivityProjectDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityProjectDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityProjectDto&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name);
}

@override
String toString() {
    return 'ActivityProjectDto(id: $id, code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ActivityProjectDtoCopyWith<$Res> implements $ActivityProjectDtoCopyWith<$Res> {
  factory _$ActivityProjectDtoCopyWith(_ActivityProjectDto value, $Res Function(_ActivityProjectDto) _then) = __$ActivityProjectDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name
});




}
/// @nodoc
class __$ActivityProjectDtoCopyWithImpl<$Res>
    implements _$ActivityProjectDtoCopyWith<$Res> {
  __$ActivityProjectDtoCopyWithImpl(this._self, this._then);

  final _ActivityProjectDto _self;
  final $Res Function(_ActivityProjectDto) _then;

/// Create a copy of ActivityProjectDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,}) {
  return _then(_ActivityProjectDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

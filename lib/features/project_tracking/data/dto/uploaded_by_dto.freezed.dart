// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploaded_by_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadedByDto {

 String get id; String get name; String? get division;
/// Create a copy of UploadedByDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadedByDtoCopyWith<UploadedByDto> get copyWith => _$UploadedByDtoCopyWithImpl<UploadedByDto>(this as UploadedByDto, _$identity);

  /// Serializes this UploadedByDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UploadedByDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadedByDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.division, _this.division) || other.division == _this.division));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UploadedByDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.division);
}

@override
String toString() {
  final _this = this as UploadedByDto;
  return 'UploadedByDto(id: ${_this.id}, name: ${_this.name}, division: ${_this.division})';
}


}

/// @nodoc
abstract mixin class $UploadedByDtoCopyWith<$Res>  {
  factory $UploadedByDtoCopyWith(UploadedByDto value, $Res Function(UploadedByDto) _then) = _$UploadedByDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? division
});




}
/// @nodoc
class _$UploadedByDtoCopyWithImpl<$Res>
    implements $UploadedByDtoCopyWith<$Res> {
  _$UploadedByDtoCopyWithImpl(this._self, this._then);

  final UploadedByDto _self;
  final $Res Function(UploadedByDto) _then;

/// Create a copy of UploadedByDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? division = freezed,}) {
  return _then(UploadedByDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadedByDto].
extension UploadedByDtoPatterns on UploadedByDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadedByDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadedByDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadedByDto value)  $default,){
final _that = this;
switch (_that) {
case _UploadedByDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadedByDto value)?  $default,){
final _that = this;
switch (_that) {
case _UploadedByDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? division)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadedByDto() when $default != null:
return $default(_that.id,_that.name,_that.division);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? division)  $default,) {final _that = this;
switch (_that) {
case _UploadedByDto():
return $default(_that.id,_that.name,_that.division);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? division)?  $default,) {final _that = this;
switch (_that) {
case _UploadedByDto() when $default != null:
return $default(_that.id,_that.name,_that.division);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadedByDto implements UploadedByDto {
  const _UploadedByDto({required this.id, required this.name, this.division});
  factory _UploadedByDto.fromJson(Map<String, dynamic> json) => _$UploadedByDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? division;

/// Create a copy of UploadedByDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadedByDtoCopyWith<_UploadedByDto> get copyWith => __$UploadedByDtoCopyWithImpl<_UploadedByDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadedByDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadedByDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.division, division) || other.division == division));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,division);
}

@override
String toString() {
    return 'UploadedByDto(id: $id, name: $name, division: $division)';
}


}

/// @nodoc
abstract mixin class _$UploadedByDtoCopyWith<$Res> implements $UploadedByDtoCopyWith<$Res> {
  factory _$UploadedByDtoCopyWith(_UploadedByDto value, $Res Function(_UploadedByDto) _then) = __$UploadedByDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? division
});




}
/// @nodoc
class __$UploadedByDtoCopyWithImpl<$Res>
    implements _$UploadedByDtoCopyWith<$Res> {
  __$UploadedByDtoCopyWithImpl(this._self, this._then);

  final _UploadedByDto _self;
  final $Res Function(_UploadedByDto) _then;

/// Create a copy of UploadedByDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? division = freezed,}) {
  return _then(_UploadedByDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

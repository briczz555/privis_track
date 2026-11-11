// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientSummaryDto {

 String get id; String get name;
/// Create a copy of ClientSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSummaryDtoCopyWith<ClientSummaryDto> get copyWith => _$ClientSummaryDtoCopyWithImpl<ClientSummaryDto>(this as ClientSummaryDto, _$identity);

  /// Serializes this ClientSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClientSummaryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSummaryDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClientSummaryDto;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as ClientSummaryDto;
  return 'ClientSummaryDto(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $ClientSummaryDtoCopyWith<$Res>  {
  factory $ClientSummaryDtoCopyWith(ClientSummaryDto value, $Res Function(ClientSummaryDto) _then) = _$ClientSummaryDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$ClientSummaryDtoCopyWithImpl<$Res>
    implements $ClientSummaryDtoCopyWith<$Res> {
  _$ClientSummaryDtoCopyWithImpl(this._self, this._then);

  final ClientSummaryDto _self;
  final $Res Function(ClientSummaryDto) _then;

/// Create a copy of ClientSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(ClientSummaryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientSummaryDto].
extension ClientSummaryDtoPatterns on ClientSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientSummaryDto() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _ClientSummaryDto():
return $default(_that.id,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _ClientSummaryDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientSummaryDto implements ClientSummaryDto {
  const _ClientSummaryDto({required this.id, required this.name});
  factory _ClientSummaryDto.fromJson(Map<String, dynamic> json) => _$ClientSummaryDtoFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of ClientSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientSummaryDtoCopyWith<_ClientSummaryDto> get copyWith => __$ClientSummaryDtoCopyWithImpl<_ClientSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'ClientSummaryDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ClientSummaryDtoCopyWith<$Res> implements $ClientSummaryDtoCopyWith<$Res> {
  factory _$ClientSummaryDtoCopyWith(_ClientSummaryDto value, $Res Function(_ClientSummaryDto) _then) = __$ClientSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$ClientSummaryDtoCopyWithImpl<$Res>
    implements _$ClientSummaryDtoCopyWith<$Res> {
  __$ClientSummaryDtoCopyWithImpl(this._self, this._then);

  final _ClientSummaryDto _self;
  final $Res Function(_ClientSummaryDto) _then;

/// Create a copy of ClientSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_ClientSummaryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

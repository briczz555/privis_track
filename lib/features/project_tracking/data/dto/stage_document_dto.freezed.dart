// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StageDocumentDto {

 String get id; String get name; String get type; String get url;@JsonKey(name: 'uploaded_by') String get uploadedBy;@JsonKey(name: 'uploaded_at') String get uploadedAt;
/// Create a copy of StageDocumentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StageDocumentDtoCopyWith<StageDocumentDto> get copyWith => _$StageDocumentDtoCopyWithImpl<StageDocumentDto>(this as StageDocumentDto, _$identity);

  /// Serializes this StageDocumentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StageDocumentDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StageDocumentDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.uploadedBy, _this.uploadedBy) || other.uploadedBy == _this.uploadedBy)&&(identical(other.uploadedAt, _this.uploadedAt) || other.uploadedAt == _this.uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StageDocumentDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.type,_this.url,_this.uploadedBy,_this.uploadedAt);
}

@override
String toString() {
  final _this = this as StageDocumentDto;
  return 'StageDocumentDto(id: ${_this.id}, name: ${_this.name}, type: ${_this.type}, url: ${_this.url}, uploadedBy: ${_this.uploadedBy}, uploadedAt: ${_this.uploadedAt})';
}


}

/// @nodoc
abstract mixin class $StageDocumentDtoCopyWith<$Res>  {
  factory $StageDocumentDtoCopyWith(StageDocumentDto value, $Res Function(StageDocumentDto) _then) = _$StageDocumentDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, String url,@JsonKey(name: 'uploaded_by') String uploadedBy,@JsonKey(name: 'uploaded_at') String uploadedAt
});




}
/// @nodoc
class _$StageDocumentDtoCopyWithImpl<$Res>
    implements $StageDocumentDtoCopyWith<$Res> {
  _$StageDocumentDtoCopyWithImpl(this._self, this._then);

  final StageDocumentDto _self;
  final $Res Function(StageDocumentDto) _then;

/// Create a copy of StageDocumentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? url = null,Object? uploadedBy = null,Object? uploadedAt = null,}) {
  return _then(StageDocumentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,uploadedBy: null == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StageDocumentDto].
extension StageDocumentDtoPatterns on StageDocumentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StageDocumentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StageDocumentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StageDocumentDto value)  $default,){
final _that = this;
switch (_that) {
case _StageDocumentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StageDocumentDto value)?  $default,){
final _that = this;
switch (_that) {
case _StageDocumentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String url, @JsonKey(name: 'uploaded_by')  String uploadedBy, @JsonKey(name: 'uploaded_at')  String uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StageDocumentDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.url,_that.uploadedBy,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String url, @JsonKey(name: 'uploaded_by')  String uploadedBy, @JsonKey(name: 'uploaded_at')  String uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _StageDocumentDto():
return $default(_that.id,_that.name,_that.type,_that.url,_that.uploadedBy,_that.uploadedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  String url, @JsonKey(name: 'uploaded_by')  String uploadedBy, @JsonKey(name: 'uploaded_at')  String uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _StageDocumentDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.url,_that.uploadedBy,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StageDocumentDto implements StageDocumentDto {
  const _StageDocumentDto({required this.id, required this.name, required this.type, required this.url, @JsonKey(name: 'uploaded_by') required this.uploadedBy, @JsonKey(name: 'uploaded_at') required this.uploadedAt});
  factory _StageDocumentDto.fromJson(Map<String, dynamic> json) => _$StageDocumentDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  String url;
@override@JsonKey(name: 'uploaded_by') final  String uploadedBy;
@override@JsonKey(name: 'uploaded_at') final  String uploadedAt;

/// Create a copy of StageDocumentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StageDocumentDtoCopyWith<_StageDocumentDto> get copyWith => __$StageDocumentDtoCopyWithImpl<_StageDocumentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StageDocumentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StageDocumentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,type,url,uploadedBy,uploadedAt);
}

@override
String toString() {
    return 'StageDocumentDto(id: $id, name: $name, type: $type, url: $url, uploadedBy: $uploadedBy, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$StageDocumentDtoCopyWith<$Res> implements $StageDocumentDtoCopyWith<$Res> {
  factory _$StageDocumentDtoCopyWith(_StageDocumentDto value, $Res Function(_StageDocumentDto) _then) = __$StageDocumentDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, String url,@JsonKey(name: 'uploaded_by') String uploadedBy,@JsonKey(name: 'uploaded_at') String uploadedAt
});




}
/// @nodoc
class __$StageDocumentDtoCopyWithImpl<$Res>
    implements _$StageDocumentDtoCopyWith<$Res> {
  __$StageDocumentDtoCopyWithImpl(this._self, this._then);

  final _StageDocumentDto _self;
  final $Res Function(_StageDocumentDto) _then;

/// Create a copy of StageDocumentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? url = null,Object? uploadedBy = null,Object? uploadedAt = null,}) {
  return _then(_StageDocumentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,uploadedBy: null == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

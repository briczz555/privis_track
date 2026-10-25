// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StageDocumentModel {

 String get id; String get name; StageDocumentType get type; String get url; String get uploadedBy; DateTime get uploadedAt;
/// Create a copy of StageDocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StageDocumentModelCopyWith<StageDocumentModel> get copyWith => _$StageDocumentModelCopyWithImpl<StageDocumentModel>(this as StageDocumentModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StageDocumentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StageDocumentModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.uploadedBy, _this.uploadedBy) || other.uploadedBy == _this.uploadedBy)&&(identical(other.uploadedAt, _this.uploadedAt) || other.uploadedAt == _this.uploadedAt));
}


@override
int get hashCode {
  final _this = this as StageDocumentModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.type,_this.url,_this.uploadedBy,_this.uploadedAt);
}

@override
String toString() {
  final _this = this as StageDocumentModel;
  return 'StageDocumentModel(id: ${_this.id}, name: ${_this.name}, type: ${_this.type}, url: ${_this.url}, uploadedBy: ${_this.uploadedBy}, uploadedAt: ${_this.uploadedAt})';
}


}

/// @nodoc
abstract mixin class $StageDocumentModelCopyWith<$Res>  {
  factory $StageDocumentModelCopyWith(StageDocumentModel value, $Res Function(StageDocumentModel) _then) = _$StageDocumentModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, StageDocumentType type, String url, String uploadedBy, DateTime uploadedAt
});




}
/// @nodoc
class _$StageDocumentModelCopyWithImpl<$Res>
    implements $StageDocumentModelCopyWith<$Res> {
  _$StageDocumentModelCopyWithImpl(this._self, this._then);

  final StageDocumentModel _self;
  final $Res Function(StageDocumentModel) _then;

/// Create a copy of StageDocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? url = null,Object? uploadedBy = null,Object? uploadedAt = null,}) {
  return _then(StageDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StageDocumentType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,uploadedBy: null == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StageDocumentModel].
extension StageDocumentModelPatterns on StageDocumentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StageDocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StageDocumentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StageDocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _StageDocumentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StageDocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _StageDocumentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  StageDocumentType type,  String url,  String uploadedBy,  DateTime uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StageDocumentModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  StageDocumentType type,  String url,  String uploadedBy,  DateTime uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _StageDocumentModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  StageDocumentType type,  String url,  String uploadedBy,  DateTime uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _StageDocumentModel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.url,_that.uploadedBy,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc


class _StageDocumentModel extends StageDocumentModel {
  const _StageDocumentModel({required this.id, required this.name, required this.type, required this.url, required this.uploadedBy, required this.uploadedAt}): super._();
  

@override final  String id;
@override final  String name;
@override final  StageDocumentType type;
@override final  String url;
@override final  String uploadedBy;
@override final  DateTime uploadedAt;

/// Create a copy of StageDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StageDocumentModelCopyWith<_StageDocumentModel> get copyWith => __$StageDocumentModelCopyWithImpl<_StageDocumentModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StageDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,type,url,uploadedBy,uploadedAt);
}

@override
String toString() {
    return 'StageDocumentModel(id: $id, name: $name, type: $type, url: $url, uploadedBy: $uploadedBy, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$StageDocumentModelCopyWith<$Res> implements $StageDocumentModelCopyWith<$Res> {
  factory _$StageDocumentModelCopyWith(_StageDocumentModel value, $Res Function(_StageDocumentModel) _then) = __$StageDocumentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, StageDocumentType type, String url, String uploadedBy, DateTime uploadedAt
});




}
/// @nodoc
class __$StageDocumentModelCopyWithImpl<$Res>
    implements _$StageDocumentModelCopyWith<$Res> {
  __$StageDocumentModelCopyWithImpl(this._self, this._then);

  final _StageDocumentModel _self;
  final $Res Function(_StageDocumentModel) _then;

/// Create a copy of StageDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? url = null,Object? uploadedBy = null,Object? uploadedAt = null,}) {
  return _then(_StageDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StageDocumentType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,uploadedBy: null == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

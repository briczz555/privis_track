// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_mom_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingMomEntity {

 String get fileName; int get sizeBytes; DateTime get generatedAt; String get generatedByName;
/// Create a copy of MeetingMomEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingMomEntityCopyWith<MeetingMomEntity> get copyWith => _$MeetingMomEntityCopyWithImpl<MeetingMomEntity>(this as MeetingMomEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MeetingMomEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingMomEntity&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.sizeBytes, _this.sizeBytes) || other.sizeBytes == _this.sizeBytes)&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt)&&(identical(other.generatedByName, _this.generatedByName) || other.generatedByName == _this.generatedByName));
}


@override
int get hashCode {
  final _this = this as MeetingMomEntity;
  return Object.hash(runtimeType,_this.fileName,_this.sizeBytes,_this.generatedAt,_this.generatedByName);
}

@override
String toString() {
  final _this = this as MeetingMomEntity;
  return 'MeetingMomEntity(fileName: ${_this.fileName}, sizeBytes: ${_this.sizeBytes}, generatedAt: ${_this.generatedAt}, generatedByName: ${_this.generatedByName})';
}


}

/// @nodoc
abstract mixin class $MeetingMomEntityCopyWith<$Res>  {
  factory $MeetingMomEntityCopyWith(MeetingMomEntity value, $Res Function(MeetingMomEntity) _then) = _$MeetingMomEntityCopyWithImpl;
@useResult
$Res call({
 String fileName, int sizeBytes, DateTime generatedAt, String generatedByName
});




}
/// @nodoc
class _$MeetingMomEntityCopyWithImpl<$Res>
    implements $MeetingMomEntityCopyWith<$Res> {
  _$MeetingMomEntityCopyWithImpl(this._self, this._then);

  final MeetingMomEntity _self;
  final $Res Function(MeetingMomEntity) _then;

/// Create a copy of MeetingMomEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? sizeBytes = null,Object? generatedAt = null,Object? generatedByName = null,}) {
  return _then(MeetingMomEntity(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,generatedByName: null == generatedByName ? _self.generatedByName : generatedByName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MeetingMomEntity].
extension MeetingMomEntityPatterns on MeetingMomEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeetingMomEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeetingMomEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeetingMomEntity value)  $default,){
final _that = this;
switch (_that) {
case _MeetingMomEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeetingMomEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MeetingMomEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileName,  int sizeBytes,  DateTime generatedAt,  String generatedByName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeetingMomEntity() when $default != null:
return $default(_that.fileName,_that.sizeBytes,_that.generatedAt,_that.generatedByName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileName,  int sizeBytes,  DateTime generatedAt,  String generatedByName)  $default,) {final _that = this;
switch (_that) {
case _MeetingMomEntity():
return $default(_that.fileName,_that.sizeBytes,_that.generatedAt,_that.generatedByName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileName,  int sizeBytes,  DateTime generatedAt,  String generatedByName)?  $default,) {final _that = this;
switch (_that) {
case _MeetingMomEntity() when $default != null:
return $default(_that.fileName,_that.sizeBytes,_that.generatedAt,_that.generatedByName);case _:
  return null;

}
}

}

/// @nodoc


class _MeetingMomEntity implements MeetingMomEntity {
  const _MeetingMomEntity({required this.fileName, required this.sizeBytes, required this.generatedAt, required this.generatedByName});
  

@override final  String fileName;
@override final  int sizeBytes;
@override final  DateTime generatedAt;
@override final  String generatedByName;

/// Create a copy of MeetingMomEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeetingMomEntityCopyWith<_MeetingMomEntity> get copyWith => __$MeetingMomEntityCopyWithImpl<_MeetingMomEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeetingMomEntity&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.generatedByName, generatedByName) || other.generatedByName == generatedByName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fileName,sizeBytes,generatedAt,generatedByName);
}

@override
String toString() {
    return 'MeetingMomEntity(fileName: $fileName, sizeBytes: $sizeBytes, generatedAt: $generatedAt, generatedByName: $generatedByName)';
}


}

/// @nodoc
abstract mixin class _$MeetingMomEntityCopyWith<$Res> implements $MeetingMomEntityCopyWith<$Res> {
  factory _$MeetingMomEntityCopyWith(_MeetingMomEntity value, $Res Function(_MeetingMomEntity) _then) = __$MeetingMomEntityCopyWithImpl;
@override @useResult
$Res call({
 String fileName, int sizeBytes, DateTime generatedAt, String generatedByName
});




}
/// @nodoc
class __$MeetingMomEntityCopyWithImpl<$Res>
    implements _$MeetingMomEntityCopyWith<$Res> {
  __$MeetingMomEntityCopyWithImpl(this._self, this._then);

  final _MeetingMomEntity _self;
  final $Res Function(_MeetingMomEntity) _then;

/// Create a copy of MeetingMomEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? sizeBytes = null,Object? generatedAt = null,Object? generatedByName = null,}) {
  return _then(_MeetingMomEntity(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,generatedByName: null == generatedByName ? _self.generatedByName : generatedByName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

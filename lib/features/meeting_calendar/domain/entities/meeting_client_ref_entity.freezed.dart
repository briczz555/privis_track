// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_client_ref_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingClientRefEntity {

 String get id; String get name;
/// Create a copy of MeetingClientRefEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingClientRefEntityCopyWith<MeetingClientRefEntity> get copyWith => _$MeetingClientRefEntityCopyWithImpl<MeetingClientRefEntity>(this as MeetingClientRefEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MeetingClientRefEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingClientRefEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}


@override
int get hashCode {
  final _this = this as MeetingClientRefEntity;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as MeetingClientRefEntity;
  return 'MeetingClientRefEntity(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $MeetingClientRefEntityCopyWith<$Res>  {
  factory $MeetingClientRefEntityCopyWith(MeetingClientRefEntity value, $Res Function(MeetingClientRefEntity) _then) = _$MeetingClientRefEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$MeetingClientRefEntityCopyWithImpl<$Res>
    implements $MeetingClientRefEntityCopyWith<$Res> {
  _$MeetingClientRefEntityCopyWithImpl(this._self, this._then);

  final MeetingClientRefEntity _self;
  final $Res Function(MeetingClientRefEntity) _then;

/// Create a copy of MeetingClientRefEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(MeetingClientRefEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MeetingClientRefEntity].
extension MeetingClientRefEntityPatterns on MeetingClientRefEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeetingClientRefEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeetingClientRefEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeetingClientRefEntity value)  $default,){
final _that = this;
switch (_that) {
case _MeetingClientRefEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeetingClientRefEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MeetingClientRefEntity() when $default != null:
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
case _MeetingClientRefEntity() when $default != null:
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
case _MeetingClientRefEntity():
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
case _MeetingClientRefEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _MeetingClientRefEntity implements MeetingClientRefEntity {
  const _MeetingClientRefEntity({required this.id, required this.name});
  

@override final  String id;
@override final  String name;

/// Create a copy of MeetingClientRefEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeetingClientRefEntityCopyWith<_MeetingClientRefEntity> get copyWith => __$MeetingClientRefEntityCopyWithImpl<_MeetingClientRefEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeetingClientRefEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'MeetingClientRefEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MeetingClientRefEntityCopyWith<$Res> implements $MeetingClientRefEntityCopyWith<$Res> {
  factory _$MeetingClientRefEntityCopyWith(_MeetingClientRefEntity value, $Res Function(_MeetingClientRefEntity) _then) = __$MeetingClientRefEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$MeetingClientRefEntityCopyWithImpl<$Res>
    implements _$MeetingClientRefEntityCopyWith<$Res> {
  __$MeetingClientRefEntityCopyWithImpl(this._self, this._then);

  final _MeetingClientRefEntity _self;
  final $Res Function(_MeetingClientRefEntity) _then;

/// Create a copy of MeetingClientRefEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_MeetingClientRefEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingInputEntity {

 String get title; String? get agenda; MeetingMode get mode; DateTime get startAt; DateTime get endAt; String? get meetingUrl; String? get location; String? get projectCode; List<String> get participantIds; String? get notes;
/// Create a copy of MeetingInputEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingInputEntityCopyWith<MeetingInputEntity> get copyWith => _$MeetingInputEntityCopyWithImpl<MeetingInputEntity>(this as MeetingInputEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MeetingInputEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingInputEntity&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.agenda, _this.agenda) || other.agenda == _this.agenda)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.startAt, _this.startAt) || other.startAt == _this.startAt)&&(identical(other.endAt, _this.endAt) || other.endAt == _this.endAt)&&(identical(other.meetingUrl, _this.meetingUrl) || other.meetingUrl == _this.meetingUrl)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.projectCode, _this.projectCode) || other.projectCode == _this.projectCode)&&const DeepCollectionEquality().equals(other.participantIds, _this.participantIds)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}


@override
int get hashCode {
  final _this = this as MeetingInputEntity;
  return Object.hash(runtimeType,_this.title,_this.agenda,_this.mode,_this.startAt,_this.endAt,_this.meetingUrl,_this.location,_this.projectCode,const DeepCollectionEquality().hash(_this.participantIds),_this.notes);
}

@override
String toString() {
  final _this = this as MeetingInputEntity;
  return 'MeetingInputEntity(title: ${_this.title}, agenda: ${_this.agenda}, mode: ${_this.mode}, startAt: ${_this.startAt}, endAt: ${_this.endAt}, meetingUrl: ${_this.meetingUrl}, location: ${_this.location}, projectCode: ${_this.projectCode}, participantIds: ${_this.participantIds}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $MeetingInputEntityCopyWith<$Res>  {
  factory $MeetingInputEntityCopyWith(MeetingInputEntity value, $Res Function(MeetingInputEntity) _then) = _$MeetingInputEntityCopyWithImpl;
@useResult
$Res call({
 String title, String? agenda, MeetingMode mode, DateTime startAt, DateTime endAt, String? meetingUrl, String? location, String? projectCode, List<String> participantIds, String? notes
});




}
/// @nodoc
class _$MeetingInputEntityCopyWithImpl<$Res>
    implements $MeetingInputEntityCopyWith<$Res> {
  _$MeetingInputEntityCopyWithImpl(this._self, this._then);

  final MeetingInputEntity _self;
  final $Res Function(MeetingInputEntity) _then;

/// Create a copy of MeetingInputEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? agenda = freezed,Object? mode = null,Object? startAt = null,Object? endAt = null,Object? meetingUrl = freezed,Object? location = freezed,Object? projectCode = freezed,Object? participantIds = null,Object? notes = freezed,}) {
  return _then(MeetingInputEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,agenda: freezed == agenda ? _self.agenda : agenda // ignore: cast_nullable_to_non_nullable
as String?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MeetingMode,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,meetingUrl: freezed == meetingUrl ? _self.meetingUrl : meetingUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,projectCode: freezed == projectCode ? _self.projectCode : projectCode // ignore: cast_nullable_to_non_nullable
as String?,participantIds: null == participantIds ? _self.participantIds : participantIds // ignore: cast_nullable_to_non_nullable
as List<String>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MeetingInputEntity].
extension MeetingInputEntityPatterns on MeetingInputEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeetingInputEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeetingInputEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeetingInputEntity value)  $default,){
final _that = this;
switch (_that) {
case _MeetingInputEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeetingInputEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MeetingInputEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? agenda,  MeetingMode mode,  DateTime startAt,  DateTime endAt,  String? meetingUrl,  String? location,  String? projectCode,  List<String> participantIds,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeetingInputEntity() when $default != null:
return $default(_that.title,_that.agenda,_that.mode,_that.startAt,_that.endAt,_that.meetingUrl,_that.location,_that.projectCode,_that.participantIds,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? agenda,  MeetingMode mode,  DateTime startAt,  DateTime endAt,  String? meetingUrl,  String? location,  String? projectCode,  List<String> participantIds,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _MeetingInputEntity():
return $default(_that.title,_that.agenda,_that.mode,_that.startAt,_that.endAt,_that.meetingUrl,_that.location,_that.projectCode,_that.participantIds,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? agenda,  MeetingMode mode,  DateTime startAt,  DateTime endAt,  String? meetingUrl,  String? location,  String? projectCode,  List<String> participantIds,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _MeetingInputEntity() when $default != null:
return $default(_that.title,_that.agenda,_that.mode,_that.startAt,_that.endAt,_that.meetingUrl,_that.location,_that.projectCode,_that.participantIds,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _MeetingInputEntity implements MeetingInputEntity {
  const _MeetingInputEntity({required this.title, this.agenda, required this.mode, required this.startAt, required this.endAt, this.meetingUrl, this.location, this.projectCode, required  List<String> participantIds, this.notes}): _participantIds = participantIds;
  

@override final  String title;
@override final  String? agenda;
@override final  MeetingMode mode;
@override final  DateTime startAt;
@override final  DateTime endAt;
@override final  String? meetingUrl;
@override final  String? location;
@override final  String? projectCode;
 final  List<String> _participantIds;
@override List<String> get participantIds {
  if (_participantIds is EqualUnmodifiableListView) return _participantIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participantIds);
}

@override final  String? notes;

/// Create a copy of MeetingInputEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeetingInputEntityCopyWith<_MeetingInputEntity> get copyWith => __$MeetingInputEntityCopyWithImpl<_MeetingInputEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeetingInputEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.agenda, agenda) || other.agenda == agenda)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.meetingUrl, meetingUrl) || other.meetingUrl == meetingUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.projectCode, projectCode) || other.projectCode == projectCode)&&const DeepCollectionEquality().equals(other.participantIds, _participantIds)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,agenda,mode,startAt,endAt,meetingUrl,location,projectCode,const DeepCollectionEquality().hash(_participantIds),notes);
}

@override
String toString() {
    return 'MeetingInputEntity(title: $title, agenda: $agenda, mode: $mode, startAt: $startAt, endAt: $endAt, meetingUrl: $meetingUrl, location: $location, projectCode: $projectCode, participantIds: $participantIds, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$MeetingInputEntityCopyWith<$Res> implements $MeetingInputEntityCopyWith<$Res> {
  factory _$MeetingInputEntityCopyWith(_MeetingInputEntity value, $Res Function(_MeetingInputEntity) _then) = __$MeetingInputEntityCopyWithImpl;
@override @useResult
$Res call({
 String title, String? agenda, MeetingMode mode, DateTime startAt, DateTime endAt, String? meetingUrl, String? location, String? projectCode, List<String> participantIds, String? notes
});




}
/// @nodoc
class __$MeetingInputEntityCopyWithImpl<$Res>
    implements _$MeetingInputEntityCopyWith<$Res> {
  __$MeetingInputEntityCopyWithImpl(this._self, this._then);

  final _MeetingInputEntity _self;
  final $Res Function(_MeetingInputEntity) _then;

/// Create a copy of MeetingInputEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? agenda = freezed,Object? mode = null,Object? startAt = null,Object? endAt = null,Object? meetingUrl = freezed,Object? location = freezed,Object? projectCode = freezed,Object? participantIds = null,Object? notes = freezed,}) {
  return _then(_MeetingInputEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,agenda: freezed == agenda ? _self.agenda : agenda // ignore: cast_nullable_to_non_nullable
as String?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MeetingMode,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,meetingUrl: freezed == meetingUrl ? _self.meetingUrl : meetingUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,projectCode: freezed == projectCode ? _self.projectCode : projectCode // ignore: cast_nullable_to_non_nullable
as String?,participantIds: null == participantIds ? _self._participantIds : participantIds // ignore: cast_nullable_to_non_nullable
as List<String>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

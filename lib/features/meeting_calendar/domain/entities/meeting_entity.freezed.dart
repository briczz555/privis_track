// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingEntity {

 String get id; String get title; String? get agenda; MeetingMode get mode; MeetingStatus get status; DateTime get startAt; DateTime get endAt; String? get meetingUrl; String? get location; MeetingProjectRefEntity? get project; MeetingClientRefEntity? get client; MeetingParticipantEntity get organizer; List<MeetingParticipantEntity> get participants; String? get notes; MeetingMomEntity? get mom; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingEntityCopyWith<MeetingEntity> get copyWith => _$MeetingEntityCopyWithImpl<MeetingEntity>(this as MeetingEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MeetingEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.agenda, _this.agenda) || other.agenda == _this.agenda)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.startAt, _this.startAt) || other.startAt == _this.startAt)&&(identical(other.endAt, _this.endAt) || other.endAt == _this.endAt)&&(identical(other.meetingUrl, _this.meetingUrl) || other.meetingUrl == _this.meetingUrl)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.project, _this.project) || other.project == _this.project)&&(identical(other.client, _this.client) || other.client == _this.client)&&(identical(other.organizer, _this.organizer) || other.organizer == _this.organizer)&&const DeepCollectionEquality().equals(other.participants, _this.participants)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.mom, _this.mom) || other.mom == _this.mom)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as MeetingEntity;
  return Object.hash(runtimeType,_this.id,_this.title,_this.agenda,_this.mode,_this.status,_this.startAt,_this.endAt,_this.meetingUrl,_this.location,_this.project,_this.client,_this.organizer,const DeepCollectionEquality().hash(_this.participants),_this.notes,_this.mom,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as MeetingEntity;
  return 'MeetingEntity(id: ${_this.id}, title: ${_this.title}, agenda: ${_this.agenda}, mode: ${_this.mode}, status: ${_this.status}, startAt: ${_this.startAt}, endAt: ${_this.endAt}, meetingUrl: ${_this.meetingUrl}, location: ${_this.location}, project: ${_this.project}, client: ${_this.client}, organizer: ${_this.organizer}, participants: ${_this.participants}, notes: ${_this.notes}, mom: ${_this.mom}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $MeetingEntityCopyWith<$Res>  {
  factory $MeetingEntityCopyWith(MeetingEntity value, $Res Function(MeetingEntity) _then) = _$MeetingEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? agenda, MeetingMode mode, MeetingStatus status, DateTime startAt, DateTime endAt, String? meetingUrl, String? location, MeetingProjectRefEntity? project, MeetingClientRefEntity? client, MeetingParticipantEntity organizer, List<MeetingParticipantEntity> participants, String? notes, MeetingMomEntity? mom, DateTime createdAt, DateTime updatedAt
});


$MeetingProjectRefEntityCopyWith<$Res>? get project;$MeetingClientRefEntityCopyWith<$Res>? get client;$MeetingParticipantEntityCopyWith<$Res> get organizer;$MeetingMomEntityCopyWith<$Res>? get mom;

}
/// @nodoc
class _$MeetingEntityCopyWithImpl<$Res>
    implements $MeetingEntityCopyWith<$Res> {
  _$MeetingEntityCopyWithImpl(this._self, this._then);

  final MeetingEntity _self;
  final $Res Function(MeetingEntity) _then;

/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? agenda = freezed,Object? mode = null,Object? status = null,Object? startAt = null,Object? endAt = null,Object? meetingUrl = freezed,Object? location = freezed,Object? project = freezed,Object? client = freezed,Object? organizer = null,Object? participants = null,Object? notes = freezed,Object? mom = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(MeetingEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,agenda: freezed == agenda ? _self.agenda : agenda // ignore: cast_nullable_to_non_nullable
as String?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MeetingMode,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MeetingStatus,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,meetingUrl: freezed == meetingUrl ? _self.meetingUrl : meetingUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as MeetingProjectRefEntity?,client: freezed == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as MeetingClientRefEntity?,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as MeetingParticipantEntity,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<MeetingParticipantEntity>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,mom: freezed == mom ? _self.mom : mom // ignore: cast_nullable_to_non_nullable
as MeetingMomEntity?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingProjectRefEntityCopyWith<$Res>? get project {
    if (_self.project == null) {
    return null;
  }

  return $MeetingProjectRefEntityCopyWith<$Res>(_self.project!, (value) {
    return _then(_self.copyWith(project: value));
  });
}/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingClientRefEntityCopyWith<$Res>? get client {
    if (_self.client == null) {
    return null;
  }

  return $MeetingClientRefEntityCopyWith<$Res>(_self.client!, (value) {
    return _then(_self.copyWith(client: value));
  });
}/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingParticipantEntityCopyWith<$Res> get organizer {
  
  return $MeetingParticipantEntityCopyWith<$Res>(_self.organizer, (value) {
    return _then(_self.copyWith(organizer: value));
  });
}/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingMomEntityCopyWith<$Res>? get mom {
    if (_self.mom == null) {
    return null;
  }

  return $MeetingMomEntityCopyWith<$Res>(_self.mom!, (value) {
    return _then(_self.copyWith(mom: value));
  });
}
}


/// Adds pattern-matching-related methods to [MeetingEntity].
extension MeetingEntityPatterns on MeetingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeetingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeetingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeetingEntity value)  $default,){
final _that = this;
switch (_that) {
case _MeetingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeetingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MeetingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? agenda,  MeetingMode mode,  MeetingStatus status,  DateTime startAt,  DateTime endAt,  String? meetingUrl,  String? location,  MeetingProjectRefEntity? project,  MeetingClientRefEntity? client,  MeetingParticipantEntity organizer,  List<MeetingParticipantEntity> participants,  String? notes,  MeetingMomEntity? mom,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeetingEntity() when $default != null:
return $default(_that.id,_that.title,_that.agenda,_that.mode,_that.status,_that.startAt,_that.endAt,_that.meetingUrl,_that.location,_that.project,_that.client,_that.organizer,_that.participants,_that.notes,_that.mom,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? agenda,  MeetingMode mode,  MeetingStatus status,  DateTime startAt,  DateTime endAt,  String? meetingUrl,  String? location,  MeetingProjectRefEntity? project,  MeetingClientRefEntity? client,  MeetingParticipantEntity organizer,  List<MeetingParticipantEntity> participants,  String? notes,  MeetingMomEntity? mom,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MeetingEntity():
return $default(_that.id,_that.title,_that.agenda,_that.mode,_that.status,_that.startAt,_that.endAt,_that.meetingUrl,_that.location,_that.project,_that.client,_that.organizer,_that.participants,_that.notes,_that.mom,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? agenda,  MeetingMode mode,  MeetingStatus status,  DateTime startAt,  DateTime endAt,  String? meetingUrl,  String? location,  MeetingProjectRefEntity? project,  MeetingClientRefEntity? client,  MeetingParticipantEntity organizer,  List<MeetingParticipantEntity> participants,  String? notes,  MeetingMomEntity? mom,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MeetingEntity() when $default != null:
return $default(_that.id,_that.title,_that.agenda,_that.mode,_that.status,_that.startAt,_that.endAt,_that.meetingUrl,_that.location,_that.project,_that.client,_that.organizer,_that.participants,_that.notes,_that.mom,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _MeetingEntity extends MeetingEntity {
  const _MeetingEntity({required this.id, required this.title, this.agenda, required this.mode, required this.status, required this.startAt, required this.endAt, this.meetingUrl, this.location, this.project, this.client, required this.organizer, required  List<MeetingParticipantEntity> participants, this.notes, this.mom, required this.createdAt, required this.updatedAt}): _participants = participants,super._();
  

@override final  String id;
@override final  String title;
@override final  String? agenda;
@override final  MeetingMode mode;
@override final  MeetingStatus status;
@override final  DateTime startAt;
@override final  DateTime endAt;
@override final  String? meetingUrl;
@override final  String? location;
@override final  MeetingProjectRefEntity? project;
@override final  MeetingClientRefEntity? client;
@override final  MeetingParticipantEntity organizer;
 final  List<MeetingParticipantEntity> _participants;
@override List<MeetingParticipantEntity> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  String? notes;
@override final  MeetingMomEntity? mom;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeetingEntityCopyWith<_MeetingEntity> get copyWith => __$MeetingEntityCopyWithImpl<_MeetingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeetingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.agenda, agenda) || other.agenda == agenda)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.meetingUrl, meetingUrl) || other.meetingUrl == meetingUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.project, project) || other.project == project)&&(identical(other.client, client) || other.client == client)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&const DeepCollectionEquality().equals(other.participants, _participants)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.mom, mom) || other.mom == mom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,agenda,mode,status,startAt,endAt,meetingUrl,location,project,client,organizer,const DeepCollectionEquality().hash(_participants),notes,mom,createdAt,updatedAt);
}

@override
String toString() {
    return 'MeetingEntity(id: $id, title: $title, agenda: $agenda, mode: $mode, status: $status, startAt: $startAt, endAt: $endAt, meetingUrl: $meetingUrl, location: $location, project: $project, client: $client, organizer: $organizer, participants: $participants, notes: $notes, mom: $mom, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MeetingEntityCopyWith<$Res> implements $MeetingEntityCopyWith<$Res> {
  factory _$MeetingEntityCopyWith(_MeetingEntity value, $Res Function(_MeetingEntity) _then) = __$MeetingEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? agenda, MeetingMode mode, MeetingStatus status, DateTime startAt, DateTime endAt, String? meetingUrl, String? location, MeetingProjectRefEntity? project, MeetingClientRefEntity? client, MeetingParticipantEntity organizer, List<MeetingParticipantEntity> participants, String? notes, MeetingMomEntity? mom, DateTime createdAt, DateTime updatedAt
});


@override $MeetingProjectRefEntityCopyWith<$Res>? get project;@override $MeetingClientRefEntityCopyWith<$Res>? get client;@override $MeetingParticipantEntityCopyWith<$Res> get organizer;@override $MeetingMomEntityCopyWith<$Res>? get mom;

}
/// @nodoc
class __$MeetingEntityCopyWithImpl<$Res>
    implements _$MeetingEntityCopyWith<$Res> {
  __$MeetingEntityCopyWithImpl(this._self, this._then);

  final _MeetingEntity _self;
  final $Res Function(_MeetingEntity) _then;

/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? agenda = freezed,Object? mode = null,Object? status = null,Object? startAt = null,Object? endAt = null,Object? meetingUrl = freezed,Object? location = freezed,Object? project = freezed,Object? client = freezed,Object? organizer = null,Object? participants = null,Object? notes = freezed,Object? mom = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MeetingEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,agenda: freezed == agenda ? _self.agenda : agenda // ignore: cast_nullable_to_non_nullable
as String?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MeetingMode,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MeetingStatus,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,meetingUrl: freezed == meetingUrl ? _self.meetingUrl : meetingUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as MeetingProjectRefEntity?,client: freezed == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as MeetingClientRefEntity?,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as MeetingParticipantEntity,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<MeetingParticipantEntity>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,mom: freezed == mom ? _self.mom : mom // ignore: cast_nullable_to_non_nullable
as MeetingMomEntity?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingProjectRefEntityCopyWith<$Res>? get project {
    if (_self.project == null) {
    return null;
  }

  return $MeetingProjectRefEntityCopyWith<$Res>(_self.project!, (value) {
    return _then(_self.copyWith(project: value));
  });
}/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingClientRefEntityCopyWith<$Res>? get client {
    if (_self.client == null) {
    return null;
  }

  return $MeetingClientRefEntityCopyWith<$Res>(_self.client!, (value) {
    return _then(_self.copyWith(client: value));
  });
}/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingParticipantEntityCopyWith<$Res> get organizer {
  
  return $MeetingParticipantEntityCopyWith<$Res>(_self.organizer, (value) {
    return _then(_self.copyWith(organizer: value));
  });
}/// Create a copy of MeetingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingMomEntityCopyWith<$Res>? get mom {
    if (_self.mom == null) {
    return null;
  }

  return $MeetingMomEntityCopyWith<$Res>(_self.mom!, (value) {
    return _then(_self.copyWith(mom: value));
  });
}
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeetingDto {

 String get id; String get title; String? get agenda; String get mode; String get status;@JsonKey(name: 'start_at') DateTime get startAt;@JsonKey(name: 'end_at') DateTime get endAt;@JsonKey(name: 'meeting_url') String? get meetingUrl; String? get location; Map<String, dynamic>? get project; Map<String, dynamic>? get client; Map<String, dynamic> get organizer; List<dynamic> get participants; String? get notes; Map<String, dynamic>? get mom;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of MeetingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingDtoCopyWith<MeetingDto> get copyWith => _$MeetingDtoCopyWithImpl<MeetingDto>(this as MeetingDto, _$identity);

  /// Serializes this MeetingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MeetingDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.agenda, _this.agenda) || other.agenda == _this.agenda)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.startAt, _this.startAt) || other.startAt == _this.startAt)&&(identical(other.endAt, _this.endAt) || other.endAt == _this.endAt)&&(identical(other.meetingUrl, _this.meetingUrl) || other.meetingUrl == _this.meetingUrl)&&(identical(other.location, _this.location) || other.location == _this.location)&&const DeepCollectionEquality().equals(other.project, _this.project)&&const DeepCollectionEquality().equals(other.client, _this.client)&&const DeepCollectionEquality().equals(other.organizer, _this.organizer)&&const DeepCollectionEquality().equals(other.participants, _this.participants)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.mom, _this.mom)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MeetingDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.agenda,_this.mode,_this.status,_this.startAt,_this.endAt,_this.meetingUrl,_this.location,const DeepCollectionEquality().hash(_this.project),const DeepCollectionEquality().hash(_this.client),const DeepCollectionEquality().hash(_this.organizer),const DeepCollectionEquality().hash(_this.participants),_this.notes,const DeepCollectionEquality().hash(_this.mom),_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as MeetingDto;
  return 'MeetingDto(id: ${_this.id}, title: ${_this.title}, agenda: ${_this.agenda}, mode: ${_this.mode}, status: ${_this.status}, startAt: ${_this.startAt}, endAt: ${_this.endAt}, meetingUrl: ${_this.meetingUrl}, location: ${_this.location}, project: ${_this.project}, client: ${_this.client}, organizer: ${_this.organizer}, participants: ${_this.participants}, notes: ${_this.notes}, mom: ${_this.mom}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $MeetingDtoCopyWith<$Res>  {
  factory $MeetingDtoCopyWith(MeetingDto value, $Res Function(MeetingDto) _then) = _$MeetingDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? agenda, String mode, String status,@JsonKey(name: 'start_at') DateTime startAt,@JsonKey(name: 'end_at') DateTime endAt,@JsonKey(name: 'meeting_url') String? meetingUrl, String? location, Map<String, dynamic>? project, Map<String, dynamic>? client, Map<String, dynamic> organizer, List<dynamic> participants, String? notes, Map<String, dynamic>? mom,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$MeetingDtoCopyWithImpl<$Res>
    implements $MeetingDtoCopyWith<$Res> {
  _$MeetingDtoCopyWithImpl(this._self, this._then);

  final MeetingDto _self;
  final $Res Function(MeetingDto) _then;

/// Create a copy of MeetingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? agenda = freezed,Object? mode = null,Object? status = null,Object? startAt = null,Object? endAt = null,Object? meetingUrl = freezed,Object? location = freezed,Object? project = freezed,Object? client = freezed,Object? organizer = null,Object? participants = null,Object? notes = freezed,Object? mom = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(MeetingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,agenda: freezed == agenda ? _self.agenda : agenda // ignore: cast_nullable_to_non_nullable
as String?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,meetingUrl: freezed == meetingUrl ? _self.meetingUrl : meetingUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,client: freezed == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<dynamic>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,mom: freezed == mom ? _self.mom : mom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MeetingDto].
extension MeetingDtoPatterns on MeetingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeetingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeetingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeetingDto value)  $default,){
final _that = this;
switch (_that) {
case _MeetingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeetingDto value)?  $default,){
final _that = this;
switch (_that) {
case _MeetingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? agenda,  String mode,  String status, @JsonKey(name: 'start_at')  DateTime startAt, @JsonKey(name: 'end_at')  DateTime endAt, @JsonKey(name: 'meeting_url')  String? meetingUrl,  String? location,  Map<String, dynamic>? project,  Map<String, dynamic>? client,  Map<String, dynamic> organizer,  List<dynamic> participants,  String? notes,  Map<String, dynamic>? mom, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeetingDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? agenda,  String mode,  String status, @JsonKey(name: 'start_at')  DateTime startAt, @JsonKey(name: 'end_at')  DateTime endAt, @JsonKey(name: 'meeting_url')  String? meetingUrl,  String? location,  Map<String, dynamic>? project,  Map<String, dynamic>? client,  Map<String, dynamic> organizer,  List<dynamic> participants,  String? notes,  Map<String, dynamic>? mom, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MeetingDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? agenda,  String mode,  String status, @JsonKey(name: 'start_at')  DateTime startAt, @JsonKey(name: 'end_at')  DateTime endAt, @JsonKey(name: 'meeting_url')  String? meetingUrl,  String? location,  Map<String, dynamic>? project,  Map<String, dynamic>? client,  Map<String, dynamic> organizer,  List<dynamic> participants,  String? notes,  Map<String, dynamic>? mom, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MeetingDto() when $default != null:
return $default(_that.id,_that.title,_that.agenda,_that.mode,_that.status,_that.startAt,_that.endAt,_that.meetingUrl,_that.location,_that.project,_that.client,_that.organizer,_that.participants,_that.notes,_that.mom,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MeetingDto implements MeetingDto {
  const _MeetingDto({required this.id, required this.title, this.agenda, required this.mode, required this.status, @JsonKey(name: 'start_at') required this.startAt, @JsonKey(name: 'end_at') required this.endAt, @JsonKey(name: 'meeting_url') this.meetingUrl, this.location,  Map<String, dynamic>? project,  Map<String, dynamic>? client, required  Map<String, dynamic> organizer,  List<dynamic> participants = const <dynamic>[], this.notes,  Map<String, dynamic>? mom, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _project = project,_client = client,_organizer = organizer,_participants = participants,_mom = mom;
  factory _MeetingDto.fromJson(Map<String, dynamic> json) => _$MeetingDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? agenda;
@override final  String mode;
@override final  String status;
@override@JsonKey(name: 'start_at') final  DateTime startAt;
@override@JsonKey(name: 'end_at') final  DateTime endAt;
@override@JsonKey(name: 'meeting_url') final  String? meetingUrl;
@override final  String? location;
 final  Map<String, dynamic>? _project;
@override Map<String, dynamic>? get project {
  final value = _project;
  if (value == null) return null;
  if (_project is EqualUnmodifiableMapView) return _project;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _client;
@override Map<String, dynamic>? get client {
  final value = _client;
  if (value == null) return null;
  if (_client is EqualUnmodifiableMapView) return _client;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic> _organizer;
@override Map<String, dynamic> get organizer {
  if (_organizer is EqualUnmodifiableMapView) return _organizer;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_organizer);
}

 final  List<dynamic> _participants;
@override@JsonKey() List<dynamic> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  String? notes;
 final  Map<String, dynamic>? _mom;
@override Map<String, dynamic>? get mom {
  final value = _mom;
  if (value == null) return null;
  if (_mom is EqualUnmodifiableMapView) return _mom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of MeetingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeetingDtoCopyWith<_MeetingDto> get copyWith => __$MeetingDtoCopyWithImpl<_MeetingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeetingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeetingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.agenda, agenda) || other.agenda == agenda)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.meetingUrl, meetingUrl) || other.meetingUrl == meetingUrl)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.project, _project)&&const DeepCollectionEquality().equals(other.client, _client)&&const DeepCollectionEquality().equals(other.organizer, _organizer)&&const DeepCollectionEquality().equals(other.participants, _participants)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.mom, _mom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,agenda,mode,status,startAt,endAt,meetingUrl,location,const DeepCollectionEquality().hash(_project),const DeepCollectionEquality().hash(_client),const DeepCollectionEquality().hash(_organizer),const DeepCollectionEquality().hash(_participants),notes,const DeepCollectionEquality().hash(_mom),createdAt,updatedAt);
}

@override
String toString() {
    return 'MeetingDto(id: $id, title: $title, agenda: $agenda, mode: $mode, status: $status, startAt: $startAt, endAt: $endAt, meetingUrl: $meetingUrl, location: $location, project: $project, client: $client, organizer: $organizer, participants: $participants, notes: $notes, mom: $mom, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MeetingDtoCopyWith<$Res> implements $MeetingDtoCopyWith<$Res> {
  factory _$MeetingDtoCopyWith(_MeetingDto value, $Res Function(_MeetingDto) _then) = __$MeetingDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? agenda, String mode, String status,@JsonKey(name: 'start_at') DateTime startAt,@JsonKey(name: 'end_at') DateTime endAt,@JsonKey(name: 'meeting_url') String? meetingUrl, String? location, Map<String, dynamic>? project, Map<String, dynamic>? client, Map<String, dynamic> organizer, List<dynamic> participants, String? notes, Map<String, dynamic>? mom,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$MeetingDtoCopyWithImpl<$Res>
    implements _$MeetingDtoCopyWith<$Res> {
  __$MeetingDtoCopyWithImpl(this._self, this._then);

  final _MeetingDto _self;
  final $Res Function(_MeetingDto) _then;

/// Create a copy of MeetingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? agenda = freezed,Object? mode = null,Object? status = null,Object? startAt = null,Object? endAt = null,Object? meetingUrl = freezed,Object? location = freezed,Object? project = freezed,Object? client = freezed,Object? organizer = null,Object? participants = null,Object? notes = freezed,Object? mom = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MeetingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,agenda: freezed == agenda ? _self.agenda : agenda // ignore: cast_nullable_to_non_nullable
as String?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,meetingUrl: freezed == meetingUrl ? _self.meetingUrl : meetingUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,project: freezed == project ? _self._project : project // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,client: freezed == client ? _self._client : client // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,organizer: null == organizer ? _self._organizer : organizer // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<dynamic>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,mom: freezed == mom ? _self._mom : mom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

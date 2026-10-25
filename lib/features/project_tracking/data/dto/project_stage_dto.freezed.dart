// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_stage_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectStageDto {

 int get id; String get title;@JsonKey(name: 'is_completed') bool get isCompleted;@JsonKey(name: 'completed_at') String? get completedAt; List<StageDocumentDto> get documents;
/// Create a copy of ProjectStageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStageDtoCopyWith<ProjectStageDto> get copyWith => _$ProjectStageDtoCopyWithImpl<ProjectStageDto>(this as ProjectStageDto, _$identity);

  /// Serializes this ProjectStageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectStageDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectStageDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&const DeepCollectionEquality().equals(other.documents, _this.documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectStageDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.isCompleted,_this.completedAt,const DeepCollectionEquality().hash(_this.documents));
}

@override
String toString() {
  final _this = this as ProjectStageDto;
  return 'ProjectStageDto(id: ${_this.id}, title: ${_this.title}, isCompleted: ${_this.isCompleted}, completedAt: ${_this.completedAt}, documents: ${_this.documents})';
}


}

/// @nodoc
abstract mixin class $ProjectStageDtoCopyWith<$Res>  {
  factory $ProjectStageDtoCopyWith(ProjectStageDto value, $Res Function(ProjectStageDto) _then) = _$ProjectStageDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'is_completed') bool isCompleted,@JsonKey(name: 'completed_at') String? completedAt, List<StageDocumentDto> documents
});




}
/// @nodoc
class _$ProjectStageDtoCopyWithImpl<$Res>
    implements $ProjectStageDtoCopyWith<$Res> {
  _$ProjectStageDtoCopyWithImpl(this._self, this._then);

  final ProjectStageDto _self;
  final $Res Function(ProjectStageDto) _then;

/// Create a copy of ProjectStageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? documents = null,}) {
  return _then(ProjectStageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<StageDocumentDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectStageDto].
extension ProjectStageDtoPatterns on ProjectStageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectStageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectStageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectStageDto value)  $default,){
final _that = this;
switch (_that) {
case _ProjectStageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectStageDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectStageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'is_completed')  bool isCompleted, @JsonKey(name: 'completed_at')  String? completedAt,  List<StageDocumentDto> documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectStageDto() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted,_that.completedAt,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'is_completed')  bool isCompleted, @JsonKey(name: 'completed_at')  String? completedAt,  List<StageDocumentDto> documents)  $default,) {final _that = this;
switch (_that) {
case _ProjectStageDto():
return $default(_that.id,_that.title,_that.isCompleted,_that.completedAt,_that.documents);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'is_completed')  bool isCompleted, @JsonKey(name: 'completed_at')  String? completedAt,  List<StageDocumentDto> documents)?  $default,) {final _that = this;
switch (_that) {
case _ProjectStageDto() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted,_that.completedAt,_that.documents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectStageDto implements ProjectStageDto {
  const _ProjectStageDto({required this.id, required this.title, @JsonKey(name: 'is_completed') required this.isCompleted, @JsonKey(name: 'completed_at') this.completedAt,  List<StageDocumentDto> documents = const <StageDocumentDto>[]}): _documents = documents;
  factory _ProjectStageDto.fromJson(Map<String, dynamic> json) => _$ProjectStageDtoFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'is_completed') final  bool isCompleted;
@override@JsonKey(name: 'completed_at') final  String? completedAt;
 final  List<StageDocumentDto> _documents;
@override@JsonKey() List<StageDocumentDto> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of ProjectStageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectStageDtoCopyWith<_ProjectStageDto> get copyWith => __$ProjectStageDtoCopyWithImpl<_ProjectStageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectStageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectStageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.documents, _documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,isCompleted,completedAt,const DeepCollectionEquality().hash(_documents));
}

@override
String toString() {
    return 'ProjectStageDto(id: $id, title: $title, isCompleted: $isCompleted, completedAt: $completedAt, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$ProjectStageDtoCopyWith<$Res> implements $ProjectStageDtoCopyWith<$Res> {
  factory _$ProjectStageDtoCopyWith(_ProjectStageDto value, $Res Function(_ProjectStageDto) _then) = __$ProjectStageDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'is_completed') bool isCompleted,@JsonKey(name: 'completed_at') String? completedAt, List<StageDocumentDto> documents
});




}
/// @nodoc
class __$ProjectStageDtoCopyWithImpl<$Res>
    implements _$ProjectStageDtoCopyWith<$Res> {
  __$ProjectStageDtoCopyWithImpl(this._self, this._then);

  final _ProjectStageDto _self;
  final $Res Function(_ProjectStageDto) _then;

/// Create a copy of ProjectStageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? documents = null,}) {
  return _then(_ProjectStageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<StageDocumentDto>,
  ));
}


}

// dart format on

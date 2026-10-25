// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_stage_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectStageEntity {

 int get id; String get title; bool get isCompleted; DateTime? get completedAt; List<StageDocumentEntity> get documents;
/// Create a copy of ProjectStageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStageEntityCopyWith<ProjectStageEntity> get copyWith => _$ProjectStageEntityCopyWithImpl<ProjectStageEntity>(this as ProjectStageEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectStageEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectStageEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&const DeepCollectionEquality().equals(other.documents, _this.documents));
}


@override
int get hashCode {
  final _this = this as ProjectStageEntity;
  return Object.hash(runtimeType,_this.id,_this.title,_this.isCompleted,_this.completedAt,const DeepCollectionEquality().hash(_this.documents));
}

@override
String toString() {
  final _this = this as ProjectStageEntity;
  return 'ProjectStageEntity(id: ${_this.id}, title: ${_this.title}, isCompleted: ${_this.isCompleted}, completedAt: ${_this.completedAt}, documents: ${_this.documents})';
}


}

/// @nodoc
abstract mixin class $ProjectStageEntityCopyWith<$Res>  {
  factory $ProjectStageEntityCopyWith(ProjectStageEntity value, $Res Function(ProjectStageEntity) _then) = _$ProjectStageEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, bool isCompleted, DateTime? completedAt, List<StageDocumentEntity> documents
});




}
/// @nodoc
class _$ProjectStageEntityCopyWithImpl<$Res>
    implements $ProjectStageEntityCopyWith<$Res> {
  _$ProjectStageEntityCopyWithImpl(this._self, this._then);

  final ProjectStageEntity _self;
  final $Res Function(ProjectStageEntity) _then;

/// Create a copy of ProjectStageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? documents = null,}) {
  return _then(ProjectStageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<StageDocumentEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectStageEntity].
extension ProjectStageEntityPatterns on ProjectStageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectStageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectStageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectStageEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProjectStageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectStageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectStageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  bool isCompleted,  DateTime? completedAt,  List<StageDocumentEntity> documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectStageEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  bool isCompleted,  DateTime? completedAt,  List<StageDocumentEntity> documents)  $default,) {final _that = this;
switch (_that) {
case _ProjectStageEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  bool isCompleted,  DateTime? completedAt,  List<StageDocumentEntity> documents)?  $default,) {final _that = this;
switch (_that) {
case _ProjectStageEntity() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted,_that.completedAt,_that.documents);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectStageEntity extends ProjectStageEntity {
  const _ProjectStageEntity({required this.id, required this.title, required this.isCompleted, this.completedAt,  List<StageDocumentEntity> documents = const <StageDocumentEntity>[]}): _documents = documents,super._();
  

@override final  int id;
@override final  String title;
@override final  bool isCompleted;
@override final  DateTime? completedAt;
 final  List<StageDocumentEntity> _documents;
@override@JsonKey() List<StageDocumentEntity> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of ProjectStageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectStageEntityCopyWith<_ProjectStageEntity> get copyWith => __$ProjectStageEntityCopyWithImpl<_ProjectStageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectStageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.documents, _documents));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,isCompleted,completedAt,const DeepCollectionEquality().hash(_documents));
}

@override
String toString() {
    return 'ProjectStageEntity(id: $id, title: $title, isCompleted: $isCompleted, completedAt: $completedAt, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$ProjectStageEntityCopyWith<$Res> implements $ProjectStageEntityCopyWith<$Res> {
  factory _$ProjectStageEntityCopyWith(_ProjectStageEntity value, $Res Function(_ProjectStageEntity) _then) = __$ProjectStageEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, bool isCompleted, DateTime? completedAt, List<StageDocumentEntity> documents
});




}
/// @nodoc
class __$ProjectStageEntityCopyWithImpl<$Res>
    implements _$ProjectStageEntityCopyWith<$Res> {
  __$ProjectStageEntityCopyWithImpl(this._self, this._then);

  final _ProjectStageEntity _self;
  final $Res Function(_ProjectStageEntity) _then;

/// Create a copy of ProjectStageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? documents = null,}) {
  return _then(_ProjectStageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<StageDocumentEntity>,
  ));
}


}

// dart format on

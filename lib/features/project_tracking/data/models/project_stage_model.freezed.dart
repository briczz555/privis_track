// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_stage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectStageModel {

 int get id; String get title; bool get isCompleted; DateTime? get completedAt; List<StageDocumentModel> get documents;
/// Create a copy of ProjectStageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStageModelCopyWith<ProjectStageModel> get copyWith => _$ProjectStageModelCopyWithImpl<ProjectStageModel>(this as ProjectStageModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectStageModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectStageModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&const DeepCollectionEquality().equals(other.documents, _this.documents));
}


@override
int get hashCode {
  final _this = this as ProjectStageModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.isCompleted,_this.completedAt,const DeepCollectionEquality().hash(_this.documents));
}

@override
String toString() {
  final _this = this as ProjectStageModel;
  return 'ProjectStageModel(id: ${_this.id}, title: ${_this.title}, isCompleted: ${_this.isCompleted}, completedAt: ${_this.completedAt}, documents: ${_this.documents})';
}


}

/// @nodoc
abstract mixin class $ProjectStageModelCopyWith<$Res>  {
  factory $ProjectStageModelCopyWith(ProjectStageModel value, $Res Function(ProjectStageModel) _then) = _$ProjectStageModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, bool isCompleted, DateTime? completedAt, List<StageDocumentModel> documents
});




}
/// @nodoc
class _$ProjectStageModelCopyWithImpl<$Res>
    implements $ProjectStageModelCopyWith<$Res> {
  _$ProjectStageModelCopyWithImpl(this._self, this._then);

  final ProjectStageModel _self;
  final $Res Function(ProjectStageModel) _then;

/// Create a copy of ProjectStageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? documents = null,}) {
  return _then(ProjectStageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<StageDocumentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectStageModel].
extension ProjectStageModelPatterns on ProjectStageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectStageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectStageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectStageModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectStageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectStageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectStageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  bool isCompleted,  DateTime? completedAt,  List<StageDocumentModel> documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectStageModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  bool isCompleted,  DateTime? completedAt,  List<StageDocumentModel> documents)  $default,) {final _that = this;
switch (_that) {
case _ProjectStageModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  bool isCompleted,  DateTime? completedAt,  List<StageDocumentModel> documents)?  $default,) {final _that = this;
switch (_that) {
case _ProjectStageModel() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted,_that.completedAt,_that.documents);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectStageModel extends ProjectStageModel {
  const _ProjectStageModel({required this.id, required this.title, required this.isCompleted, this.completedAt,  List<StageDocumentModel> documents = const <StageDocumentModel>[]}): _documents = documents,super._();
  

@override final  int id;
@override final  String title;
@override final  bool isCompleted;
@override final  DateTime? completedAt;
 final  List<StageDocumentModel> _documents;
@override@JsonKey() List<StageDocumentModel> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of ProjectStageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectStageModelCopyWith<_ProjectStageModel> get copyWith => __$ProjectStageModelCopyWithImpl<_ProjectStageModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectStageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.documents, _documents));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,isCompleted,completedAt,const DeepCollectionEquality().hash(_documents));
}

@override
String toString() {
    return 'ProjectStageModel(id: $id, title: $title, isCompleted: $isCompleted, completedAt: $completedAt, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$ProjectStageModelCopyWith<$Res> implements $ProjectStageModelCopyWith<$Res> {
  factory _$ProjectStageModelCopyWith(_ProjectStageModel value, $Res Function(_ProjectStageModel) _then) = __$ProjectStageModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, bool isCompleted, DateTime? completedAt, List<StageDocumentModel> documents
});




}
/// @nodoc
class __$ProjectStageModelCopyWithImpl<$Res>
    implements _$ProjectStageModelCopyWith<$Res> {
  __$ProjectStageModelCopyWithImpl(this._self, this._then);

  final _ProjectStageModel _self;
  final $Res Function(_ProjectStageModel) _then;

/// Create a copy of ProjectStageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? documents = null,}) {
  return _then(_ProjectStageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<StageDocumentModel>,
  ));
}


}

// dart format on

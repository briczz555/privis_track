// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectListModel {

 List<ProjectModel> get projects; PaginationMetaModel get meta;
/// Create a copy of ProjectListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListModelCopyWith<ProjectListModel> get copyWith => _$ProjectListModelCopyWithImpl<ProjectListModel>(this as ProjectListModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectListModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListModel&&const DeepCollectionEquality().equals(other.projects, _this.projects)&&(identical(other.meta, _this.meta) || other.meta == _this.meta));
}


@override
int get hashCode {
  final _this = this as ProjectListModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.projects),_this.meta);
}

@override
String toString() {
  final _this = this as ProjectListModel;
  return 'ProjectListModel(projects: ${_this.projects}, meta: ${_this.meta})';
}


}

/// @nodoc
abstract mixin class $ProjectListModelCopyWith<$Res>  {
  factory $ProjectListModelCopyWith(ProjectListModel value, $Res Function(ProjectListModel) _then) = _$ProjectListModelCopyWithImpl;
@useResult
$Res call({
 List<ProjectModel> projects, PaginationMetaModel meta
});


$PaginationMetaModelCopyWith<$Res> get meta;

}
/// @nodoc
class _$ProjectListModelCopyWithImpl<$Res>
    implements $ProjectListModelCopyWith<$Res> {
  _$ProjectListModelCopyWithImpl(this._self, this._then);

  final ProjectListModel _self;
  final $Res Function(ProjectListModel) _then;

/// Create a copy of ProjectListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? meta = null,}) {
  return _then(ProjectListModel(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaModel,
  ));
}
/// Create a copy of ProjectListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaModelCopyWith<$Res> get meta {
  
  return $PaginationMetaModelCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectListModel].
extension ProjectListModelPatterns on ProjectListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectListModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectModel> projects,  PaginationMetaModel meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectListModel() when $default != null:
return $default(_that.projects,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectModel> projects,  PaginationMetaModel meta)  $default,) {final _that = this;
switch (_that) {
case _ProjectListModel():
return $default(_that.projects,_that.meta);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectModel> projects,  PaginationMetaModel meta)?  $default,) {final _that = this;
switch (_that) {
case _ProjectListModel() when $default != null:
return $default(_that.projects,_that.meta);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectListModel extends ProjectListModel {
  const _ProjectListModel({required  List<ProjectModel> projects, required this.meta}): _projects = projects,super._();
  

 final  List<ProjectModel> _projects;
@override List<ProjectModel> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override final  PaginationMetaModel meta;

/// Create a copy of ProjectListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectListModelCopyWith<_ProjectListModel> get copyWith => __$ProjectListModelCopyWithImpl<_ProjectListModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectListModel&&const DeepCollectionEquality().equals(other.projects, _projects)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),meta);
}

@override
String toString() {
    return 'ProjectListModel(projects: $projects, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ProjectListModelCopyWith<$Res> implements $ProjectListModelCopyWith<$Res> {
  factory _$ProjectListModelCopyWith(_ProjectListModel value, $Res Function(_ProjectListModel) _then) = __$ProjectListModelCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectModel> projects, PaginationMetaModel meta
});


@override $PaginationMetaModelCopyWith<$Res> get meta;

}
/// @nodoc
class __$ProjectListModelCopyWithImpl<$Res>
    implements _$ProjectListModelCopyWith<$Res> {
  __$ProjectListModelCopyWithImpl(this._self, this._then);

  final _ProjectListModel _self;
  final $Res Function(_ProjectListModel) _then;

/// Create a copy of ProjectListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? meta = null,}) {
  return _then(_ProjectListModel(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaModel,
  ));
}

/// Create a copy of ProjectListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaModelCopyWith<$Res> get meta {
  
  return $PaginationMetaModelCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on

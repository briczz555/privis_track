// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectListDto {

 List<ProjectSummaryDto> get data; PaginationMetaDto get meta;
/// Create a copy of ProjectListDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListDtoCopyWith<ProjectListDto> get copyWith => _$ProjectListDtoCopyWithImpl<ProjectListDto>(this as ProjectListDto, _$identity);

  /// Serializes this ProjectListDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectListDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListDto&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.meta, _this.meta) || other.meta == _this.meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectListDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.data),_this.meta);
}

@override
String toString() {
  final _this = this as ProjectListDto;
  return 'ProjectListDto(data: ${_this.data}, meta: ${_this.meta})';
}


}

/// @nodoc
abstract mixin class $ProjectListDtoCopyWith<$Res>  {
  factory $ProjectListDtoCopyWith(ProjectListDto value, $Res Function(ProjectListDto) _then) = _$ProjectListDtoCopyWithImpl;
@useResult
$Res call({
 List<ProjectSummaryDto> data, PaginationMetaDto meta
});


$PaginationMetaDtoCopyWith<$Res> get meta;

}
/// @nodoc
class _$ProjectListDtoCopyWithImpl<$Res>
    implements $ProjectListDtoCopyWith<$Res> {
  _$ProjectListDtoCopyWithImpl(this._self, this._then);

  final ProjectListDto _self;
  final $Res Function(ProjectListDto) _then;

/// Create a copy of ProjectListDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? meta = null,}) {
  return _then(ProjectListDto(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProjectSummaryDto>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaDto,
  ));
}
/// Create a copy of ProjectListDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaDtoCopyWith<$Res> get meta {
  
  return $PaginationMetaDtoCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectListDto].
extension ProjectListDtoPatterns on ProjectListDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectListDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectListDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectListDto value)  $default,){
final _that = this;
switch (_that) {
case _ProjectListDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectListDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectListDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectSummaryDto> data,  PaginationMetaDto meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectListDto() when $default != null:
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectSummaryDto> data,  PaginationMetaDto meta)  $default,) {final _that = this;
switch (_that) {
case _ProjectListDto():
return $default(_that.data,_that.meta);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectSummaryDto> data,  PaginationMetaDto meta)?  $default,) {final _that = this;
switch (_that) {
case _ProjectListDto() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectListDto implements ProjectListDto {
  const _ProjectListDto({required  List<ProjectSummaryDto> data, required this.meta}): _data = data;
  factory _ProjectListDto.fromJson(Map<String, dynamic> json) => _$ProjectListDtoFromJson(json);

 final  List<ProjectSummaryDto> _data;
@override List<ProjectSummaryDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMetaDto meta;

/// Create a copy of ProjectListDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectListDtoCopyWith<_ProjectListDto> get copyWith => __$ProjectListDtoCopyWithImpl<_ProjectListDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectListDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectListDto&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),meta);
}

@override
String toString() {
    return 'ProjectListDto(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ProjectListDtoCopyWith<$Res> implements $ProjectListDtoCopyWith<$Res> {
  factory _$ProjectListDtoCopyWith(_ProjectListDto value, $Res Function(_ProjectListDto) _then) = __$ProjectListDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectSummaryDto> data, PaginationMetaDto meta
});


@override $PaginationMetaDtoCopyWith<$Res> get meta;

}
/// @nodoc
class __$ProjectListDtoCopyWithImpl<$Res>
    implements _$ProjectListDtoCopyWith<$Res> {
  __$ProjectListDtoCopyWithImpl(this._self, this._then);

  final _ProjectListDto _self;
  final $Res Function(_ProjectListDto) _then;

/// Create a copy of ProjectListDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_ProjectListDto(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProjectSummaryDto>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaDto,
  ));
}

/// Create a copy of ProjectListDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaDtoCopyWith<$Res> get meta {
  
  return $PaginationMetaDtoCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on

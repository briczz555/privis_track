// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_slice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioSliceDto {

 String get status; int get count; double get percentage;
/// Create a copy of PortfolioSliceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioSliceDtoCopyWith<PortfolioSliceDto> get copyWith => _$PortfolioSliceDtoCopyWithImpl<PortfolioSliceDto>(this as PortfolioSliceDto, _$identity);

  /// Serializes this PortfolioSliceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PortfolioSliceDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioSliceDto&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.percentage, _this.percentage) || other.percentage == _this.percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PortfolioSliceDto;
  return Object.hash(runtimeType,_this.status,_this.count,_this.percentage);
}

@override
String toString() {
  final _this = this as PortfolioSliceDto;
  return 'PortfolioSliceDto(status: ${_this.status}, count: ${_this.count}, percentage: ${_this.percentage})';
}


}

/// @nodoc
abstract mixin class $PortfolioSliceDtoCopyWith<$Res>  {
  factory $PortfolioSliceDtoCopyWith(PortfolioSliceDto value, $Res Function(PortfolioSliceDto) _then) = _$PortfolioSliceDtoCopyWithImpl;
@useResult
$Res call({
 String status, int count, double percentage
});




}
/// @nodoc
class _$PortfolioSliceDtoCopyWithImpl<$Res>
    implements $PortfolioSliceDtoCopyWith<$Res> {
  _$PortfolioSliceDtoCopyWithImpl(this._self, this._then);

  final PortfolioSliceDto _self;
  final $Res Function(PortfolioSliceDto) _then;

/// Create a copy of PortfolioSliceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? count = null,Object? percentage = null,}) {
  return _then(PortfolioSliceDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioSliceDto].
extension PortfolioSliceDtoPatterns on PortfolioSliceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioSliceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioSliceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioSliceDto value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioSliceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioSliceDto value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioSliceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int count,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioSliceDto() when $default != null:
return $default(_that.status,_that.count,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int count,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _PortfolioSliceDto():
return $default(_that.status,_that.count,_that.percentage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int count,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioSliceDto() when $default != null:
return $default(_that.status,_that.count,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioSliceDto implements PortfolioSliceDto {
  const _PortfolioSliceDto({required this.status, required this.count, required this.percentage});
  factory _PortfolioSliceDto.fromJson(Map<String, dynamic> json) => _$PortfolioSliceDtoFromJson(json);

@override final  String status;
@override final  int count;
@override final  double percentage;

/// Create a copy of PortfolioSliceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioSliceDtoCopyWith<_PortfolioSliceDto> get copyWith => __$PortfolioSliceDtoCopyWithImpl<_PortfolioSliceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioSliceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioSliceDto&&(identical(other.status, status) || other.status == status)&&(identical(other.count, count) || other.count == count)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,count,percentage);
}

@override
String toString() {
    return 'PortfolioSliceDto(status: $status, count: $count, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$PortfolioSliceDtoCopyWith<$Res> implements $PortfolioSliceDtoCopyWith<$Res> {
  factory _$PortfolioSliceDtoCopyWith(_PortfolioSliceDto value, $Res Function(_PortfolioSliceDto) _then) = __$PortfolioSliceDtoCopyWithImpl;
@override @useResult
$Res call({
 String status, int count, double percentage
});




}
/// @nodoc
class __$PortfolioSliceDtoCopyWithImpl<$Res>
    implements _$PortfolioSliceDtoCopyWith<$Res> {
  __$PortfolioSliceDtoCopyWithImpl(this._self, this._then);

  final _PortfolioSliceDto _self;
  final $Res Function(_PortfolioSliceDto) _then;

/// Create a copy of PortfolioSliceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? count = null,Object? percentage = null,}) {
  return _then(_PortfolioSliceDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

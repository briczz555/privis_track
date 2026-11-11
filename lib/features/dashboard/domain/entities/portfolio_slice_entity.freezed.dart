// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_slice_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioSliceEntity {

 ProjectStatus get status; int get count; double get percentage;
/// Create a copy of PortfolioSliceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioSliceEntityCopyWith<PortfolioSliceEntity> get copyWith => _$PortfolioSliceEntityCopyWithImpl<PortfolioSliceEntity>(this as PortfolioSliceEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PortfolioSliceEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioSliceEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.percentage, _this.percentage) || other.percentage == _this.percentage));
}


@override
int get hashCode {
  final _this = this as PortfolioSliceEntity;
  return Object.hash(runtimeType,_this.status,_this.count,_this.percentage);
}

@override
String toString() {
  final _this = this as PortfolioSliceEntity;
  return 'PortfolioSliceEntity(status: ${_this.status}, count: ${_this.count}, percentage: ${_this.percentage})';
}


}

/// @nodoc
abstract mixin class $PortfolioSliceEntityCopyWith<$Res>  {
  factory $PortfolioSliceEntityCopyWith(PortfolioSliceEntity value, $Res Function(PortfolioSliceEntity) _then) = _$PortfolioSliceEntityCopyWithImpl;
@useResult
$Res call({
 ProjectStatus status, int count, double percentage
});




}
/// @nodoc
class _$PortfolioSliceEntityCopyWithImpl<$Res>
    implements $PortfolioSliceEntityCopyWith<$Res> {
  _$PortfolioSliceEntityCopyWithImpl(this._self, this._then);

  final PortfolioSliceEntity _self;
  final $Res Function(PortfolioSliceEntity) _then;

/// Create a copy of PortfolioSliceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? count = null,Object? percentage = null,}) {
  return _then(PortfolioSliceEntity(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioSliceEntity].
extension PortfolioSliceEntityPatterns on PortfolioSliceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioSliceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioSliceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioSliceEntity value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioSliceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioSliceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioSliceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectStatus status,  int count,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioSliceEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectStatus status,  int count,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _PortfolioSliceEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectStatus status,  int count,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioSliceEntity() when $default != null:
return $default(_that.status,_that.count,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioSliceEntity implements PortfolioSliceEntity {
  const _PortfolioSliceEntity({required this.status, required this.count, required this.percentage});
  

@override final  ProjectStatus status;
@override final  int count;
@override final  double percentage;

/// Create a copy of PortfolioSliceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioSliceEntityCopyWith<_PortfolioSliceEntity> get copyWith => __$PortfolioSliceEntityCopyWithImpl<_PortfolioSliceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioSliceEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.count, count) || other.count == count)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,count,percentage);
}

@override
String toString() {
    return 'PortfolioSliceEntity(status: $status, count: $count, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$PortfolioSliceEntityCopyWith<$Res> implements $PortfolioSliceEntityCopyWith<$Res> {
  factory _$PortfolioSliceEntityCopyWith(_PortfolioSliceEntity value, $Res Function(_PortfolioSliceEntity) _then) = __$PortfolioSliceEntityCopyWithImpl;
@override @useResult
$Res call({
 ProjectStatus status, int count, double percentage
});




}
/// @nodoc
class __$PortfolioSliceEntityCopyWithImpl<$Res>
    implements _$PortfolioSliceEntityCopyWith<$Res> {
  __$PortfolioSliceEntityCopyWithImpl(this._self, this._then);

  final _PortfolioSliceEntity _self;
  final $Res Function(_PortfolioSliceEntity) _then;

/// Create a copy of PortfolioSliceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? count = null,Object? percentage = null,}) {
  return _then(_PortfolioSliceEntity(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

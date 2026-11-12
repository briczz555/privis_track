// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_meta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationMetaModel {

 int get page; int get limit; int get total; int get totalPages; Map<String, int> get statusCounts;
/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaModelCopyWith<PaginationMetaModel> get copyWith => _$PaginationMetaModelCopyWithImpl<PaginationMetaModel>(this as PaginationMetaModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaginationMetaModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMetaModel&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.limit, _this.limit) || other.limit == _this.limit)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.totalPages, _this.totalPages) || other.totalPages == _this.totalPages)&&const DeepCollectionEquality().equals(other.statusCounts, _this.statusCounts));
}


@override
int get hashCode {
  final _this = this as PaginationMetaModel;
  return Object.hash(runtimeType,_this.page,_this.limit,_this.total,_this.totalPages,const DeepCollectionEquality().hash(_this.statusCounts));
}

@override
String toString() {
  final _this = this as PaginationMetaModel;
  return 'PaginationMetaModel(page: ${_this.page}, limit: ${_this.limit}, total: ${_this.total}, totalPages: ${_this.totalPages}, statusCounts: ${_this.statusCounts})';
}


}

/// @nodoc
abstract mixin class $PaginationMetaModelCopyWith<$Res>  {
  factory $PaginationMetaModelCopyWith(PaginationMetaModel value, $Res Function(PaginationMetaModel) _then) = _$PaginationMetaModelCopyWithImpl;
@useResult
$Res call({
 int page, int limit, int total, int totalPages, Map<String, int> statusCounts
});




}
/// @nodoc
class _$PaginationMetaModelCopyWithImpl<$Res>
    implements $PaginationMetaModelCopyWith<$Res> {
  _$PaginationMetaModelCopyWithImpl(this._self, this._then);

  final PaginationMetaModel _self;
  final $Res Function(PaginationMetaModel) _then;

/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? total = null,Object? totalPages = null,Object? statusCounts = null,}) {
  return _then(PaginationMetaModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,statusCounts: null == statusCounts ? _self.statusCounts : statusCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationMetaModel].
extension PaginationMetaModelPatterns on PaginationMetaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit,  int total,  int totalPages,  Map<String, int> statusCounts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
return $default(_that.page,_that.limit,_that.total,_that.totalPages,_that.statusCounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit,  int total,  int totalPages,  Map<String, int> statusCounts)  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaModel():
return $default(_that.page,_that.limit,_that.total,_that.totalPages,_that.statusCounts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit,  int total,  int totalPages,  Map<String, int> statusCounts)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
return $default(_that.page,_that.limit,_that.total,_that.totalPages,_that.statusCounts);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationMetaModel implements PaginationMetaModel {
  const _PaginationMetaModel({required this.page, required this.limit, required this.total, required this.totalPages,  Map<String, int> statusCounts = const <String, int>{}}): _statusCounts = statusCounts;
  

@override final  int page;
@override final  int limit;
@override final  int total;
@override final  int totalPages;
 final  Map<String, int> _statusCounts;
@override@JsonKey() Map<String, int> get statusCounts {
  if (_statusCounts is EqualUnmodifiableMapView) return _statusCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_statusCounts);
}


/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaModelCopyWith<_PaginationMetaModel> get copyWith => __$PaginationMetaModelCopyWithImpl<_PaginationMetaModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMetaModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&const DeepCollectionEquality().equals(other.statusCounts, _statusCounts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,page,limit,total,totalPages,const DeepCollectionEquality().hash(_statusCounts));
}

@override
String toString() {
    return 'PaginationMetaModel(page: $page, limit: $limit, total: $total, totalPages: $totalPages, statusCounts: $statusCounts)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaModelCopyWith<$Res> implements $PaginationMetaModelCopyWith<$Res> {
  factory _$PaginationMetaModelCopyWith(_PaginationMetaModel value, $Res Function(_PaginationMetaModel) _then) = __$PaginationMetaModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, int total, int totalPages, Map<String, int> statusCounts
});




}
/// @nodoc
class __$PaginationMetaModelCopyWithImpl<$Res>
    implements _$PaginationMetaModelCopyWith<$Res> {
  __$PaginationMetaModelCopyWithImpl(this._self, this._then);

  final _PaginationMetaModel _self;
  final $Res Function(_PaginationMetaModel) _then;

/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? total = null,Object? totalPages = null,Object? statusCounts = null,}) {
  return _then(_PaginationMetaModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,statusCounts: null == statusCounts ? _self._statusCounts : statusCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on

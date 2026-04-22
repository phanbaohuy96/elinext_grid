// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GridState {

 List<ImageItem> get images; int get reloadGeneration;
/// Create a copy of GridState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GridStateCopyWith<GridState> get copyWith => _$GridStateCopyWithImpl<GridState>(this as GridState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GridState&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.reloadGeneration, reloadGeneration) || other.reloadGeneration == reloadGeneration));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images),reloadGeneration);

@override
String toString() {
  return 'GridState(images: $images, reloadGeneration: $reloadGeneration)';
}


}

/// @nodoc
abstract mixin class $GridStateCopyWith<$Res>  {
  factory $GridStateCopyWith(GridState value, $Res Function(GridState) _then) = _$GridStateCopyWithImpl;
@useResult
$Res call({
 List<ImageItem> images, int reloadGeneration
});




}
/// @nodoc
class _$GridStateCopyWithImpl<$Res>
    implements $GridStateCopyWith<$Res> {
  _$GridStateCopyWithImpl(this._self, this._then);

  final GridState _self;
  final $Res Function(GridState) _then;

/// Create a copy of GridState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? images = null,Object? reloadGeneration = null,}) {
  return _then(_self.copyWith(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ImageItem>,reloadGeneration: null == reloadGeneration ? _self.reloadGeneration : reloadGeneration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GridState].
extension GridStatePatterns on GridState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GridState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GridState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GridState value)  $default,){
final _that = this;
switch (_that) {
case _GridState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GridState value)?  $default,){
final _that = this;
switch (_that) {
case _GridState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ImageItem> images,  int reloadGeneration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GridState() when $default != null:
return $default(_that.images,_that.reloadGeneration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ImageItem> images,  int reloadGeneration)  $default,) {final _that = this;
switch (_that) {
case _GridState():
return $default(_that.images,_that.reloadGeneration);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ImageItem> images,  int reloadGeneration)?  $default,) {final _that = this;
switch (_that) {
case _GridState() when $default != null:
return $default(_that.images,_that.reloadGeneration);case _:
  return null;

}
}

}

/// @nodoc


class _GridState implements GridState {
  const _GridState({final  List<ImageItem> images = const <ImageItem>[], this.reloadGeneration = 0}): _images = images;
  

 final  List<ImageItem> _images;
@override@JsonKey() List<ImageItem> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey() final  int reloadGeneration;

/// Create a copy of GridState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GridStateCopyWith<_GridState> get copyWith => __$GridStateCopyWithImpl<_GridState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GridState&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.reloadGeneration, reloadGeneration) || other.reloadGeneration == reloadGeneration));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images),reloadGeneration);

@override
String toString() {
  return 'GridState(images: $images, reloadGeneration: $reloadGeneration)';
}


}

/// @nodoc
abstract mixin class _$GridStateCopyWith<$Res> implements $GridStateCopyWith<$Res> {
  factory _$GridStateCopyWith(_GridState value, $Res Function(_GridState) _then) = __$GridStateCopyWithImpl;
@override @useResult
$Res call({
 List<ImageItem> images, int reloadGeneration
});




}
/// @nodoc
class __$GridStateCopyWithImpl<$Res>
    implements _$GridStateCopyWith<$Res> {
  __$GridStateCopyWithImpl(this._self, this._then);

  final _GridState _self;
  final $Res Function(_GridState) _then;

/// Create a copy of GridState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = null,Object? reloadGeneration = null,}) {
  return _then(_GridState(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ImageItem>,reloadGeneration: null == reloadGeneration ? _self.reloadGeneration : reloadGeneration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

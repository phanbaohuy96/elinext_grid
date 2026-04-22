// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GridEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GridEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GridEvent()';
}


}

/// @nodoc
class $GridEventCopyWith<$Res>  {
$GridEventCopyWith(GridEvent _, $Res Function(GridEvent) __);
}


/// Adds pattern-matching-related methods to [GridEvent].
extension GridEventPatterns on GridEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadInitial value)?  loadInitial,TResult Function( AddImageRequested value)?  addImageRequested,TResult Function( ReloadAllRequested value)?  reloadAllRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadInitial() when loadInitial != null:
return loadInitial(_that);case AddImageRequested() when addImageRequested != null:
return addImageRequested(_that);case ReloadAllRequested() when reloadAllRequested != null:
return reloadAllRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadInitial value)  loadInitial,required TResult Function( AddImageRequested value)  addImageRequested,required TResult Function( ReloadAllRequested value)  reloadAllRequested,}){
final _that = this;
switch (_that) {
case LoadInitial():
return loadInitial(_that);case AddImageRequested():
return addImageRequested(_that);case ReloadAllRequested():
return reloadAllRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadInitial value)?  loadInitial,TResult? Function( AddImageRequested value)?  addImageRequested,TResult? Function( ReloadAllRequested value)?  reloadAllRequested,}){
final _that = this;
switch (_that) {
case LoadInitial() when loadInitial != null:
return loadInitial(_that);case AddImageRequested() when addImageRequested != null:
return addImageRequested(_that);case ReloadAllRequested() when reloadAllRequested != null:
return reloadAllRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadInitial,TResult Function()?  addImageRequested,TResult Function()?  reloadAllRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadInitial() when loadInitial != null:
return loadInitial();case AddImageRequested() when addImageRequested != null:
return addImageRequested();case ReloadAllRequested() when reloadAllRequested != null:
return reloadAllRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadInitial,required TResult Function()  addImageRequested,required TResult Function()  reloadAllRequested,}) {final _that = this;
switch (_that) {
case LoadInitial():
return loadInitial();case AddImageRequested():
return addImageRequested();case ReloadAllRequested():
return reloadAllRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadInitial,TResult? Function()?  addImageRequested,TResult? Function()?  reloadAllRequested,}) {final _that = this;
switch (_that) {
case LoadInitial() when loadInitial != null:
return loadInitial();case AddImageRequested() when addImageRequested != null:
return addImageRequested();case ReloadAllRequested() when reloadAllRequested != null:
return reloadAllRequested();case _:
  return null;

}
}

}

/// @nodoc


class LoadInitial implements GridEvent {
  const LoadInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GridEvent.loadInitial()';
}


}




/// @nodoc


class AddImageRequested implements GridEvent {
  const AddImageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddImageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GridEvent.addImageRequested()';
}


}




/// @nodoc


class ReloadAllRequested implements GridEvent {
  const ReloadAllRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReloadAllRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GridEvent.reloadAllRequested()';
}


}




// dart format on

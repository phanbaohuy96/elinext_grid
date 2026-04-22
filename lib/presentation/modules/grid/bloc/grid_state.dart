import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/image_item.dart';

part 'grid_state.freezed.dart';

@freezed
abstract class GridState with _$GridState {
  const factory GridState({
    @Default(<ImageItem>[]) List<ImageItem> images,
    @Default(0) int reloadGeneration,
  }) = _GridState;
}

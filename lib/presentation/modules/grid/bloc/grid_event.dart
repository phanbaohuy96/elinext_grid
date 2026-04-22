import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_event.freezed.dart';

@freezed
sealed class GridEvent with _$GridEvent {
  const factory GridEvent.loadInitial() = LoadInitial;
  const factory GridEvent.addImageRequested() = AddImageRequested;
  const factory GridEvent.reloadAllRequested() = ReloadAllRequested;
}

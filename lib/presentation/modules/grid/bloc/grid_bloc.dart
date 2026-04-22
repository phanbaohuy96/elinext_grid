import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/add_image.dart';
import '../../../../domain/usecases/load_image_batch.dart';
import 'grid_event.dart';
import 'grid_state.dart';

@injectable
class GridBloc extends Bloc<GridEvent, GridState> {
  GridBloc(this._loadBatch, this._addImage) : super(const GridState()) {
    on<LoadInitial>(_onLoadInitial, transformer: droppable());
    on<AddImageRequested>(_onAddImage, transformer: sequential());
    on<ReloadAllRequested>(_onReloadAll, transformer: droppable());
  }

  final LoadImageBatch _loadBatch;
  final AddImage _addImage;

  void _onLoadInitial(LoadInitial event, Emitter<GridState> emit) {
    emit(GridState(images: _loadBatch()));
  }

  void _onAddImage(AddImageRequested event, Emitter<GridState> emit) {
    emit(state.copyWith(images: [...state.images, _addImage()]));
  }

  void _onReloadAll(ReloadAllRequested event, Emitter<GridState> emit) {
    emit(
      GridState(
        images: _loadBatch(),
        reloadGeneration: state.reloadGeneration + 1,
      ),
    );
  }
}

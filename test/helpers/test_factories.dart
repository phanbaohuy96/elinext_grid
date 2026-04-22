import 'package:elinext_grid/domain/entities/image_item.dart';
import 'package:elinext_grid/domain/usecases/add_image.dart';
import 'package:elinext_grid/domain/usecases/load_image_batch.dart';
import 'package:elinext_grid/presentation/modules/grid/bloc/grid_bloc.dart';

import 'fake_image_repository.dart';

GridBloc buildGridBloc([FakeImageRepository? repo]) {
  final r = repo ?? FakeImageRepository();
  return GridBloc(LoadImageBatch(r), AddImage(r));
}

ImageItem fixtureImage(int n) =>
    ImageItem(id: 'seed-$n', url: 'https://example.test/seed-$n.jpg');

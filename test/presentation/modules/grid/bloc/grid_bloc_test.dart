import 'package:bloc_test/bloc_test.dart';
import 'package:elinext_grid/core/constants/grid_layout.dart';
import 'package:elinext_grid/presentation/modules/grid/bloc/grid_bloc.dart';
import 'package:elinext_grid/presentation/modules/grid/bloc/grid_event.dart';
import 'package:elinext_grid/presentation/modules/grid/bloc/grid_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_factories.dart';

void main() {
  group('GridBloc', () {
    blocTest<GridBloc, GridState>(
      'LoadInitial emits ${GridLayout.initialBatchSize} images',
      build: buildGridBloc,
      act: (bloc) => bloc.add(const GridEvent.loadInitial()),
      expect: () => [
        predicate<GridState>(
          (s) => s.images.length == GridLayout.initialBatchSize,
        ),
      ],
    );

    blocTest<GridBloc, GridState>(
      'AddImageRequested appends one image and preserves prior ids',
      build: buildGridBloc,
      seed: () => GridState(images: List.generate(3, fixtureImage)),
      act: (bloc) => bloc.add(const GridEvent.addImageRequested()),
      verify: (bloc) {
        expect(bloc.state.images.length, 4);
        expect(bloc.state.images.take(3).map((e) => e.id).toList(), [
          'seed-0',
          'seed-1',
          'seed-2',
        ]);
      },
    );

    blocTest<GridBloc, GridState>(
      'ReloadAllRequested replaces with fresh batch',
      build: buildGridBloc,
      seed: () => GridState(images: [fixtureImage(99)]),
      act: (bloc) => bloc.add(const GridEvent.reloadAllRequested()),
      verify: (bloc) {
        expect(bloc.state.images.length, GridLayout.initialBatchSize);
        expect(bloc.state.images.any((i) => i.id == 'seed-99'), isFalse);
      },
    );

    blocTest<GridBloc, GridState>(
      'Two AddImageRequested events run sequentially → +2',
      build: buildGridBloc,
      act: (bloc) => bloc
        ..add(const GridEvent.addImageRequested())
        ..add(const GridEvent.addImageRequested()),
      verify: (bloc) => expect(bloc.state.images.length, 2),
    );
  });
}

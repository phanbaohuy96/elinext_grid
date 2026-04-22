import 'package:injectable/injectable.dart';

import '../../core/constants/grid_layout.dart';
import '../entities/image_item.dart';
import '../repositories/image_repository.dart';

@injectable
class LoadImageBatch {
  LoadImageBatch(this._repository);

  final ImageRepository _repository;

  List<ImageItem> call({int count = GridLayout.initialBatchSize}) =>
      _repository.nextBatch(count);
}

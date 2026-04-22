import '../entities/image_item.dart';

abstract class ImageRepository {
  ImageItem next();
}

extension ImageRepositoryX on ImageRepository {
  List<ImageItem> nextBatch(int count) =>
      List.generate(count, (_) => next(), growable: false);
}

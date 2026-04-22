import 'package:elinext_grid/domain/entities/image_item.dart';
import 'package:elinext_grid/domain/repositories/image_repository.dart';

class FakeImageRepository implements ImageRepository {
  int _counter = 0;

  @override
  ImageItem next() {
    final id = 'fake-${_counter++}';
    return ImageItem(id: id, url: 'https://example.test/$id.jpg');
  }
}

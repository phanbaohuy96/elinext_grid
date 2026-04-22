import 'package:injectable/injectable.dart';

import '../../domain/entities/image_item.dart';
import '../../domain/repositories/image_repository.dart';
import '../datasources/picsum_image_data_source.dart';

@LazySingleton(as: ImageRepository)
class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl(this._dataSource);

  final PicsumImageDataSource _dataSource;

  @override
  ImageItem next() {
    final record = _dataSource.generate();
    return ImageItem(id: record.id, url: record.url);
  }
}

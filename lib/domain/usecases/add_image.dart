import 'package:injectable/injectable.dart';

import '../entities/image_item.dart';
import '../repositories/image_repository.dart';

@injectable
class AddImage {
  AddImage(this._repository);

  final ImageRepository _repository;

  ImageItem call() => _repository.next();
}

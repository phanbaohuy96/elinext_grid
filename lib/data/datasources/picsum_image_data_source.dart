import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class PicsumImageDataSource {
  PicsumImageDataSource() : _uuid = const Uuid();

  final Uuid _uuid;

  static const String _baseUrl = 'https://picsum.photos/200/200';

  ({String id, String url}) generate() {
    final id = _uuid.v4();
    return (id: id, url: '$_baseUrl?sig=$id');
  }
}

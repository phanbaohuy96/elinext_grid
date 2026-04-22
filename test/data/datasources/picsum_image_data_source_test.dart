import 'package:elinext_grid/data/datasources/picsum_image_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Requirement: image source is https://picsum.photos/200/200', () {
    final ds = PicsumImageDataSource();

    test('generated URL starts with the picsum 200x200 endpoint', () {
      final record = ds.generate();
      expect(record.url.startsWith('https://picsum.photos/200/200'), isTrue);
    });

    test('each generate() yields a unique id and url', () {
      final a = ds.generate();
      final b = ds.generate();
      expect(a.id, isNot(b.id));
      expect(a.url, isNot(b.url));
    });
  });
}

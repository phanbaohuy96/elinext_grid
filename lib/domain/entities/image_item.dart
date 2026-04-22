import 'package:equatable/equatable.dart';

class ImageItem extends Equatable {
  const ImageItem({required this.id, required this.url});

  final String id;
  final String url;

  @override
  List<Object?> get props => [id, url];
}

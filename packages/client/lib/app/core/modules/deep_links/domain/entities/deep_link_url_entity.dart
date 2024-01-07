import 'package:equatable/equatable.dart';

class DeepLinkUrlEntity extends Equatable {
  final String link;

  const DeepLinkUrlEntity({required this.link});

  static DeepLinkUrlEntity get initial => const DeepLinkUrlEntity(link: '');

  @override
  List<Object> get props => [link];
}

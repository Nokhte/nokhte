import 'package:equatable/equatable.dart';

class SoloDocContentEntity extends Equatable {
  final String content;

  const SoloDocContentEntity({
    required this.content,
  });

  @override
  List<Object> get props => [content];
}

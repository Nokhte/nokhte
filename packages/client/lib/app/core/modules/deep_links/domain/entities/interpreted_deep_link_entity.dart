import 'package:equatable/equatable.dart';

class InterpretedDeepLinkEntity extends Equatable {
  final String path;
  final Map additionalMetadata;

  const InterpretedDeepLinkEntity({
    this.path = "",
    this.additionalMetadata = const {},
  });

  @override
  List<Object> get props => [path, additionalMetadata];
}

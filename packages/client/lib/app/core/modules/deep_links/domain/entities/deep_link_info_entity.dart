import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/deep_link_types.dart';

class DeepLinkInfoEntity extends Equatable {
  final DeepLinkTypes type;
  final Map additionalMetadata;

  const DeepLinkInfoEntity({
    required this.type,
    this.additionalMetadata = const {},
  });

  factory DeepLinkInfoEntity.initial() =>
      const DeepLinkInfoEntity(type: DeepLinkTypes.none);

  @override
  List<Object> get props => [type, additionalMetadata];
}

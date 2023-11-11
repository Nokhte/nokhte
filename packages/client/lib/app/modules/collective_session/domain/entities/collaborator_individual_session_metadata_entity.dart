import 'package:equatable/equatable.dart';

class CollaboratorIndividualSessionMetadataEntity extends Equatable {
  final Map sessionMetadata;

  const CollaboratorIndividualSessionMetadataEntity({
    required this.sessionMetadata,
  });

  @override
  List<Object> get props => [sessionMetadata];
}

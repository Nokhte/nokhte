// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'perspective_metadata.dart';

class IndividualSessionMetadata extends Equatable {
  static const metadata = "metadata";
  static const thePerspective = "thePerspective";
  static const numberOfFiles = "numberOfFiles";
  final List<PerspectiveMetadata> perspectivesMetadata;

  const IndividualSessionMetadata({
    required this.perspectivesMetadata,
  });

  @override
  List<Object> get props => [perspectivesMetadata];

  Object toJson() {
    final newMetadataArr = [];

    for (final perspective in perspectivesMetadata) {
      newMetadataArr.add({
        thePerspective: perspective.thePerspective,
        numberOfFiles: perspective.numberOfFiles
      });
    }
    return {metadata: newMetadataArr};
  }
}

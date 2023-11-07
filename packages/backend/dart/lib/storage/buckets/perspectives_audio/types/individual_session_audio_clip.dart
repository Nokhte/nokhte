import 'dart:io';
import 'package:equatable/equatable.dart';

class IndividualSessionAudioClip extends Equatable {
  final bool isOverwritingAnotherFile;
  final String thePerspective;
  final int thePerspectivesIndex;
  final int totalNumberOfFilesForThePerspective;
  final DateTime thePerspectivesTimestamp;
  final DateTime theSessionTimestamp;
  final File theFile;

  const IndividualSessionAudioClip({
    required this.isOverwritingAnotherFile,
    required this.thePerspective,
    required this.totalNumberOfFilesForThePerspective,
    required this.thePerspectivesIndex,
    required this.theSessionTimestamp,
    required this.thePerspectivesTimestamp,
    required this.theFile,
  });

  @override
  List<Object> get props => [
        isOverwritingAnotherFile,
        thePerspective,
        totalNumberOfFilesForThePerspective,
        thePerspectivesTimestamp,
      ];
}

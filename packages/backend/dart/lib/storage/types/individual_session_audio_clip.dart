import 'dart:io';
import 'package:equatable/equatable.dart';

class IndividualSessionAudioClip extends Equatable {
  final bool isOverwritingAnotherFile;
  final String thePerspective;
  final int theRecordingNumber;
  final DateTime thePerspectivesTimestamp;
  final DateTime theSessionTimestamp;
  final File theFile;

  const IndividualSessionAudioClip({
    required this.isOverwritingAnotherFile,
    required this.thePerspective,
    required this.theRecordingNumber,
    required this.theSessionTimestamp,
    required this.thePerspectivesTimestamp,
    required this.theFile,
  });

  @override
  List<Object> get props => [
        isOverwritingAnotherFile,
        thePerspective,
        theRecordingNumber,
        thePerspectivesTimestamp,
      ];
}

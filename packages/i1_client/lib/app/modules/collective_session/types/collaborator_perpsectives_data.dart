// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CollaboratorPerspectivesData extends Equatable {
  String thePerspective;
  int numberOfFiles;
  int numberOfFilesTheyHaveListenedTo;
  List<String> pathsToFiles;
  CollaboratorPerspectivesData({
    required this.thePerspective,
    required this.numberOfFilesTheyHaveListenedTo,
    required this.numberOfFiles,
    required this.pathsToFiles,
  });

  @override
  List<Object> get props => [thePerspective, numberOfFiles, pathsToFiles];
}

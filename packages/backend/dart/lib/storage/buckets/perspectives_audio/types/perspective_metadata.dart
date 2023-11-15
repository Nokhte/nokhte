import 'package:equatable/equatable.dart';

class PerspectiveMetadata extends Equatable {
  final String thePerspective;
  final int numberOfFiles;
  PerspectiveMetadata({
    required this.numberOfFiles,
    required this.thePerspective,
  });

  @override
  List<Object> get props => [thePerspective, numberOfFiles];
}

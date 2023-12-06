import 'package:equatable/equatable.dart';
import 'full_and_relative_path.dart';

class PathsAndSessionMetadata extends Equatable {
  final List<FullAndRelativePath> fullAndRelativePaths;
  final List individualSessionMetadata;
  const PathsAndSessionMetadata({
    required this.fullAndRelativePaths,
    required this.individualSessionMetadata,
  });

  @override
  List<Object> get props => [fullAndRelativePaths, individualSessionMetadata];
}

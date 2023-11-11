import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';

class CollaboratorsAudioClipsPathsAndFilesEntity extends Equatable {
  final List<PathAndBytes> pathAndFiles;

  const CollaboratorsAudioClipsPathsAndFilesEntity({
    required this.pathAndFiles,
  });

  @override
  List<Object> get props => [];
}

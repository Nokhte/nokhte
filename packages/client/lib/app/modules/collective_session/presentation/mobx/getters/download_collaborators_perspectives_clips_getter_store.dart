// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
part 'download_collaborators_perspectives_clips_getter_store.g.dart';

class DownloadCollaboratorsPerspectivesClipsGetterStore = _DownloadCollaboratorsPerspectivesClipsGetterStoreBase
    with _$DownloadCollaboratorsPerspectivesClipsGetterStore;

abstract class _DownloadCollaboratorsPerspectivesClipsGetterStoreBase
    extends Equatable with Store {
  final DownloadCollaboratorsPerspectivesClips logic;

  _DownloadCollaboratorsPerspectivesClipsGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaboratorsAudioClipsDownloadStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/domain/logic/upload_individual_perspectives_audio.dart';
// * Mobx Codegen Inclusion
part 'upload_individual_perspectives_audio_getter_store.g.dart';

class UploadIndividualPerspectivesAudioGetterStore = _UploadIndividualPerspectivesAudioGetterStoreBase
    with _$UploadIndividualPerspectivesAudioGetterStore;

abstract class _UploadIndividualPerspectivesAudioGetterStoreBase
    extends Equatable with Store {
  final UploadIndividualPerspectivesAudio logic;

  _UploadIndividualPerspectivesAudioGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, IndividualPerspectivesAudioUploadStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}

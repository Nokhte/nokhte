import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';

class UploadIndividualPerspectivesAudio
    implements
        AbstractFutureLogic<IndividualPerspectivesAudioUploadStatusEntity,
            NoParams> {
  final IndividualSessionContract contract;

  UploadIndividualPerspectivesAudio({required this.contract});

  @override
  call(params) async =>
      await contract.uploadIndividualPerspectivesAudio(params);
}

class UploadIndividualPerspectivesAudioParams extends Equatable {
  final IndividualSessionAudioClip clipData;
  const UploadIndividualPerspectivesAudioParams({required this.clipData});

  @override
  List<Object> get props => [clipData];
}

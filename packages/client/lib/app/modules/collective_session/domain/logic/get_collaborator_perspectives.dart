import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte_backend/storage/buckets/perspectives_audio/types/collective_session_audio_extrapolation_info.dart';

class GetCollaboratorPerspectives
    implements
        AbstractFutureLogic<CollaboratorPerspectivesEntity,
            CollectiveSessionAudioExtrapolationInfo> {
  final CollectiveSessionContract contract;

  GetCollaboratorPerspectives({required this.contract});

  @override
  call(params) async => await contract.getCollaboratorPerspectives(params);
}

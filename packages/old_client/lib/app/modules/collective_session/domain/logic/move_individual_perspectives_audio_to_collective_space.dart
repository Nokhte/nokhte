import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';

class MoveIndividualPerspectivesAudioToCollectiveSpace
    implements
        AbstractFutureLogic<
            IndividualAudioMovementToCollectiveSpaceStatusEntity, NoParams> {
  final CollectiveSessionContract contract;

  MoveIndividualPerspectivesAudioToCollectiveSpace({
    required this.contract,
  });

  @override
  call(params) async =>
      await contract.moveIndividualPerspectivesAudioToCollectiveSpace(params);
}

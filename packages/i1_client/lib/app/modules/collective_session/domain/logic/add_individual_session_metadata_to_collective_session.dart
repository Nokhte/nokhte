import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';

class AddIndividualSessionMetadataToCollectiveSession
    implements
        AbstractFutureLogic<
            InvidualMetadataAdditionToCollectiveSessionStatusEntity, NoParams> {
  final CollectiveSessionContract contract;

  AddIndividualSessionMetadataToCollectiveSession({required this.contract});

  @override
  call(params) async =>
      await contract.addIndividualSessionMetadataToCollectiveSession(params);
}

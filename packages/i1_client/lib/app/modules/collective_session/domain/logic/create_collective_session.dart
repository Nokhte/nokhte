import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';

class CreateCollectiveSession
    implements
        AbstractFutureLogic<CollectiveSessionCreationStatusEntity, NoParams> {
  final CollectiveSessionContract contract;

  CreateCollectiveSession({required this.contract});

  @override
  call(params) async => await contract.createCollectiveSession(params);
}

import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';

class CreateAPerspectivesSession
    implements
        AbstractFutureLogic<PerspectiveSessionCreationStatusEntity, NoParams> {
  final P2PPerspectivesSessionContract contract;

  CreateAPerspectivesSession({required this.contract});

  @override
  call(params) async => await contract.createAPerspectivesSession(params);
}

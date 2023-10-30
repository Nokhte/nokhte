import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';

class CreateAPerspectivesSEssion
    implements
        AbstractFutureLogic<PerspectiveSessionCreationStatusEntity, NoParams> {
  final P2PPerspectivesSessionContract contract;

  CreateAPerspectivesSEssion({required this.contract});

  @override
  call(params) async => await contract.createAPerspectivesSession(params);
}

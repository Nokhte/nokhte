import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';

class GetPerspectivesStream
    implements AbstractFutureLogic<WorkingPerspectivesStreamEntity, NoParams> {
  final P2PPerspectivesSessionContract contract;

  GetPerspectivesStream({required this.contract});

  @override
  call(params) async => await contract.getPerspectivesStream(params);
}

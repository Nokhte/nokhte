import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';

class UpdateCurrentQuadrant
    implements AbstractFutureLogic<CurrentQuadrantUpdatingStatusEntity, int> {
  final P2PPerspectivesSessionContract contract;

  UpdateCurrentQuadrant({required this.contract});

  @override
  call(params) async => await contract.updateCurrentQuadrant(params);
}

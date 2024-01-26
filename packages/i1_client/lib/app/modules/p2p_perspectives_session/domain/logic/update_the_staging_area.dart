import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';

class UpdateTheStagingArea
    implements
        AbstractFutureLogic<StagingAreaUpdateStatusEntity, List<String>> {
  final P2PPerspectivesSessionContract contract;

  UpdateTheStagingArea({required this.contract});

  @override
  call(params) async => await contract.updateTheStagingArea(params);
}

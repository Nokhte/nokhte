import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';

class FetchPerspectivesStream
    implements AbstractFutureLogic<WorkingPerspectivesStreamEntity, NoParams> {
  final P2PPerspectivesSessionContract contract;

  FetchPerspectivesStream({required this.contract});

  @override
  call(params) async => await contract.fetchPerspectivesStream(params);
}

import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/domain/domain.dart';

class UpdateHasFinishedExplanation
    implements AbstractFutureLogic<bool, NoParams> {
  final ActiveMonetizationSessionContract contract;

  UpdateHasFinishedExplanation({required this.contract});

  @override
  call(params) async => await contract.updateHasFinishedExplanation(params);
}

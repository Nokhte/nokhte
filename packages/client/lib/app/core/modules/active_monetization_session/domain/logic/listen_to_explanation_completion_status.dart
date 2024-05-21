import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/domain/domain.dart';

class ListenToExplanationCompletionStatus
    implements AbstractFutureLogic<Stream<bool>, NoParams> {
  final ActiveMonetizationSessionContract contract;

  ListenToExplanationCompletionStatus({required this.contract});

  @override
  call(params) async =>
      await contract.listenToExplanationCompletionStatus(params);
}

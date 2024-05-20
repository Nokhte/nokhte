import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/domain/domain.dart';

class DisposeExplanationCompletionStatusStream
    implements AbstractSyncNoFailureLogic<bool, NoParams> {
  final ActiveMonetizationSessionContract contract;

  DisposeExplanationCompletionStatusStream({required this.contract});

  @override
  call(params) => contract.disposeStatusStream(params);
}

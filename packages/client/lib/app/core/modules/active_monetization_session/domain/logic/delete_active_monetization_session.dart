import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/domain/domain.dart';

class DeleteActiveMonetizationSession
    implements AbstractFutureLogic<bool, NoParams> {
  final ActiveMonetizationSessionContract contract;

  DeleteActiveMonetizationSession({required this.contract});

  @override
  call(params) async => await contract.deleteSession(params);
}

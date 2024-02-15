import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';

class IdentifyUser implements AbstractFutureLogic<void, NoParams> {
  final PosthogContract contract;

  IdentifyUser({required this.contract});

  @override
  call(params) async => await contract.identifyUser(params);
}

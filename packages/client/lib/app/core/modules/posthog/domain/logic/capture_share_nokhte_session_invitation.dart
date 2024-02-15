import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';

class CaptureShareNokhteSessionInvitation
    implements AbstractFutureLogic<void, NoParams> {
  final PosthogContract contract;

  CaptureShareNokhteSessionInvitation({required this.contract});

  @override
  call(params) async =>
      await contract.captureShareNokhteSessionInvitation(params);
}

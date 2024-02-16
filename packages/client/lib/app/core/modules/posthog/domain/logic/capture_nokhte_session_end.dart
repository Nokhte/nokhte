import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';

class CaptureNokhteSessionEnd implements AbstractFutureLogic<void, NoParams> {
  final PosthogContract contract;

  CaptureNokhteSessionEnd({required this.contract});

  @override
  call(params) async => await contract.captureNokhteSessionEnd(params);
}

import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';

class CaptureNokhteSessionStart implements AbstractFutureLogic<void, int> {
  final PosthogContract contract;

  CaptureNokhteSessionStart({required this.contract});

  @override
  call(params) async => await contract.captureNokhteSessionStart(params);
}

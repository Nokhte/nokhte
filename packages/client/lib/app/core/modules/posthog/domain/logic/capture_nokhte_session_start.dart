import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';

class CaptureNokhteSessionStart implements AbstractFutureLogic<void, NoParams> {
  final PosthogContract contract;

  CaptureNokhteSessionStart({required this.contract});

  @override
  call(params) async => await contract.captureNokhteSessionStart(params);
}

import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';

class CaptureScreen implements AbstractFutureLogic<void, Screens> {
  final PosthogContract contract;

  CaptureScreen({required this.contract});

  @override
  call(params) async => await contract.captureScreen(params);
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'session_joiner.dart';
export 'constants/constants.dart';
export 'presentation/session_joiner.dart';
export 'widgets/widgets.dart';

class SessionJoinerModule extends Module {
  @override
  List<Module> get imports => [
        ConnectivityModule(),
        GestureCrossModule(),
        SessionStartersLogicModule(),
        PosthogModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<SessionJoinerWidgetsCoordinator>(
      () => SessionJoinerWidgetsCoordinator(
        swipeGuide: SwipeGuideStore(),
        qrScanner: QrScannerStore(),
        homeInstructionalNokhte: InstructionalGradientNokhteStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
      ),
    );
    i.add<SessionJoinerCoordinator>(
      () => SessionJoinerCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        logic: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<SessionJoinerWidgetsCoordinator>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      SessionJoinerConstants.relativeSessionJoiner,
      transition: TransitionType.noTransition,
      child: (context) => SessionJoinerScreen(
        coordinator: Modular.get<SessionJoinerCoordinator>(),
      ),
    );
  }
}
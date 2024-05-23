import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_starters.dart';
export 'constants/constants.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';
export 'session_starters_logic.dart';

class SessionStartersModule extends Module {
  @override
  List<Module> get imports => [
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        SessionStartersLogicModule(),
        PosthogModule(),
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<SessionStarterWidgetsCoordinator>(
      () => SessionStarterWidgetsCoordinator(
        qrCode: NokhteQrCodeStore(),
        nokhteBlur: NokhteBlurStore(),
        touchRipple: TouchRippleStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        primaryBeachWaves: BeachWavesStore(),
        secondaryBeachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        instructionalGradientNokhte: InstructionalGradientNokhteStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
      ),
    );
    i.add<SessionStarterCoordinator>(
      () => SessionStarterCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        logic: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        widgets: Modular.get<SessionStarterWidgetsCoordinator>(),
        userInformation: i<UserInformationCoordinator>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => SessionStarterScreen(
        coordinator: Modular.get<SessionStarterCoordinator>(),
      ),
    );
  }
}

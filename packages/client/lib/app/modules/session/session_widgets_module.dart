import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widget_modules/mirrored_text_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'monetize/monetize.dart';
import 'session.dart';

class SessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        MirroredTextModule(),
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SessionLobbyWidgetsCoordinator>(
      () => SessionLobbyWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        primarySmartText: SmartTextStore(),
        qrCode: NokhteQrCodeStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionDuoGreeterWidgetsCoordinator>(
      () => SessionDuoGreeterWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionTrialGreeterWidgetsCoordinator>(
      () => SessionTrialGreeterWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionGroupGreeterWidgetsCoordinator>(
      () => SessionGroupGreeterWidgetsCoordinator(
        sessionPhonePlacementGuide: SessionPhonePlacementGuideStore(),
        tint: TintStore(),
        sessionSeatingGuide: SessionSeatingGuideStore(),
        touchRipple: TouchRippleStore(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionExitWidgetsCoordinator>(
      () => SessionExitWidgetsCoordinator(
        sessionExitStatusIndicator: SessionExitStatusIndicatorStore(),
        tint: TintStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        tertiarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    injectHybrid(i);
    injectSpeaking(i);
    injectNotes(i);
    injectMonetization(i);
  }

  injectSpeaking(i) {
    i.add<SessionSpeakingRootRouterWidgetsCoordinator>(
      () => SessionSpeakingRootRouterWidgetsCoordinator(
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<HalfSessionSpeakingInstructionsWidgetsCoordinator>(
      () => HalfSessionSpeakingInstructionsWidgetsCoordinator(
        halfScreenTint: HalfScreenTintStore(),
        holdTimerIndicator: HoldTimerIndicatorStore(),
        tint: TintStore(),
        errorSmartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        borderGlow: BorderGlowStore(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<FullSessionSpeakingInstructionsWidgetsCoordinator>(
      () => FullSessionSpeakingInstructionsWidgetsCoordinator(
        holdTimerIndicator: HoldTimerIndicatorStore(),
        tint: TintStore(),
        errorSmartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        borderGlow: BorderGlowStore(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionSpeakingWaitingWidgetsCoordinator>(
      () => SessionSpeakingWaitingWidgetsCoordinator(
        tint: TintStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionSpeakingWidgetsCoordinator>(
      () => SessionSpeakingWidgetsCoordinator(
        tint: TintStore(),
        speakLessSmileMore: SpeakLessSmileMoreStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
        borderGlow: BorderGlowStore(),
      ),
    );
  }

  injectHybrid(i) {
    i.add<SessionHybridRootRouterWidgetsCoordinator>(
      () => SessionHybridRootRouterWidgetsCoordinator(
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionHybridWaitingWidgetsCoordinator>(
      () => SessionHybridWaitingWidgetsCoordinator(
        tint: TintStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionHybridSpeakingInstructionsWidgetsCoordinator>(
      () => SessionHybridSpeakingInstructionsWidgetsCoordinator(
        halfScreenTint: HalfScreenTintStore(),
        holdTimerIndicator: HoldTimerIndicatorStore(),
        tint: TintStore(),
        errorSmartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        borderGlow: BorderGlowStore(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionHybridNotesInstructionsWidgetsCoordinator>(
      () => SessionHybridNotesInstructionsWidgetsCoordinator(
        halfScreenTint: HalfScreenTintStore(),
        touchRipple: TouchRippleStore(),
        tint: TintStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionHybridWidgetsCoordinator>(
      () => SessionHybridWidgetsCoordinator(
        smartText: SmartTextStore(),
        othersAreTalkingTint: HalfScreenTintStore(),
        speakLessSmileMore: SpeakLessSmileMoreStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
        borderGlow: BorderGlowStore(),
      ),
    );
    i.add<SessionHybridNotesWidgetsCoordinator>(
      () => SessionHybridNotesWidgetsCoordinator(
        smartText: SmartTextStore(),
        borderGlow: BorderGlowStore(),
        touchRipple: TouchRippleStore(),
        textEditor: TextEditorStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    //
  }

  injectNotes(i) {
    i.add<SessionNotesWaitingWidgetsCoordinator>(
      () => SessionNotesWaitingWidgetsCoordinator(
        tint: TintStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<HalfSessionNotesInstructionsWidgetsCoordinator>(
      () => HalfSessionNotesInstructionsWidgetsCoordinator(
        halfScreenTint: HalfScreenTintStore(),
        touchRipple: TouchRippleStore(),
        tint: TintStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionFullNotesInstructionsWidgetsCoordinator>(
      () => SessionFullNotesInstructionsWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        tint: TintStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionNotesWidgetsCoordinator>(
      () => SessionNotesWidgetsCoordinator(
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        textEditor: TextEditorStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
  }

  injectMonetization(i) {
    i.add<WaitingPatronWidgetsCoordinator>(
      () => WaitingPatronWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        nokhteGradientText: NokhteGradientTextStore(),
        tint: TintStore(),
      ),
    );
    i.add<SessionPaywallWidgetsCoordinator>(
      () => SessionPaywallWidgetsCoordinator(
        multiplyingNokhte: MultiplyingNokhteStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        touchRipple: TouchRippleStore(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        tertiarySmartText: SmartTextStore(),
      ),
    );
  }
}

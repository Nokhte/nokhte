import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widget_modules/mirrored_text_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'monetize/monetize.dart';
import 'session.dart';

class SessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        MirroredTextModule(),
        ConnectivityModule(),
        GestureCrossModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    injectCore(i);
    injectInstructions(i);
    injectHybrid(i);
    injectSpeaking(i);
    injectNotes(i);
    injectMonetization(i);
  }

  injectInstructions(i) {
    i.add<SocraticJustSymbolsWidgetsCoordinator>(
      () => SocraticJustSymbolsWidgetsCoordinator(
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        presetDiagram: PresetDiagramStore(),
      ),
    );
    i.add<SocraticSpeakingSymbolsWidgetsCoordinator>(
      () => SocraticSpeakingSymbolsWidgetsCoordinator(
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        presetDiagram: PresetDiagramStore(),
      ),
    );
    i.add<SocraticNotesSymbolsWidgetsCoordinator>(
      () => SocraticNotesSymbolsWidgetsCoordinator(
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        presetDiagram: PresetDiagramStore(),
      ),
    );
    i.add<CollaborationJustSymbolsWidgetsCoordinator>(
      () => CollaborationJustSymbolsWidgetsCoordinator(
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        presetDiagram: PresetDiagramStore(),
      ),
    );
    i.add<SoloHybridInstructionsWidgetsCoordinator>(
      () => SoloHybridInstructionsWidgetsCoordinator(
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        borderGlow: BorderGlowStore(),
        holdTimerIndicator: HoldTimerIndicatorStore(),
      ),
    );
    i.add<CollaborationFullInstructionsWidgetsCoordinator>(
      () => CollaborationFullInstructionsWidgetsCoordinator(
        presetDiagram: PresetDiagramStore(),
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<ShowGroupGeometryWidgetsCoordinator>(
      () => ShowGroupGeometryWidgetsCoordinator(
        presetDiagram: PresetDiagramStore(),
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<SocraticNotesInstructionsWidgetsCoordinator>(
      () => SocraticNotesInstructionsWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        smartText: SmartTextStore(),
      ),
    );
    i.add<SessionNotesInstructionsWidgetsCoordinator>(
      () => SessionNotesInstructionsWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        smartText: SmartTextStore(),
      ),
    );
    i.add<ConsultationNotesSymbolsWidgetsCoordinator>(
      () => ConsultationNotesSymbolsWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        presetDiagram: PresetDiagramStore(),
        beachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<ConsultationJustSymbolsWidgetsCoordinator>(
      () => ConsultationJustSymbolsWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        presetDiagram: PresetDiagramStore(),
        beachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<ConsultationSpeakingSymbolsWidgetsCoordinator>(
      () => ConsultationSpeakingSymbolsWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        presetDiagram: PresetDiagramStore(),
        beachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );

    i.add<SessionSpeakingInstructionsWidgetsCoordinator>(
      () => SessionSpeakingInstructionsWidgetsCoordinator(
        smartText: SmartTextStore(),
        holdTimerIndicator: HoldTimerIndicatorStore(),
        touchRipple: TouchRippleStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        borderGlow: BorderGlowStore(),
        beachWaves: BeachWavesStore(),
      ),
    );
  }

  injectCore(i) {
    i.add<SessionPreviewWidgetsCoordinator>(
      () => SessionPreviewWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        primarySmartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
        presetCard: ExpandedPresetCardsStore(),
      ),
    );
    i.add<SessionLobbyWidgetsCoordinator>(
      () => SessionLobbyWidgetsCoordinator(
        presetIcons: PresetIconsStore(),
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
    i.add<SessionCollaborationGreeterWidgetsCoordinator>(
      () => SessionCollaborationGreeterWidgetsCoordinator(
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
        sessionSeatingGuide: SessionSeatingGuideStore(),
        touchRipple: TouchRippleStore(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SocraticSpeakingExitWidgetsCoordinator>(
      () => SocraticSpeakingExitWidgetsCoordinator(
        exitStatusIndicator: ExitStatusIndicatorStore(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<SessionExitWidgetsCoordinator>(
      () => SessionExitWidgetsCoordinator(
        exitStatusIndicator: ExitStatusIndicatorStore(),
        tint: TintStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
  }

  injectSpeaking(i) {
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
    i.add<SessionSoloHybridWidgetsCoordinator>(
      () => SessionSoloHybridWidgetsCoordinator(
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        othersAreTalkingTint: HalfScreenTintStore(),
        speakLessSmileMore: SpeakLessSmileMoreStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
        borderGlow: BorderGlowStore(),
      ),
    );
    i.add<SessionGroupHybridWidgetsCoordinator>(
      () => SessionGroupHybridWidgetsCoordinator(
        othersAreTalkingTint: HalfScreenTintStore(),
        speakLessSmileMore: SpeakLessSmileMoreStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
        borderGlow: BorderGlowStore(),
      ),
    );
  }

  injectNotes(i) {
    i.add<SessionNotesWidgetsCoordinator>(
      () => SessionNotesWidgetsCoordinator(
        smartText: SmartTextStore(),
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

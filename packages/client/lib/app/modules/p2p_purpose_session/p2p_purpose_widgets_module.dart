import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widget_modules/beach_waves_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/presentation.dart';

class P2PPurposeWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        ConveyerBeltTextWidgetModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
          export: true,
        ),
        Bind.singleton<MeshCircleButtonStore>(
          (i) => MeshCircleButtonStore(),
          export: true,
        ),
        Bind.factory<GesturePillStore>(
          (i) => GesturePillStore(
            endingPath: SvgAnimtionConstants.circlePath,
          ),
          export: true,
        ),
        Bind.singleton<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(
            isInfinite: false,
          ),
          export: true,
        ),
        Bind.factory<FadeInAndChangeColorTextStore>(
          (i) => FadeInAndChangeColorTextStore(
            messageData: const FadeInMessageData(
              fontSize: 25.0,
              message: "swipe up to start call",
            ),
            chosenMovie: FadeInText.movie,
          ),
          export: true,
        ),
        Bind.singleton<SoloTextEditorTrackerStore>(
          (i) => SoloTextEditorTrackerStore(),
          export: true,
        ),
        Bind.singleton<BeachHorizonWaterTrackerStore>(
          (i) => BeachHorizonWaterTrackerStore(
            isGoingToFullSky: false,
          ),
          export: true,
        ),
        Bind.singleton<BeachSkyStore>(
          (i) => BeachSkyStore(isGoingToFullSky: false),
          export: true,
        ),
        Bind.singleton<SunAndMoonStore>(
          (i) => SunAndMoonStore(),
          export: true,
        ),
        Bind.singleton<SchedulingDeltaStore>(
          (i) => SchedulingDeltaStore(),
          export: true,
        ),
        Bind.singleton<CollaborativeTextEditorTrackerStore>(
          (i) => CollaborativeTextEditorTrackerStore(
            isReadOnly: false,
          ),
          export: true,
        ),
        Bind.singleton<ExplanationTextStore>(
          (i) => ExplanationTextStore(),
          export: true,
        ),
        Bind.singleton<P2PPurposePhase1WidgetsCoordinator>(
          (i) => P2PPurposePhase1WidgetsCoordinator(
            newBeachWaves: Modular.get<NewBeachWavesStore>(),
            fadeInColorText: Modular.get<FadeInAndChangeColorTextStore>(),
            gesturePillStore: Modular.get<GesturePillStore>(),
            fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
          ),
          export: true,
        ),
        Bind.singleton<P2PPurposePhase6WidgetsCoordinator>(
          (i) => P2PPurposePhase6WidgetsCoordinator(
            schedulingDelta: i<SchedulingDeltaStore>(),
            conveyerBelt: i<ConveyerBeltTextStore>(),
            beachSkyStore: i<BeachSkyStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            beachHorizonWater: i<BeachHorizonWaterTrackerStore>(),
            sunAndMoon: i<SunAndMoonStore>(),
          ),
          export: true,
        ),
      ];
}

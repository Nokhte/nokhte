import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class PerspectivesWidgetsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<AudioClipPlatformTrackerStore>(
          (i) => AudioClipPlatformTrackerStore(),
          export: true,
        ),
        Bind.singleton<BeachHorizonWaterTrackerStore>(
          (i) => BeachHorizonWaterTrackerStore(
            isGoingToFullSky: true,
          ),
          export: true,
        ),
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
          export: true,
        ),
        Bind.singleton<SwipeDetector>(
          (i) => SwipeDetector(),
          export: true,
        ),
        Bind.singleton<BeachSkyStore>(
          (i) => BeachSkyStore(
            isGoingToFullSky: true,
          ),
          export: true,
        ),
        Bind.singleton<PerspectivesMapStore>(
          (i) => PerspectivesMapStore(),
          export: true,
        ),
        Bind.factory<CollaborativeTextEditorTrackerStore>(
          (i) => CollaborativeTextEditorTrackerStore(
            isReadOnly: false,
          ),
          export: true,
        ),
      ];
}

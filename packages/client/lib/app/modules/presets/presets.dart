export 'presets_widgets.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'presets.dart';
export 'data/data.dart';
export 'constants/constants.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';

class PresetsModule extends Module {
  @override
  List<Module> get imports => [
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        PosthogModule(),
        PresetsWidgetsModule(),
      ];

  @override
  void binds(i) {
    i.add<PresetsCoordinator>(
      () => PresetsCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<PresetsWidgetsCoordinator>(),
      ),
    );
    i.add<PresetsInstructionsCoordinator>(
      () => PresetsInstructionsCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<PresetsInstructionsWidgetsCoordinator>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      PresetsConstants.relativePresets,
      transition: TransitionType.noTransition,
      child: (context) => PresetsScreen(
        coordinator: Modular.get<PresetsCoordinator>(),
      ),
    );
    r.child(
      PresetsConstants.relativePresetsInstructions,
      transition: TransitionType.noTransition,
      child: (context) => PresetsInstructionsScreen(
        coordinator: Modular.get<PresetsInstructionsCoordinator>(),
      ),
    );
  }
}

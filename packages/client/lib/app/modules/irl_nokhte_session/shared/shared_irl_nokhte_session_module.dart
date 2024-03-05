import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/shared.dart';

class SharedIrlNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        PosthogModule(),
        SharedIrlNokhteSessionWidgetsModule(),
        GesturesModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<IrlNokhteSessionPhase0Coordinator>(
      () => IrlNokhteSessionPhase0Coordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<IrlNokhteSessionPhase0WidgetsCoordinator>(),
        tap: Modular.get<TapDetector>(),
      ),
    );
  }
}

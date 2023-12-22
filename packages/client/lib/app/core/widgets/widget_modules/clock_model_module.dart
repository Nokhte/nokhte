import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ClockModelModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<ClockFaceStore>(
      () => ClockFaceStore(),
    );
    i.add<AccompanyingTextStore>(
      () => AccompanyingTextStore(),
    );
    i.add<GradientCircleStore>(
      () => GradientCircleStore(),
    );
    i.add<AvailabilitySectorsStore>(
      () => AvailabilitySectorsStore(),
    );
    i.add<ClockModelCoordinator>(
      () => ClockModelCoordinator(
        availabilitySectors: i<AvailabilitySectorsStore>(),
        clockFace: i<ClockFaceStore>(),
        primaryAccompanyingText: Modular.get<AccompanyingTextStore>(),
        secondaryAccompanyingText: Modular.get<AccompanyingTextStore>(),
        userGradientCircle: Modular.get<GradientCircleStore>(),
        collaboratorGradientCircle: Modular.get<GradientCircleStore>(),
      ),
    );
  }
}

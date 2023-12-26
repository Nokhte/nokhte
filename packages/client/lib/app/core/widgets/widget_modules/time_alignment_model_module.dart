import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class TimeAlignmentModelModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<ClockFaceStore>(
      () => ClockFaceStore(),
    );
    i.add<AccompanyingTextStore>(
      () => AccompanyingTextStore(),
    );
    i.add<SmartGradientCircleStore>(
      () => SmartGradientCircleStore(),
    );
    i.add<AvailabilitySectorsStore>(
      () => AvailabilitySectorsStore(),
    );
    i.add<TimeAlignmentModelCoordinator>(
      () => TimeAlignmentModelCoordinator(
        availabilitySectors: i<AvailabilitySectorsStore>(),
        clockFace: i<ClockFaceStore>(),
        accompanyingText: Modular.get<AccompanyingTextStore>(),
        userCircle: Modular.get<SmartGradientCircleStore>(),
        collaboratorCircle: Modular.get<SmartGradientCircleStore>(),
      ),
    );
  }
}

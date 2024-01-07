import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class TimeAlignmentModelModule extends Module {
  @override
  void exportedBinds(i) {
    i.add<ClockFaceStore>(
      () => ClockFaceStore(),
    );
    i.add<AvailabilitySectorsStore>(
      () => AvailabilitySectorsStore(),
    );
    i.add<TimeAlignmentModelCoordinator>(
      () => TimeAlignmentModelCoordinator(
        availabilitySectors: i<AvailabilitySectorsStore>(),
        clockFace: i<ClockFaceStore>(),
      ),
    );
  }
}

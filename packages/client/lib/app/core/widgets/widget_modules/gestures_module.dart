import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GesturesModule extends Module {
  @override
  exportedBinds(i) {
    i.add<HoldDetector>(
      () => HoldDetector(),
    );

    i.add<SwipeDetector>(
      () => SwipeDetector(),
    );

    i.add<TapDetector>(
      () => TapDetector(),
    );
  }
}

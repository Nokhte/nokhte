import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GesturesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<HoldDetector>(
          (i) => HoldDetector(),
          export: true,
        ),
        Bind.factory<SwipeDetector>(
          (i) => SwipeDetector(),
          export: true,
        ),
        Bind.factory<TapDetector>(
          (i) => TapDetector(),
          export: true,
        ),
      ];
}

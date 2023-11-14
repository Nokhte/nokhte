import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GesturesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<HoldDetector>(
          (i) => HoldDetector(),
          export: true,
        ),
        Bind.singleton<SwipeDetector>(
          (i) => SwipeDetector(),
          export: true,
        ),
        Bind.singleton<TapDetector>(
          (i) => TapDetector(),
          export: true,
        ),
      ];
}

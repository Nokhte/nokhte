import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GestureCrossModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<GradientCrossNokhteStore>(
      () => GradientCrossNokhteStore(),
    );
    i.add<CrossStore>(
      () => CrossStore(),
    );
    i.add<CenterCrossNokhteStore>(
      () => CenterCrossNokhteStore(),
    );
    i.add<GestureCrossStore>(
      () => GestureCrossStore(
        cross: Modular.get<CrossStore>(),
        gradientNokhte: Modular.get<GradientCrossNokhteStore>(),
        centerCrossNokhte: Modular.get<CenterCrossNokhteStore>(),
      ),
    );
  }
}

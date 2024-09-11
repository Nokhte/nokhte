import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GestureCrossModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<CrossStore>(
      () => CrossStore(),
    );
    i.add<StrokeCrossNokhteStore>(
      () => StrokeCrossNokhteStore(),
    );
    i.add<GestureCrossStore>(
      () => GestureCrossStore(
        strokeCrossNokhte: i<StrokeCrossNokhteStore>(),
        cross: i<CrossStore>(),
      ),
    );
  }
}

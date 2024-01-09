import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class BeachWavesModule extends Module {
  @override
  exportedBinds(i) {
    i.add<BeachWavesStore>(
      () => BeachWavesStore(),
    );
  }
}

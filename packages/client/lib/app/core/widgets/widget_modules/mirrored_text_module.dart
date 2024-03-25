import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class MirroredTextModule extends Module {
  @override
  binds(i) {
    i.add<SmartTextStore>(
      () => SmartTextStore(),
    );
    i.add<MirroredTextStore>(
      () => MirroredTextStore(
        primaryRightSideUpText: Modular.get<SmartTextStore>(),
        secondaryRightSideUpText: Modular.get<SmartTextStore>(),
        primaryUpsideDownText: Modular.get<SmartTextStore>(),
        secondaryUpsideDownText: Modular.get<SmartTextStore>(),
      ),
    );
  }
}

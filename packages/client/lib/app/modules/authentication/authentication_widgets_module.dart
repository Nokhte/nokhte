import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';

class AuthenticationWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
      ];

  @override
  exportedBinds(i) {
    i.addSingleton<NokhteStore>(
      () => NokhteStore(),
    );
    i.addSingleton<SmartTextStore>(
      () => SmartTextStore(),
    );
    i.addSingleton<TrailingTextStore>(
      () => TrailingTextStore(),
    );
    i.addSingleton<LoginScreenWidgetsCoordinator>(
      () => LoginScreenWidgetsCoordinator(
        nokhte: i.get<NokhteStore>(),
        smartTextStore: i.get<SmartTextStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
        trailingText: i.get<TrailingTextStore>(),
      ),
    );
  }
}

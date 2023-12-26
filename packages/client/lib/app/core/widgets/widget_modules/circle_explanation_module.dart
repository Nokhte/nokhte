import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class CircleExplanationModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<DumbGradientCircleStore>(
      () => DumbGradientCircleStore(),
    );
    i.add<AccompanyingTextStore>(
      () => AccompanyingTextStore(),
    );
    i.add<CircleExplanationModelCoordinator>(
      () => CircleExplanationModelCoordinator(
        userCircle: Modular.get<DumbGradientCircleStore>(),
        userAccompanyingText: Modular.get<AccompanyingTextStore>(),
        collaboratorCircle: Modular.get<DumbGradientCircleStore>(),
        collaboratorAccompanyingText: Modular.get<AccompanyingTextStore>(),
      ),
    );
  }
}

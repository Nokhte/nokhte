import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class CircleExplanationModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<GradientCircleStore>(
      () => GradientCircleStore(),
    );
    i.add<AccompanyingTextStore>(
      () => AccompanyingTextStore(),
    );
    i.add<CircleExplanationModelCoordinator>(
      () => CircleExplanationModelCoordinator(
        userCircle: Modular.get<GradientCircleStore>(),
        userAccompanyingText: Modular.get<AccompanyingTextStore>(),
        collaboratorCircle: Modular.get<GradientCircleStore>(),
        collaboratorAccompanyingText: Modular.get<AccompanyingTextStore>(),
      ),
    );
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';

class IndividualSessionModule extends Module {
  @override
  List<Module> get imports => [
        GyroscopicModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '',
          child: (context, args) => const IndividualSessionScreen(),
        )
      ];
}

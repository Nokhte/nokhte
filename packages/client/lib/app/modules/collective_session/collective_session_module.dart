import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/audio_player/audio_player_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';

class CollectiveSessionModule extends Module {
  @override
  List<Module> get imports => [
        GyroscopicModule(),
        AudioPlayerModule(),
      ];
  @override
  List<Bind> get binds => [];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) =>
              const CollectiveSession1StandInTheirShoesScreen(),
        )
      ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';
// import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const HomeScreen(),
        )
      ];
}

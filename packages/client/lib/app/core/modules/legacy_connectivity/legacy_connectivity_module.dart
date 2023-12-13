import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LegacyConnectivityModule extends Module {
  final Connectivity connectivityInstance;

  LegacyConnectivityModule({required this.connectivityInstance});

  @override
  binds(i) {
    i.addSingleton<Connectivity>(() => connectivityInstance);
  }
}

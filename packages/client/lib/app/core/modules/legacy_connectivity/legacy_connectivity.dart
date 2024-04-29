import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class LegacyConnectivityModule extends Module {
  final Connectivity connectivityInstance = Connectivity();

  LegacyConnectivityModule();

  @override
  exportedBinds(i) {
    i.addSingleton<Connectivity>(() => connectivityInstance);
    i.addSingleton(() => NetworkInfoImpl(connectivityInstance));
  }
}

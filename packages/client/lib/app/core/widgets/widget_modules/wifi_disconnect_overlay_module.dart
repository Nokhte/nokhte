import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity_module.dart';
import 'package:nokhte/app/core/modules/connectivity/mobx/get_on_connectivity_changed_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class WifiDisconnectOverlayModule extends Module {
  @override
  List<Module> get imports => [
        ConnectivityModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<WifiDisconnectOverlayStore>(
      () => WifiDisconnectOverlayStore(
        getOnConnectivityChanged: Modular.get<GetOnConnectivityChangedStore>(),
      ),
    );
  }
}

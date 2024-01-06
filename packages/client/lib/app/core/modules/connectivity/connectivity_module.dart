import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nokhte/app/core/modules/connectivity/sources/connectivity_remote_source.dart';
import 'package:nokhte/app/core/modules/connectivity/logic/get_on_connectivity_changed.dart';
import 'package:nokhte/app/core/modules/connectivity/mobx/get_on_connectivity_changed_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConnectivityModule extends Module {
  @override
  exportedBinds(i) {
    i.add<ConnectivityRemoteSourceImpl>(
      () => ConnectivityRemoteSourceImpl(
        connectivity: Connectivity(),
      ),
    );
    i.add<GetOnConnectivityChanged>(
      () => GetOnConnectivityChanged(
        remoteSource: i<ConnectivityRemoteSourceImpl>(),
      ),
    );
    i.add<GetOnConnectivityChangedStore>(
      () => GetOnConnectivityChangedStore(
        logic: i<GetOnConnectivityChanged>(),
      ),
    );
  }
}

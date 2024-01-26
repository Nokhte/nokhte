import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:nokhte/app/app_module.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'common_mocks.mocks.dart';

class ModuleHelpers {
  static dependentModulesSetup(
    bool isOnline,
  ) {
    final mockConnectivity = MockMConnectivity();
    final mockNetworkInfo = MockMNetworkInfoImpl();
    final mockSupabase = MockMSupabaseClient();

    when(mockNetworkInfo.isConnected).thenAnswer((_) async => isOnline);
    initModule(
      ConnectivityModule(connectivityInstance: mockConnectivity),
      replaceBinds: [
        Bind.instance<Connectivity>(mockConnectivity),
      ],
    );
    initModule(
        AppModule(
            supabase: mockSupabase, connectivityInstance: mockConnectivity),
        replaceBinds: [
          Bind.instance<NetworkInfoImpl>(mockNetworkInfo),
        ]);
  }
}

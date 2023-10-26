import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:nokhte/app/app_module.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
// import '../_helpers/common_mocks.mocks.dart';
import './module_mock_gen.mocks.dart';

class ModuleTestHelpers {
  static initDependentModules({required bool isOnline}) {
    final mockSupabase = MockMSupabaseClient();
    final mockNetworkInfo = MockMNetworkInfoImpl();
    final mockConnectivity = MockMConnectivity();
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

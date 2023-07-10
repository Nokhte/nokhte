// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
// * Primala Imports
import 'package:primala/app/app_module.dart';
import 'package:primala/app/core/network/network_info.dart';
// * Mocks
import './modules/_helpers/common_mocks.mocks.dart';

void main() {
  final supabaseMock = MockMSupabaseClient();
  final networkInfoMock = MockMNetworkInfoImpl();
  final connectivityMock = MockMConnectivity();
  // final connectivityMock =

  setUp(() {
    initModule(
        AppModule(
            supabase: supabaseMock, connectivityInstance: connectivityMock),
        replaceBinds: [Bind.instance<NetworkInfoImpl>(networkInfoMock)]);
  });

  // how would you test it
  test('should bind SupabaseClient and NetworkInfoImpl', () {
    final supabase = Modular.get<SupabaseClient>();
    final networkInfo = Modular.get<NetworkInfoImpl>();

    expect(supabase, supabaseMock);
    expect(supabase, isA<SupabaseClient>());
    expect(networkInfo, networkInfoMock);
    expect(networkInfo, isA<NetworkInfoImpl>());
  });
}
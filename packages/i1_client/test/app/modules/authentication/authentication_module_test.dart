import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/app_module.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/authentication/authentication_module.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/main/auth_provider_store.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/main/auth_state_store.dart';
import 'fixtures/supabase_module_auth_fixture.dart';
import '../_module_helpers/module_mock_gen.mocks.dart';

void main() {
  late SupabaseClient supabaseMock;
  late MockMNetworkInfoImpl mockNetwork;
  late MockMConnectivity mockConnectivity;

  void teeItUp(GoTrueVersion enumInput, Function body) async {
    group('INTEGRATION ${enumInput.name} BLOCK', () {
      setUp(() {
        mockConnectivity = MockMConnectivity();
        mockNetwork = MockMNetworkInfoImpl();
        supabaseMock = FakeSupabase(enumInput);

        initModule(ConnectivityModule(connectivityInstance: mockConnectivity),
            replaceBinds: [
              Bind.instance<Connectivity>(mockConnectivity),
            ]);

        initModule(
            AppModule(
                supabase: supabaseMock, connectivityInstance: mockConnectivity),
            replaceBinds: [
              Bind.instance<NetworkInfoImpl>(mockNetwork),
            ]);

        initModule(AuthenticationModule());
      });
      body();
      tearDown(() {
        Modular.destroy();
      });
    });
  }

  teeItUp(GoTrueVersion.authenticatedAuthState, () {
    test(
        'AUTHENTICATED: should set the store accordingly to the authState from the source (True)',
        () {
      final authStateClass = Modular.get<AuthStateStore>();
      final result = authStateClass.authState;
      expect(result, emits(true));
    });
  });

  teeItUp(GoTrueVersion.unAuthenticatedAuthState, () {
    test(
        'UNAUTHENTICATED: should set the store accordingly to the authState from the source',
        () {
      final authStateClass = Modular.get<AuthStateStore>();
      final result = authStateClass.authState;
      expect(result, emits(false));
    });
  });

  teeItUp(GoTrueVersion.failedApple, () {
    test(
        "ONLINE FAILURE: should call the signInWithApple, and send back an AuthenticationError",
        () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      when(mockNetwork.isConnected).thenAnswer((_) async => true);
      final authProviderClass = Modular.get<AuthProviderStore>();
      await authProviderClass.routeAuthProviderRequest(AuthProvider.apple);
      final expected = authProviderClass.errorMessage;
      expect(expected, FailureConstants.authFailureMsg);
    });
  });

  teeItUp(GoTrueVersion.successfulApple, () {
    test(
        "OFFLINE FAILURE: should call signInWithApple, and send back a NetworkError",
        () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      when(mockNetwork.isConnected).thenAnswer((_) async => false);
      final authProviderClass = Modular.get<AuthProviderStore>();
      await authProviderClass.routeAuthProviderRequest(AuthProvider.apple);
      final expected = authProviderClass.errorMessage;
      expect(expected, FailureConstants.internetConnectionFailureMsg);
    });
  });

  teeItUp(GoTrueVersion.failedGoogle, () {
    test(
        "OFFLINE FAILURE: should call signInWithGoogle, and send back an AuthenticationError",
        () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      when(mockNetwork.isConnected).thenAnswer((_) async => false);
      final authProviderClass = Modular.get<AuthProviderStore>();
      await authProviderClass.routeAuthProviderRequest(AuthProvider.google);
      final expected = authProviderClass.errorMessage;
      expect(expected, FailureConstants.internetConnectionFailureMsg);
    });
    test(
        "ONLINE FAILURE: should call signInWithGoogle, and send back an AuthenticationError",
        () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      when(mockNetwork.isConnected).thenAnswer((_) async => true);
      final authProviderClass = Modular.get<AuthProviderStore>();
      await authProviderClass.routeAuthProviderRequest(AuthProvider.google);
      final expected = authProviderClass.errorMessage;
      expect(expected, FailureConstants.authFailureMsg);
    });
  });
}

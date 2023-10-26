// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/main/auth_provider_store.dart';
import 'package:dartz/dartz.dart';
import '../../../fixtures/authentication_stack_mock_gen.mocks.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

void main() {
  late MockMGetAuthProviderStateStore mockGetterStore;
  late AuthProviderStore authProviderStore;

  setUp(() {
    mockGetterStore = MockMGetAuthProviderStateStore();
    authProviderStore = AuthProviderStore(
      authProviderGetterStore: mockGetterStore,
    );
  });

  // initial state
  test("On Instantiation all the values of the store should be properly set",
      () {
    expect(authProviderStore.state, StoreState.initial);
    expect(authProviderStore.errorMessage, "");
  });

  group("mapFailureToMessage", () {
    test("Should Map Authentication Failure Properly", () {
      final result =
          authProviderStore.mapFailureToMessage(FailureConstants.authFailure);
      expect(result, FailureConstants.authFailureMsg);
    });
    test("Should Map Network Connection Failure Properly", () {
      final result = authProviderStore
          .mapFailureToMessage(FailureConstants.internetConnectionFailure);
      expect(result, FailureConstants.internetConnectionFailureMsg);
    });

    test("Should Map Supabase Failure Properly", () {
      final result =
          authProviderStore.mapFailureToMessage(FailureConstants.serverFailure);
      expect(result, FailureConstants.serverFailureMsg);
    });
    test("Should Map a general Failure to the default", () {
      final result = authProviderStore
          .mapFailureToMessage(FailureConstants.genericFailure);
      expect(result, FailureConstants.genericFailureMsg);
    });
  });
  group("ErrorStateUpdater", () {
    test("should update error state w/ any error that gets passed to it",
        () async {
      //act
      authProviderStore.errorMessageUpdater(Left(FailureConstants.authFailure));
      //assert
      expect(authProviderStore.errorMessage, FailureConstants.authFailureMsg);
    });
  });
  group("@action routeAuthProviderRequest", () {
    test("Success Case", () async {
      //arrange
      when(mockGetterStore(AuthProvider.apple)).thenAnswer((_) async =>
          const Right(AuthProviderEntity(
              authProvider: AuthProvider.apple, authProviderStatus: false)));
      //act
      authProviderStore.routeAuthProviderRequest(AuthProvider.apple);

      //assert
      expect(authProviderStore.errorMessage, "");
      // since nothing in the UI is updated on the response, you want
      // to check that the error message, since the authState is the thing
      // that responds with UI changes
    });

    test("Failure Case", () async {
      //arrange
      when(mockGetterStore(AuthProvider.apple))
          .thenAnswer((_) async => Left(FailureConstants.authFailure));
      // act
      await authProviderStore.routeAuthProviderRequest(AuthProvider.apple);
      //assert
      verify(mockGetterStore(AuthProvider.apple));
      expect(authProviderStore.errorMessage, FailureConstants.authFailureMsg);
    });
  });
}

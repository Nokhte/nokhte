import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/getters/get_auth_provider_getter_store.dart';
import '../../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  late MockMSignInWithGoogle mockGoogleSignInLogic;
  late MockMSignInWithApple mockAppleSignInLogic;
  late GetAuthProviderStateGetterStore getAuthProviderStore;
  late Either<Failure, AuthProviderEntity> tEitherAuthProviderEntityOrFailure;

  setUp(() {
    mockGoogleSignInLogic = MockMSignInWithGoogle();
    mockAppleSignInLogic = MockMSignInWithApple();
    getAuthProviderStore = GetAuthProviderStateGetterStore(
      apple: mockAppleSignInLogic,
      google: mockGoogleSignInLogic,
    );
  });

  test("should set StoreState to Initial", () {
    expect(getAuthProviderStore.state, StoreState.initial);
  });

  void successCases(AuthProvider authProvider, Function body) {
    group('$authProvider Success Cases', () {
      setUp(() {
        tEitherAuthProviderEntityOrFailure = Right(
          AuthProviderEntity(
              authProvider: authProvider, authProviderStatus: true),
        );
      });
      body();
    });
  }

  void failureCases(AuthProvider authProvider, Function body) {
    group('$authProvider Success Cases', () {
      setUp(() {
        tEitherAuthProviderEntityOrFailure = Left(AuthenticationFailure(
            message: "$authProvider Failure.",
            failureCode:
                "${authProvider.toString().toUpperCase()}_AUTHENTICATION_FAILURE"));
      });
      body();
    });
  }

  successCases(AuthProvider.apple, () {
    test("Apple Authentication Sucess", () async {
      when(mockAppleSignInLogic(NoParams()))
          .thenAnswer((_) async => tEitherAuthProviderEntityOrFailure);
      final expectedResult = await getAuthProviderStore(AuthProvider.apple);
      expect(expectedResult, tEitherAuthProviderEntityOrFailure);
    });
  });

  failureCases(AuthProvider.apple, () {
    test("Apple Authentication Failure", () async {
      when(mockAppleSignInLogic(NoParams()))
          .thenAnswer((_) async => tEitherAuthProviderEntityOrFailure);
      final expectedResult = await getAuthProviderStore(AuthProvider.apple);
      expect(expectedResult, tEitherAuthProviderEntityOrFailure);
    });
  });

  successCases(AuthProvider.google, () {
    test("Google Authentication Success", () async {
      when(mockGoogleSignInLogic(NoParams()))
          .thenAnswer((_) async => tEitherAuthProviderEntityOrFailure);
      final expectedResult = await getAuthProviderStore(AuthProvider.google);
      expect(expectedResult, tEitherAuthProviderEntityOrFailure);
    });
  });

  failureCases(AuthProvider.google, () {
    test("Google Authentication Failure", () async {
      when(mockGoogleSignInLogic(NoParams()))
          .thenAnswer((_) async => tEitherAuthProviderEntityOrFailure);
      final expectedResult = await getAuthProviderStore(AuthProvider.google);
      expect(expectedResult, tEitherAuthProviderEntityOrFailure);
    });
  });
}

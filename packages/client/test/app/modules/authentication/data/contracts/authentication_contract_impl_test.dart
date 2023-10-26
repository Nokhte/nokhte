// * testing lib
import 'package:flutter_test/flutter_test.dart';
// * mocking lib
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/exceptions.dart';
import 'package:nokhte/app/core/error/failure.dart';
// * nokhte data imports
import 'package:nokhte/app/modules/authentication/data/contracts/authentication_contract_impl.dart';
import 'package:nokhte/app/modules/authentication/data/models/auth_provider_model.dart';
import 'package:nokhte/app/modules/authentication/data/models/auth_state_model.dart';
// * nokhte core imports
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
// * mock import
import '../../fixtures/authentication_stack_mock_gen.mocks.dart';
import '../../../_module_helpers/shared_mocks_gen.mocks.dart'
    show MockMNetworkInfo;
// * functional programming
import 'package:dartz/dartz.dart';

void main() {
  late AuthenticationContractImpl authContract;
  late MockMRemoteSource mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;
  late AuthProviderModel tAuthProviderModel;

  setUp(() {
    mockRemoteSource = MockMRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    authContract = AuthenticationContractImpl(
      remoteSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(AuthProvider authProvider, Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        if (authProvider == AuthProvider.apple) {
          tAuthProviderModel = const AuthProviderModel(
              authProvider: AuthProvider.apple, authProviderStatus: true);
        } else {
          tAuthProviderModel = const AuthProviderModel(
              authProvider: AuthProvider.google, authProviderStatus: true);
        }
      });
      body();
    });
  }

  void runTestsOffline(AuthProvider authProvider, Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group("Method No. 1: googleSignIn", () {
    test("should check if the device is online", () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteSource.signInWithGoogle()).thenAnswer((_) async =>
          const AuthProviderModel(
              authProvider: AuthProvider.google, authProviderStatus: true));
      await authContract.googleSignIn();
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(AuthProvider.google, () {
      test("Should Run The Appropriate Conditional Code for being online",
          () async {
        //arrange
        when(mockRemoteSource.signInWithGoogle())
            .thenAnswer((_) async => tAuthProviderModel);
        //act
        final result = await authContract.googleSignIn();
        //assert
        expect(result, Right<Failure, AuthProviderModel>(tAuthProviderModel));
        verify(mockRemoteSource.signInWithGoogle());
      });

      test("Should fail gracefully when thrown an Authentication Failure",
          () async {
        //arrange
        when(mockRemoteSource.signInWithGoogle())
            .thenThrow(FailureConstants.authFailure);
        //act
        final result = await authContract.googleSignIn();
        //assert
        expect(result, Left(FailureConstants.authFailure));
      });
    });
    runTestsOffline(AuthProvider.google, () {
      test(
        "Should Run The Appropriate Conditional Code for being offline",
        () async {
          //act
          final result = await authContract.googleSignIn();

          //assert

          expect(result, Left(FailureConstants.internetConnectionFailure));
        },
      );
    });
  });

  group("Method No. 2: appleSignIn", () {
    // 1. Check if Device is Online
    test("should check if the device is online", () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteSource.signInWithApple()).thenAnswer((_) async =>
          const AuthProviderModel(
              authProvider: AuthProvider.apple, authProviderStatus: true));
      await authContract.appleSignIn();
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(AuthProvider.apple, () {
      test("Should Run The Appropriate Conditional Code for being online",
          () async {
        //arrange
        when(mockRemoteSource.signInWithApple())
            .thenAnswer((_) async => tAuthProviderModel);
        //act
        final result = await authContract.appleSignIn();
        //assert
        expect(
          result,
          Right<Failure, AuthProviderModel>(tAuthProviderModel),
        );
        verify(mockRemoteSource.signInWithApple());
      });

      test("Should fail gracefully when thrown an Authentication Failure",
          () async {
        //arrange
        when(mockRemoteSource.signInWithApple()).thenThrow(
          AuthenticationException(
            message: 'Authentication Error',
            exceptionCode: 'AUTHENTICATION_ERROR',
          ),
        );
        //act
        final result = await authContract.appleSignIn();
        //assert
        expect(
          result,
          Left(FailureConstants.authFailure),
        );
      });
    });
    runTestsOffline(AuthProvider.apple, () {
      test(
        "Should Run The Appropriate Conditional Code for being offline",
        () async {
          //act
          final result = await authContract.appleSignIn();

          //assert

          expect(result, Left(FailureConstants.internetConnectionFailure));
        },
      );
    });
  });
  group("Method No. 3: getAuthState", () {
    test("Properly Calls & Returns Auth State from the Remote Source",
        () async {
      // arrange
      when(mockRemoteSource.getAuthState()).thenAnswer(
          (_) => AuthStateModel(isAuthenticated: Stream.value(true)));
      // act
      final result = authContract.getAuthState();
      //assert
      expect(result.isAuthenticated, emitsInOrder([true]));
    });
  });
}

// after this move on to the sources & testing those & we should be done with
// this features!!

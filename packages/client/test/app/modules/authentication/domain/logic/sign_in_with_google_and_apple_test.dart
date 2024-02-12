import 'package:nokhte/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:nokhte/app/modules/authentication/domain/logic/sign_in_with_google.dart';
import 'package:nokhte/app/modules/authentication/domain/logic/sign_in_with_apple.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import '../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  late MockMAuthenticationContract mockAuthenticationContract;
  late SignInWithGoogle googleLogic;
  late SignInWithApple appleLogic;
  late AuthProviderEntity tAuthProviderEntity;
  const AuthenticationFailure authFailure = AuthenticationFailure(
      message: 'Authentication Failure', failureCode: 'AUTHENTICATION_FAILURE');

  setUp(
    () {
      mockAuthenticationContract = MockMAuthenticationContract();
    },
  );

  group('AppleSignIn Tests', () {
    setUp(() {
      appleLogic = SignInWithApple(contract: mockAuthenticationContract);
      tAuthProviderEntity = const AuthProviderEntity(
          authProvider: AuthProvider.apple, authProviderStatus: true);
    });
    test(
      "should pass the AuthProvider Model from the contract to the Apple Sign In Logic",
      () async {
        when(mockAuthenticationContract.appleSignIn(NoParams()))
            .thenAnswer((_) async => Right(tAuthProviderEntity));
        final result = await appleLogic(NoParams());

        expect(result, Right(tAuthProviderEntity));
        verify(mockAuthenticationContract.appleSignIn(NoParams()));
        verifyNoMoreInteractions(mockAuthenticationContract);
      },
    );

    test(
        "should pass the Failure Contract result & pass it to the Apple Sign In Logic",
        () async {
      when(mockAuthenticationContract.appleSignIn(NoParams()))
          .thenAnswer((realInvocation) async => const Left(authFailure));
      final result = await appleLogic(NoParams());

      expect(result, const Left(authFailure));
      verify(mockAuthenticationContract.appleSignIn(NoParams()));
      verifyNoMoreInteractions(mockAuthenticationContract);
    });
  });

  group('GoogleSignIn Tests', () {
    setUp(() {
      googleLogic = SignInWithGoogle(contract: mockAuthenticationContract);
      tAuthProviderEntity = const AuthProviderEntity(
          authProvider: AuthProvider.google, authProviderStatus: true);
    });
    test(
      "should pass boolean contract result & pass it to the Google Sign In Logic",
      () async {
        when(mockAuthenticationContract.googleSignIn(NoParams()))
            .thenAnswer((_) async => Right(tAuthProviderEntity));
        final result = await googleLogic(NoParams());

        expect(result, Right(tAuthProviderEntity));
        verify(mockAuthenticationContract.googleSignIn(NoParams()));
        verifyNoMoreInteractions(mockAuthenticationContract);
      },
    );

    test(
        "should pass the Failure Contract result & pass it to the Google Sign In Logic",
        () async {
      when(mockAuthenticationContract.googleSignIn(NoParams()))
          .thenAnswer((realInvocation) async => const Left(authFailure));
      final result = await googleLogic(NoParams());

      expect(result, const Left(authFailure));
      verify(mockAuthenticationContract.googleSignIn(NoParams()));
      verifyNoMoreInteractions(mockAuthenticationContract);
    });
  });
}

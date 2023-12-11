// Mocks generated by Mockito 5.4.2 from annotations
// in nokhte/test/app/modules/authentication/fixtures/authentication_stack_mock_gen.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i15;
import 'dart:ui' as _i13;

import 'package:dartz/dartz.dart' as _i5;
import 'package:mobx/mobx.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nokhte/app/core/error/failure.dart' as _i16;
import 'package:nokhte/app/core/interfaces/auth_providers.dart' as _i20;
import 'package:nokhte/app/core/interfaces/logic.dart' as _i17;
import 'package:nokhte/app/core/mobx/mobx.dart' as _i19;
import 'package:nokhte/app/core/widgets/widgets.dart' as _i12;
import 'package:nokhte/app/modules/authentication/data/models/models.dart'
    as _i4;
import 'package:nokhte/app/modules/authentication/domain/contracts/authentication_contract.dart'
    as _i7;
import 'package:nokhte/app/modules/authentication/domain/entities/entities.dart'
    as _i6;
import 'package:nokhte/app/modules/authentication/domain/logic/get_auth_state.dart'
    as _i8;
import 'package:nokhte/app/modules/authentication/domain/logic/sign_in_with_apple.dart'
    as _i10;
import 'package:nokhte/app/modules/authentication/domain/logic/sign_in_with_google.dart'
    as _i11;
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart'
    as _i18;
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart'
    as _i3;
import 'package:supabase_flutter/supabase_flutter.dart' as _i2;

import 'authentication_stack_mock_gen.dart' as _i14;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSupabaseClient_0 extends _i1.SmartFake
    implements _i2.SupabaseClient {
  _FakeSupabaseClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHomeRemoteSourceImpl_1 extends _i1.SmartFake
    implements _i3.HomeRemoteSourceImpl {
  _FakeHomeRemoteSourceImpl_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthProviderModel_2 extends _i1.SmartFake
    implements _i4.AuthProviderModel {
  _FakeAuthProviderModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthStateModel_3 extends _i1.SmartFake
    implements _i4.AuthStateModel {
  _FakeAuthStateModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_4<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthStateEntity_5 extends _i1.SmartFake
    implements _i6.AuthStateEntity {
  _FakeAuthStateEntity_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthenticationContract_6 extends _i1.SmartFake
    implements _i7.AuthenticationContract {
  _FakeAuthenticationContract_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetAuthState_7 extends _i1.SmartFake implements _i8.GetAuthState {
  _FakeGetAuthState_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_8 extends _i1.SmartFake
    implements _i9.ReactiveContext {
  _FakeReactiveContext_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSignInWithApple_9 extends _i1.SmartFake
    implements _i10.SignInWithApple {
  _FakeSignInWithApple_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSignInWithGoogle_10 extends _i1.SmartFake
    implements _i11.SignInWithGoogle {
  _FakeSignInWithGoogle_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBeachWavesStore_11 extends _i1.SmartFake
    implements _i12.BeachWavesStore {
  _FakeBeachWavesStore_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSmartTextStore_12 extends _i1.SmartFake
    implements _i12.SmartTextStore {
  _FakeSmartTextStore_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNokhteStore_13 extends _i1.SmartFake implements _i12.NokhteStore {
  _FakeNokhteStore_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTrailingTextStore_14 extends _i1.SmartFake
    implements _i12.TrailingTextStore {
  _FakeTrailingTextStore_14(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeOffset_15 extends _i1.SmartFake implements _i13.Offset {
  _FakeOffset_15(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MAuthenticationRemoteSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockMAuthenticationRemoteSourceImpl extends _i1.Mock
    implements _i14.MAuthenticationRemoteSourceImpl {
  MockMAuthenticationRemoteSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SupabaseClient get supabase => (super.noSuchMethod(
        Invocation.getter(#supabase),
        returnValue: _FakeSupabaseClient_0(
          this,
          Invocation.getter(#supabase),
        ),
      ) as _i2.SupabaseClient);

  @override
  _i3.HomeRemoteSourceImpl get homeRemoteSource => (super.noSuchMethod(
        Invocation.getter(#homeRemoteSource),
        returnValue: _FakeHomeRemoteSourceImpl_1(
          this,
          Invocation.getter(#homeRemoteSource),
        ),
      ) as _i3.HomeRemoteSourceImpl);

  @override
  set homeRemoteSource(_i3.HomeRemoteSourceImpl? _homeRemoteSource) =>
      super.noSuchMethod(
        Invocation.setter(
          #homeRemoteSource,
          _homeRemoteSource,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i15.Future<_i4.AuthProviderModel> signInWithGoogle() => (super.noSuchMethod(
        Invocation.method(
          #signInWithGoogle,
          [],
        ),
        returnValue:
            _i15.Future<_i4.AuthProviderModel>.value(_FakeAuthProviderModel_2(
          this,
          Invocation.method(
            #signInWithGoogle,
            [],
          ),
        )),
      ) as _i15.Future<_i4.AuthProviderModel>);

  @override
  _i15.Future<_i4.AuthProviderModel> signInWithApple() => (super.noSuchMethod(
        Invocation.method(
          #signInWithApple,
          [],
        ),
        returnValue:
            _i15.Future<_i4.AuthProviderModel>.value(_FakeAuthProviderModel_2(
          this,
          Invocation.method(
            #signInWithApple,
            [],
          ),
        )),
      ) as _i15.Future<_i4.AuthProviderModel>);

  @override
  _i4.AuthStateModel getAuthState() => (super.noSuchMethod(
        Invocation.method(
          #getAuthState,
          [],
        ),
        returnValue: _FakeAuthStateModel_3(
          this,
          Invocation.method(
            #getAuthState,
            [],
          ),
        ),
      ) as _i4.AuthStateModel);
}

/// A class which mocks [MRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMRemoteSource extends _i1.Mock implements _i14.MRemoteSource {
  MockMRemoteSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i15.Future<_i4.AuthProviderModel> signInWithGoogle() => (super.noSuchMethod(
        Invocation.method(
          #signInWithGoogle,
          [],
        ),
        returnValue:
            _i15.Future<_i4.AuthProviderModel>.value(_FakeAuthProviderModel_2(
          this,
          Invocation.method(
            #signInWithGoogle,
            [],
          ),
        )),
      ) as _i15.Future<_i4.AuthProviderModel>);

  @override
  _i15.Future<_i4.AuthProviderModel> signInWithApple() => (super.noSuchMethod(
        Invocation.method(
          #signInWithApple,
          [],
        ),
        returnValue:
            _i15.Future<_i4.AuthProviderModel>.value(_FakeAuthProviderModel_2(
          this,
          Invocation.method(
            #signInWithApple,
            [],
          ),
        )),
      ) as _i15.Future<_i4.AuthProviderModel>);

  @override
  _i4.AuthStateModel getAuthState() => (super.noSuchMethod(
        Invocation.method(
          #getAuthState,
          [],
        ),
        returnValue: _FakeAuthStateModel_3(
          this,
          Invocation.method(
            #getAuthState,
            [],
          ),
        ),
      ) as _i4.AuthStateModel);
}

/// A class which mocks [MAuthenticationContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockMAuthenticationContract extends _i1.Mock
    implements _i14.MAuthenticationContract {
  MockMAuthenticationContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>
      googleSignIn() => (super.noSuchMethod(
            Invocation.method(
              #googleSignIn,
              [],
            ),
            returnValue: _i15
                .Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>.value(
                _FakeEither_4<_i16.Failure, _i6.AuthProviderEntity>(
              this,
              Invocation.method(
                #googleSignIn,
                [],
              ),
            )),
          ) as _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>);

  @override
  _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>> appleSignIn() =>
      (super.noSuchMethod(
        Invocation.method(
          #appleSignIn,
          [],
        ),
        returnValue:
            _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>.value(
                _FakeEither_4<_i16.Failure, _i6.AuthProviderEntity>(
          this,
          Invocation.method(
            #appleSignIn,
            [],
          ),
        )),
      ) as _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>);

  @override
  _i6.AuthStateEntity getAuthState() => (super.noSuchMethod(
        Invocation.method(
          #getAuthState,
          [],
        ),
        returnValue: _FakeAuthStateEntity_5(
          this,
          Invocation.method(
            #getAuthState,
            [],
          ),
        ),
      ) as _i6.AuthStateEntity);
}

/// A class which mocks [GetAuthState].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAuthState extends _i1.Mock implements _i8.GetAuthState {
  @override
  _i7.AuthenticationContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeAuthenticationContract_6(
          this,
          Invocation.getter(#contract),
        ),
        returnValueForMissingStub: _FakeAuthenticationContract_6(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i7.AuthenticationContract);

  @override
  _i6.AuthStateEntity call(_i17.NoParams? params) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _FakeAuthStateEntity_5(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        ),
        returnValueForMissingStub: _FakeAuthStateEntity_5(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        ),
      ) as _i6.AuthStateEntity);
}

/// A class which mocks [GetAuthStateStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAuthStateStore extends _i1.Mock implements _i18.GetAuthStateStore {
  @override
  _i8.GetAuthState get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeGetAuthState_7(
          this,
          Invocation.getter(#logic),
        ),
        returnValueForMissingStub: _FakeGetAuthState_7(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i8.GetAuthState);

  @override
  _i15.Stream<bool> get authState => (super.noSuchMethod(
        Invocation.getter(#authState),
        returnValue: _i15.Stream<bool>.empty(),
        returnValueForMissingStub: _i15.Stream<bool>.empty(),
      ) as _i15.Stream<bool>);

  @override
  set authState(_i15.Stream<bool>? value) => super.noSuchMethod(
        Invocation.setter(
          #authState,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
        returnValueForMissingStub: <Object>[],
      ) as List<Object>);

  @override
  _i9.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_8(
          this,
          Invocation.getter(#context),
        ),
        returnValueForMissingStub: _FakeReactiveContext_8(
          this,
          Invocation.getter(#context),
        ),
      ) as _i9.ReactiveContext);
}

/// A class which mocks [SignInWithAuthProviderStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInWithAuthProviderStore extends _i1.Mock
    implements _i18.SignInWithAuthProviderStore {
  @override
  _i10.SignInWithApple get signInWithApple => (super.noSuchMethod(
        Invocation.getter(#signInWithApple),
        returnValue: _FakeSignInWithApple_9(
          this,
          Invocation.getter(#signInWithApple),
        ),
        returnValueForMissingStub: _FakeSignInWithApple_9(
          this,
          Invocation.getter(#signInWithApple),
        ),
      ) as _i10.SignInWithApple);

  @override
  _i11.SignInWithGoogle get signInWithGoogle => (super.noSuchMethod(
        Invocation.getter(#signInWithGoogle),
        returnValue: _FakeSignInWithGoogle_10(
          this,
          Invocation.getter(#signInWithGoogle),
        ),
        returnValueForMissingStub: _FakeSignInWithGoogle_10(
          this,
          Invocation.getter(#signInWithGoogle),
        ),
      ) as _i11.SignInWithGoogle);

  @override
  bool get authProviderRequestStatus => (super.noSuchMethod(
        Invocation.getter(#authProviderRequestStatus),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set authProviderRequestStatus(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #authProviderRequestStatus,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
        returnValueForMissingStub: <Object>[],
      ) as List<Object>);

  @override
  _i19.StoreState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i19.StoreState.initial,
        returnValueForMissingStub: _i19.StoreState.initial,
      ) as _i19.StoreState);

  @override
  set state(_i19.StoreState? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get errorMessage => (super.noSuchMethod(
        Invocation.getter(#errorMessage),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  set errorMessage(String? value) => super.noSuchMethod(
        Invocation.setter(
          #errorMessage,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_8(
          this,
          Invocation.getter(#context),
        ),
        returnValueForMissingStub: _FakeReactiveContext_8(
          this,
          Invocation.getter(#context),
        ),
      ) as _i9.ReactiveContext);

  @override
  _i15.Future<
      _i5
      .Either<_i16.Failure, _i6.AuthProviderEntity>> routeAuthProviderRequest(
          _i20.AuthProvider? authProvider) =>
      (super.noSuchMethod(
        Invocation.method(
          #routeAuthProviderRequest,
          [authProvider],
        ),
        returnValue:
            _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>.value(
                _FakeEither_4<_i16.Failure, _i6.AuthProviderEntity>(
          this,
          Invocation.method(
            #routeAuthProviderRequest,
            [authProvider],
          ),
        )),
        returnValueForMissingStub:
            _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>.value(
                _FakeEither_4<_i16.Failure, _i6.AuthProviderEntity>(
          this,
          Invocation.method(
            #routeAuthProviderRequest,
            [authProvider],
          ),
        )),
      ) as _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>);

  @override
  _i15.Future<void> call(_i20.AuthProvider? authProvider) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [authProvider],
        ),
        returnValue: _i15.Future<void>.value(),
        returnValueForMissingStub: _i15.Future<void>.value(),
      ) as _i15.Future<void>);

  @override
  String mapFailureToMessage(_i16.Failure? failure) => (super.noSuchMethod(
        Invocation.method(
          #mapFailureToMessage,
          [failure],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  void stateOrErrorUpdater(
          _i5.Either<_i16.Failure, _i6.AuthProviderEntity>? result) =>
      super.noSuchMethod(
        Invocation.method(
          #stateOrErrorUpdater,
          [result],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SignInWithApple].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInWithApple extends _i1.Mock implements _i10.SignInWithApple {
  @override
  _i7.AuthenticationContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeAuthenticationContract_6(
          this,
          Invocation.getter(#contract),
        ),
        returnValueForMissingStub: _FakeAuthenticationContract_6(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i7.AuthenticationContract);

  @override
  _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>> call(
          _i17.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>.value(
                _FakeEither_4<_i16.Failure, _i6.AuthProviderEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>.value(
                _FakeEither_4<_i16.Failure, _i6.AuthProviderEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>);
}

/// A class which mocks [SignInWithGoogle].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInWithGoogle extends _i1.Mock implements _i11.SignInWithGoogle {
  @override
  _i7.AuthenticationContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeAuthenticationContract_6(
          this,
          Invocation.getter(#contract),
        ),
        returnValueForMissingStub: _FakeAuthenticationContract_6(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i7.AuthenticationContract);

  @override
  _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>> call(
          _i17.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>.value(
                _FakeEither_4<_i16.Failure, _i6.AuthProviderEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>.value(
                _FakeEither_4<_i16.Failure, _i6.AuthProviderEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i15.Future<_i5.Either<_i16.Failure, _i6.AuthProviderEntity>>);
}

/// A class which mocks [LoginScreenWidgetsCoordinator].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginScreenWidgetsCoordinator extends _i1.Mock
    implements _i18.LoginScreenWidgetsCoordinator {
  @override
  _i12.BeachWavesStore get beachWaves => (super.noSuchMethod(
        Invocation.getter(#beachWaves),
        returnValue: _FakeBeachWavesStore_11(
          this,
          Invocation.getter(#beachWaves),
        ),
        returnValueForMissingStub: _FakeBeachWavesStore_11(
          this,
          Invocation.getter(#beachWaves),
        ),
      ) as _i12.BeachWavesStore);

  @override
  _i12.SmartTextStore get smartTextStore => (super.noSuchMethod(
        Invocation.getter(#smartTextStore),
        returnValue: _FakeSmartTextStore_12(
          this,
          Invocation.getter(#smartTextStore),
        ),
        returnValueForMissingStub: _FakeSmartTextStore_12(
          this,
          Invocation.getter(#smartTextStore),
        ),
      ) as _i12.SmartTextStore);

  @override
  _i12.NokhteStore get nokhte => (super.noSuchMethod(
        Invocation.getter(#nokhte),
        returnValue: _FakeNokhteStore_13(
          this,
          Invocation.getter(#nokhte),
        ),
        returnValueForMissingStub: _FakeNokhteStore_13(
          this,
          Invocation.getter(#nokhte),
        ),
      ) as _i12.NokhteStore);

  @override
  _i12.TrailingTextStore get bottomTrailingText => (super.noSuchMethod(
        Invocation.getter(#bottomTrailingText),
        returnValue: _FakeTrailingTextStore_14(
          this,
          Invocation.getter(#bottomTrailingText),
        ),
        returnValueForMissingStub: _FakeTrailingTextStore_14(
          this,
          Invocation.getter(#bottomTrailingText),
        ),
      ) as _i12.TrailingTextStore);

  @override
  _i12.TrailingTextStore get topTrailingText => (super.noSuchMethod(
        Invocation.getter(#topTrailingText),
        returnValue: _FakeTrailingTextStore_14(
          this,
          Invocation.getter(#topTrailingText),
        ),
        returnValueForMissingStub: _FakeTrailingTextStore_14(
          this,
          Invocation.getter(#topTrailingText),
        ),
      ) as _i12.TrailingTextStore);

  @override
  bool get hasNotMadeTheDot => (super.noSuchMethod(
        Invocation.getter(#hasNotMadeTheDot),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set hasNotMadeTheDot(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #hasNotMadeTheDot,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Offset get centerScreenCoordinates => (super.noSuchMethod(
        Invocation.getter(#centerScreenCoordinates),
        returnValue: _FakeOffset_15(
          this,
          Invocation.getter(#centerScreenCoordinates),
        ),
        returnValueForMissingStub: _FakeOffset_15(
          this,
          Invocation.getter(#centerScreenCoordinates),
        ),
      ) as _i13.Offset);

  @override
  set centerScreenCoordinates(_i13.Offset? value) => super.noSuchMethod(
        Invocation.setter(
          #centerScreenCoordinates,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get canSwipeUp => (super.noSuchMethod(
        Invocation.getter(#canSwipeUp),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set canSwipeUp(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #canSwipeUp,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
        returnValueForMissingStub: <Object>[],
      ) as List<Object>);

  @override
  _i9.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_8(
          this,
          Invocation.getter(#context),
        ),
        returnValueForMissingStub: _FakeReactiveContext_8(
          this,
          Invocation.getter(#context),
        ),
      ) as _i9.ReactiveContext);

  @override
  dynamic constructor(
    _i13.Offset? center,
    Function? loginBusinessLogic,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #constructor,
          [
            center,
            loginBusinessLogic,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic setCanSwipeUp(bool? newBool) => super.noSuchMethod(
        Invocation.method(
          #setCanSwipeUp,
          [newBool],
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic setCenterScreenCoordinates(_i13.Offset? newCoordinates) =>
      super.noSuchMethod(
        Invocation.method(
          #setCenterScreenCoordinates,
          [newCoordinates],
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic onTap(_i13.Offset? currentTapPosition) => super.noSuchMethod(
        Invocation.method(
          #onTap,
          [currentTapPosition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic nokhteReactor(Function? loginBusinessLogic) => super.noSuchMethod(
        Invocation.method(
          #nokhteReactor,
          [loginBusinessLogic],
        ),
        returnValueForMissingStub: null,
      );
}

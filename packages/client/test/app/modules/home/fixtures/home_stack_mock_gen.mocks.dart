// Mocks generated by Mockito 5.4.2 from annotations
// in nokhte/test/app/modules/home/fixtures/home_stack_mock_gen.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i13;

import 'package:dartz/dartz.dart' as _i5;
import 'package:mobx/mobx.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nokhte/app/core/error/failure.dart' as _i14;
import 'package:nokhte/app/core/interfaces/logic.dart' as _i15;
import 'package:nokhte/app/core/mobx/base_future_store.dart' as _i11;
import 'package:nokhte/app/core/mobx/store_state.dart' as _i16;
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart'
    as _i6;
import 'package:nokhte/app/modules/home/domain/entities/entities.dart' as _i10;
import 'package:nokhte/app/modules/home/domain/logic/logic.dart' as _i7;
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart' as _i9;
import 'package:nokhte_backend/existing_collaborations.dart' as _i3;
import 'package:nokhte_backend/p2p_perspectives_tracking.dart' as _i4;
import 'package:supabase_flutter/supabase_flutter.dart' as _i2;

import 'home_stack_mock_gen.dart' as _i12;

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

class _FakeExistingCollaborationsQueries_1 extends _i1.SmartFake
    implements _i3.ExistingCollaborationsQueries {
  _FakeExistingCollaborationsQueries_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeP2PPerspectivesTrackingQueries_2 extends _i1.SmartFake
    implements _i4.P2PPerspectivesTrackingQueries {
  _FakeP2PPerspectivesTrackingQueries_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHomeContract_4 extends _i1.SmartFake implements _i6.HomeContract {
  _FakeHomeContract_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetCollaboratorPhrase_5 extends _i1.SmartFake
    implements _i7.GetCollaboratorPhrase {
  _FakeGetCollaboratorPhrase_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_6 extends _i1.SmartFake
    implements _i8.ReactiveContext {
  _FakeReactiveContext_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddNameToDatabase_7 extends _i1.SmartFake
    implements _i7.AddNameToDatabase {
  _FakeAddNameToDatabase_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddNameToDatabaseGetterStore_8 extends _i1.SmartFake
    implements _i9.AddNameToDatabaseGetterStore {
  _FakeAddNameToDatabaseGetterStore_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNameCreationStatusEntity_9 extends _i1.SmartFake
    implements _i10.NameCreationStatusEntity {
  _FakeNameCreationStatusEntity_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseFutureStore_10<T> extends _i1.SmartFake
    implements _i11.BaseFutureStore<T> {
  _FakeBaseFutureStore_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetCollaboratorPhraseGetterStore_11 extends _i1.SmartFake
    implements _i9.GetCollaboratorPhraseGetterStore {
  _FakeGetCollaboratorPhraseGetterStore_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCollaboratorPhraseEntity_12 extends _i1.SmartFake
    implements _i10.CollaboratorPhraseEntity {
  _FakeCollaboratorPhraseEntity_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MHomeRemoteSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockMHomeRemoteSourceImpl extends _i1.Mock
    implements _i12.MHomeRemoteSourceImpl {
  MockMHomeRemoteSourceImpl() {
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
  _i3.ExistingCollaborationsQueries get existingCollaborationsQueries =>
      (super.noSuchMethod(
        Invocation.getter(#existingCollaborationsQueries),
        returnValue: _FakeExistingCollaborationsQueries_1(
          this,
          Invocation.getter(#existingCollaborationsQueries),
        ),
      ) as _i3.ExistingCollaborationsQueries);

  @override
  _i4.P2PPerspectivesTrackingQueries get perspectivesQueries =>
      (super.noSuchMethod(
        Invocation.getter(#perspectivesQueries),
        returnValue: _FakeP2PPerspectivesTrackingQueries_2(
          this,
          Invocation.getter(#perspectivesQueries),
        ),
      ) as _i4.P2PPerspectivesTrackingQueries);

  @override
  _i13.Future<List<dynamic>> addNamesToDatabase({String? theName = r''}) =>
      (super.noSuchMethod(
        Invocation.method(
          #addNamesToDatabase,
          [],
          {#theName: theName},
        ),
        returnValue: _i13.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i13.Future<List<dynamic>>);

  @override
  _i13.Future<List<dynamic>> getCollaboratorPhrase() => (super.noSuchMethod(
        Invocation.method(
          #getCollaboratorPhrase,
          [],
        ),
        returnValue: _i13.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i13.Future<List<dynamic>>);

  @override
  _i13.Future<List<dynamic>> checkIfTheyHaveACollaboration() =>
      (super.noSuchMethod(
        Invocation.method(
          #checkIfTheyHaveACollaboration,
          [],
        ),
        returnValue: _i13.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i13.Future<List<dynamic>>);

  @override
  _i13.Future<List<dynamic>> checkIfTheyHaveDonePerspectives() =>
      (super.noSuchMethod(
        Invocation.method(
          #checkIfTheyHaveDonePerspectives,
          [],
        ),
        returnValue: _i13.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i13.Future<List<dynamic>>);
}

/// A class which mocks [MHomeContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockMHomeContract extends _i1.Mock implements _i12.MHomeContract {
  MockMHomeContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>>
      addNameToDatabase(_i15.NoParams? params) => (super.noSuchMethod(
            Invocation.method(
              #addNameToDatabase,
              [params],
            ),
            returnValue: _i13.Future<
                    _i5
                    .Either<_i14.Failure, _i10.NameCreationStatusEntity>>.value(
                _FakeEither_3<_i14.Failure, _i10.NameCreationStatusEntity>(
              this,
              Invocation.method(
                #addNameToDatabase,
                [params],
              ),
            )),
          ) as _i13
              .Future<_i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>>);

  @override
  _i13.Future<_i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>>
      getCollaboratorPhrase(_i15.NoParams? params) => (super.noSuchMethod(
            Invocation.method(
              #getCollaboratorPhrase,
              [params],
            ),
            returnValue: _i13.Future<
                    _i5
                    .Either<_i14.Failure, _i10.CollaboratorPhraseEntity>>.value(
                _FakeEither_3<_i14.Failure, _i10.CollaboratorPhraseEntity>(
              this,
              Invocation.method(
                #getCollaboratorPhrase,
                [params],
              ),
            )),
          ) as _i13
              .Future<_i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>>);

  @override
  _i13.Future<_i5.Either<_i14.Failure, _i10.ExistingCollaborationsInfoEntity>>
      getExistingCollaborationInfo(_i15.NoParams? params) =>
          (super.noSuchMethod(
            Invocation.method(
              #getExistingCollaborationInfo,
              [params],
            ),
            returnValue: _i13.Future<
                _i5.Either<_i14.Failure,
                    _i10.ExistingCollaborationsInfoEntity>>.value(_FakeEither_3<
                _i14.Failure, _i10.ExistingCollaborationsInfoEntity>(
              this,
              Invocation.method(
                #getExistingCollaborationInfo,
                [params],
              ),
            )),
          ) as _i13.Future<
              _i5.Either<_i14.Failure, _i10.ExistingCollaborationsInfoEntity>>);
}

/// A class which mocks [MRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMRemoteSource extends _i1.Mock implements _i12.MRemoteSource {
  MockMRemoteSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<List<dynamic>> addNamesToDatabase({String? theName = r''}) =>
      (super.noSuchMethod(
        Invocation.method(
          #addNamesToDatabase,
          [],
          {#theName: theName},
        ),
        returnValue: _i13.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i13.Future<List<dynamic>>);

  @override
  _i13.Future<List<dynamic>> getCollaboratorPhrase() => (super.noSuchMethod(
        Invocation.method(
          #getCollaboratorPhrase,
          [],
        ),
        returnValue: _i13.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i13.Future<List<dynamic>>);

  @override
  _i13.Future<List<dynamic>> checkIfTheyHaveACollaboration() =>
      (super.noSuchMethod(
        Invocation.method(
          #checkIfTheyHaveACollaboration,
          [],
        ),
        returnValue: _i13.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i13.Future<List<dynamic>>);

  @override
  _i13.Future<List<dynamic>> checkIfTheyHaveDonePerspectives() =>
      (super.noSuchMethod(
        Invocation.method(
          #checkIfTheyHaveDonePerspectives,
          [],
        ),
        returnValue: _i13.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i13.Future<List<dynamic>>);
}

/// A class which mocks [MGetCollaboratorPhrase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorPhrase extends _i1.Mock
    implements _i12.MGetCollaboratorPhrase {
  MockMGetCollaboratorPhrase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.HomeContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeHomeContract_4(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i6.HomeContract);

  @override
  _i13.Future<_i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>> call(
          _i15.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i13.Future<
                _i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>>.value(
            _FakeEither_3<_i14.Failure, _i10.CollaboratorPhraseEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i13
          .Future<_i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>>);
}

/// A class which mocks [MAddNameToDatabase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMAddNameToDatabase extends _i1.Mock
    implements _i12.MAddNameToDatabase {
  MockMAddNameToDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.HomeContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeHomeContract_4(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i6.HomeContract);

  @override
  _i13.Future<_i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>> call(
          _i15.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i13.Future<
                _i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>>.value(
            _FakeEither_3<_i14.Failure, _i10.NameCreationStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i13
          .Future<_i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>>);
}

/// A class which mocks [MGetCollaboratorPhraseGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorPhraseGetterStore extends _i1.Mock
    implements _i12.MGetCollaboratorPhraseGetterStore {
  MockMGetCollaboratorPhraseGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.GetCollaboratorPhrase get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeGetCollaboratorPhrase_5(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i7.GetCollaboratorPhrase);

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);

  @override
  _i8.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_6(
          this,
          Invocation.getter(#context),
        ),
      ) as _i8.ReactiveContext);

  @override
  _i13.Future<_i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i13.Future<
                _i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>>.value(
            _FakeEither_3<_i14.Failure, _i10.CollaboratorPhraseEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i13
          .Future<_i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>>);
}

/// A class which mocks [MAddNameToDatabaseGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMAddNameToDatabaseGetterStore extends _i1.Mock
    implements _i12.MAddNameToDatabaseGetterStore {
  MockMAddNameToDatabaseGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.AddNameToDatabase get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeAddNameToDatabase_7(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i7.AddNameToDatabase);

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);

  @override
  _i8.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_6(
          this,
          Invocation.getter(#context),
        ),
      ) as _i8.ReactiveContext);

  @override
  _i13.Future<_i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i13.Future<
                _i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>>.value(
            _FakeEither_3<_i14.Failure, _i10.NameCreationStatusEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i13
          .Future<_i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>>);
}

/// A class which mocks [MAddNameToDatabaseStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMAddNameToDatabaseStore extends _i1.Mock
    implements _i12.MAddNameToDatabaseStore {
  MockMAddNameToDatabaseStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.AddNameToDatabaseGetterStore get getterStore => (super.noSuchMethod(
        Invocation.getter(#getterStore),
        returnValue: _FakeAddNameToDatabaseGetterStore_8(
          this,
          Invocation.getter(#getterStore),
        ),
      ) as _i9.AddNameToDatabaseGetterStore);

  @override
  _i10.NameCreationStatusEntity get nameCreationStatus => (super.noSuchMethod(
        Invocation.getter(#nameCreationStatus),
        returnValue: _FakeNameCreationStatusEntity_9(
          this,
          Invocation.getter(#nameCreationStatus),
        ),
      ) as _i10.NameCreationStatusEntity);

  @override
  set nameCreationStatus(_i10.NameCreationStatusEntity? _nameCreationStatus) =>
      super.noSuchMethod(
        Invocation.setter(
          #nameCreationStatus,
          _nameCreationStatus,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.BaseFutureStore<_i10.NameCreationStatusEntity> get futureStore =>
      (super.noSuchMethod(
        Invocation.getter(#futureStore),
        returnValue: _FakeBaseFutureStore_10<_i10.NameCreationStatusEntity>(
          this,
          Invocation.getter(#futureStore),
        ),
      ) as _i11.BaseFutureStore<_i10.NameCreationStatusEntity>);

  @override
  set futureStore(_i11.BaseFutureStore<_i10.NameCreationStatusEntity>? value) =>
      super.noSuchMethod(
        Invocation.setter(
          #futureStore,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);

  @override
  _i16.StoreState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i16.StoreState.initial,
      ) as _i16.StoreState);

  @override
  set state(_i16.StoreState? value) => super.noSuchMethod(
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
  _i8.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_6(
          this,
          Invocation.getter(#context),
        ),
      ) as _i8.ReactiveContext);

  @override
  void stateOrErrorUpdater(
          _i5.Either<_i14.Failure, _i10.NameCreationStatusEntity>? result) =>
      super.noSuchMethod(
        Invocation.method(
          #stateOrErrorUpdater,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<void> call(_i15.NoParams? params) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  String mapFailureToMessage(_i14.Failure? failure) => (super.noSuchMethod(
        Invocation.method(
          #mapFailureToMessage,
          [failure],
        ),
        returnValue: '',
      ) as String);
}

/// A class which mocks [MGetCollaboratorPhraseStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorPhraseStore extends _i1.Mock
    implements _i12.MGetCollaboratorPhraseStore {
  MockMGetCollaboratorPhraseStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.GetCollaboratorPhraseGetterStore get getterStore => (super.noSuchMethod(
        Invocation.getter(#getterStore),
        returnValue: _FakeGetCollaboratorPhraseGetterStore_11(
          this,
          Invocation.getter(#getterStore),
        ),
      ) as _i9.GetCollaboratorPhraseGetterStore);

  @override
  _i10.CollaboratorPhraseEntity get collaboratorPhraseEntity =>
      (super.noSuchMethod(
        Invocation.getter(#collaboratorPhraseEntity),
        returnValue: _FakeCollaboratorPhraseEntity_12(
          this,
          Invocation.getter(#collaboratorPhraseEntity),
        ),
      ) as _i10.CollaboratorPhraseEntity);

  @override
  set collaboratorPhraseEntity(
          _i10.CollaboratorPhraseEntity? _collaboratorPhraseEntity) =>
      super.noSuchMethod(
        Invocation.setter(
          #collaboratorPhraseEntity,
          _collaboratorPhraseEntity,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.BaseFutureStore<_i10.CollaboratorPhraseEntity> get futureStore =>
      (super.noSuchMethod(
        Invocation.getter(#futureStore),
        returnValue: _FakeBaseFutureStore_10<_i10.CollaboratorPhraseEntity>(
          this,
          Invocation.getter(#futureStore),
        ),
      ) as _i11.BaseFutureStore<_i10.CollaboratorPhraseEntity>);

  @override
  set futureStore(
          _i11.BaseFutureStore<_i10.CollaboratorPhraseEntity>? _futureStore) =>
      super.noSuchMethod(
        Invocation.setter(
          #futureStore,
          _futureStore,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get collaboratorPhrase => (super.noSuchMethod(
        Invocation.getter(#collaboratorPhrase),
        returnValue: '',
      ) as String);

  @override
  set collaboratorPhrase(String? value) => super.noSuchMethod(
        Invocation.setter(
          #collaboratorPhrase,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i16.StoreState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i16.StoreState.initial,
      ) as _i16.StoreState);

  @override
  set state(_i16.StoreState? value) => super.noSuchMethod(
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
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);

  @override
  _i8.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_6(
          this,
          Invocation.getter(#context),
        ),
      ) as _i8.ReactiveContext);

  @override
  void stateOrErrorUpdater(
          _i5.Either<_i14.Failure, _i10.CollaboratorPhraseEntity>? result) =>
      super.noSuchMethod(
        Invocation.method(
          #stateOrErrorUpdater,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<void> call(_i15.NoParams? params) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  String mapFailureToMessage(_i14.Failure? failure) => (super.noSuchMethod(
        Invocation.method(
          #mapFailureToMessage,
          [failure],
        ),
        returnValue: '',
      ) as String);
}

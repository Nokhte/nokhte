// Mocks generated by Mockito 5.4.0 from annotations
// in primala/test/app/modules/home/fixtures/home_stack_mock_gen.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mobx/mobx.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:primala/app/core/error/failure.dart' as _i12;
import 'package:primala/app/core/interfaces/logic.dart' as _i13;
import 'package:primala/app/core/mobx/base_future_store.dart' as _i9;
import 'package:primala/app/core/mobx/store_state.dart' as _i14;
import 'package:primala/app/modules/home/domain/contracts/home_contract.dart'
    as _i4;
import 'package:primala/app/modules/home/domain/entities/entities.dart' as _i8;
import 'package:primala/app/modules/home/domain/logic/logic.dart' as _i5;
import 'package:primala/app/modules/home/presentation/mobx/mobx.dart' as _i7;
import 'package:supabase_flutter/supabase_flutter.dart' as _i2;

import 'home_stack_mock_gen.dart' as _i10;

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

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHomeContract_2 extends _i1.SmartFake implements _i4.HomeContract {
  _FakeHomeContract_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetCollaboratorPhrase_3 extends _i1.SmartFake
    implements _i5.GetCollaboratorPhrase {
  _FakeGetCollaboratorPhrase_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_4 extends _i1.SmartFake
    implements _i6.ReactiveContext {
  _FakeReactiveContext_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddNameToDatabase_5 extends _i1.SmartFake
    implements _i5.AddNameToDatabase {
  _FakeAddNameToDatabase_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddNameToDatabaseGetterStore_6 extends _i1.SmartFake
    implements _i7.AddNameToDatabaseGetterStore {
  _FakeAddNameToDatabaseGetterStore_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNameCreationStatusEntity_7 extends _i1.SmartFake
    implements _i8.NameCreationStatusEntity {
  _FakeNameCreationStatusEntity_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseFutureStore_8<T> extends _i1.SmartFake
    implements _i9.BaseFutureStore<T> {
  _FakeBaseFutureStore_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetCollaboratorPhraseGetterStore_9 extends _i1.SmartFake
    implements _i7.GetCollaboratorPhraseGetterStore {
  _FakeGetCollaboratorPhraseGetterStore_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCollaboratorPhraseEntity_10 extends _i1.SmartFake
    implements _i8.CollaboratorPhraseEntity {
  _FakeCollaboratorPhraseEntity_10(
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
    implements _i10.MHomeRemoteSourceImpl {
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
  _i11.Future<List<dynamic>> addNamesToDatabase() => (super.noSuchMethod(
        Invocation.method(
          #addNamesToDatabase,
          [],
        ),
        returnValue: _i11.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i11.Future<List<dynamic>>);
  @override
  _i11.Future<List<dynamic>> getCollaboratorPhrase() => (super.noSuchMethod(
        Invocation.method(
          #getCollaboratorPhrase,
          [],
        ),
        returnValue: _i11.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i11.Future<List<dynamic>>);
}

/// A class which mocks [MHomeContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockMHomeContract extends _i1.Mock implements _i10.MHomeContract {
  MockMHomeContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>>
      addNameToDatabase() => (super.noSuchMethod(
            Invocation.method(
              #addNameToDatabase,
              [],
            ),
            returnValue: _i11.Future<
                    _i3.Either<_i12.Failure,
                        _i8.NameCreationStatusEntity>>.value(
                _FakeEither_1<_i12.Failure, _i8.NameCreationStatusEntity>(
              this,
              Invocation.method(
                #addNameToDatabase,
                [],
              ),
            )),
          ) as _i11
              .Future<_i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>>);
  @override
  _i11.Future<_i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>>
      getCollaboratorPhrase() => (super.noSuchMethod(
            Invocation.method(
              #getCollaboratorPhrase,
              [],
            ),
            returnValue: _i11.Future<
                    _i3.Either<_i12.Failure,
                        _i8.CollaboratorPhraseEntity>>.value(
                _FakeEither_1<_i12.Failure, _i8.CollaboratorPhraseEntity>(
              this,
              Invocation.method(
                #getCollaboratorPhrase,
                [],
              ),
            )),
          ) as _i11
              .Future<_i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>>);
}

/// A class which mocks [MRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMRemoteSource extends _i1.Mock implements _i10.MRemoteSource {
  MockMRemoteSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<List<dynamic>> addNamesToDatabase() => (super.noSuchMethod(
        Invocation.method(
          #addNamesToDatabase,
          [],
        ),
        returnValue: _i11.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i11.Future<List<dynamic>>);
  @override
  _i11.Future<List<dynamic>> getCollaboratorPhrase() => (super.noSuchMethod(
        Invocation.method(
          #getCollaboratorPhrase,
          [],
        ),
        returnValue: _i11.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i11.Future<List<dynamic>>);
}

/// A class which mocks [MGetCollaboratorPhrase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorPhrase extends _i1.Mock
    implements _i10.MGetCollaboratorPhrase {
  MockMGetCollaboratorPhrase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.HomeContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeHomeContract_2(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i4.HomeContract);
  @override
  _i11.Future<_i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>> call(
          _i13.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i11.Future<
                _i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>>.value(
            _FakeEither_1<_i12.Failure, _i8.CollaboratorPhraseEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i11.Future<_i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>>);
}

/// A class which mocks [MAddNameToDatabase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMAddNameToDatabase extends _i1.Mock
    implements _i10.MAddNameToDatabase {
  MockMAddNameToDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.HomeContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeHomeContract_2(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i4.HomeContract);
  @override
  _i11.Future<_i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>> call(
          _i13.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i11.Future<
                _i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>>.value(
            _FakeEither_1<_i12.Failure, _i8.NameCreationStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i11.Future<_i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>>);
}

/// A class which mocks [MGetCollaboratorPhraseGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorPhraseGetterStore extends _i1.Mock
    implements _i10.MGetCollaboratorPhraseGetterStore {
  MockMGetCollaboratorPhraseGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.GetCollaboratorPhrase get getCollaboratorPhraseLogic =>
      (super.noSuchMethod(
        Invocation.getter(#getCollaboratorPhraseLogic),
        returnValue: _FakeGetCollaboratorPhrase_3(
          this,
          Invocation.getter(#getCollaboratorPhraseLogic),
        ),
      ) as _i5.GetCollaboratorPhrase);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
  @override
  _i6.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_4(
          this,
          Invocation.getter(#context),
        ),
      ) as _i6.ReactiveContext);
  @override
  _i11.Future<_i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i11.Future<
                _i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>>.value(
            _FakeEither_1<_i12.Failure, _i8.CollaboratorPhraseEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i11.Future<_i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>>);
}

/// A class which mocks [MAddNameToDatabaseGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMAddNameToDatabaseGetterStore extends _i1.Mock
    implements _i10.MAddNameToDatabaseGetterStore {
  MockMAddNameToDatabaseGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.AddNameToDatabase get addNameLogic => (super.noSuchMethod(
        Invocation.getter(#addNameLogic),
        returnValue: _FakeAddNameToDatabase_5(
          this,
          Invocation.getter(#addNameLogic),
        ),
      ) as _i5.AddNameToDatabase);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
  @override
  _i6.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_4(
          this,
          Invocation.getter(#context),
        ),
      ) as _i6.ReactiveContext);
  @override
  _i11.Future<_i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i11.Future<
                _i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>>.value(
            _FakeEither_1<_i12.Failure, _i8.NameCreationStatusEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i11.Future<_i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>>);
}

/// A class which mocks [MAddNameToDatabaseStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMAddNameToDatabaseStore extends _i1.Mock
    implements _i10.MAddNameToDatabaseStore {
  MockMAddNameToDatabaseStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.AddNameToDatabaseGetterStore get addNameGetterStore =>
      (super.noSuchMethod(
        Invocation.getter(#addNameGetterStore),
        returnValue: _FakeAddNameToDatabaseGetterStore_6(
          this,
          Invocation.getter(#addNameGetterStore),
        ),
      ) as _i7.AddNameToDatabaseGetterStore);
  @override
  _i8.NameCreationStatusEntity get nameCreationStatus => (super.noSuchMethod(
        Invocation.getter(#nameCreationStatus),
        returnValue: _FakeNameCreationStatusEntity_7(
          this,
          Invocation.getter(#nameCreationStatus),
        ),
      ) as _i8.NameCreationStatusEntity);
  @override
  set nameCreationStatus(_i8.NameCreationStatusEntity? _nameCreationStatus) =>
      super.noSuchMethod(
        Invocation.setter(
          #nameCreationStatus,
          _nameCreationStatus,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.BaseFutureStore<_i8.NameCreationStatusEntity> get futureStore =>
      (super.noSuchMethod(
        Invocation.getter(#futureStore),
        returnValue: _FakeBaseFutureStore_8<_i8.NameCreationStatusEntity>(
          this,
          Invocation.getter(#futureStore),
        ),
      ) as _i9.BaseFutureStore<_i8.NameCreationStatusEntity>);
  @override
  set futureStore(_i9.BaseFutureStore<_i8.NameCreationStatusEntity>? value) =>
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
  _i14.StoreState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i14.StoreState.initial,
      ) as _i14.StoreState);
  @override
  set state(_i14.StoreState? value) => super.noSuchMethod(
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
  _i6.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_4(
          this,
          Invocation.getter(#context),
        ),
      ) as _i6.ReactiveContext);
  @override
  void stateOrErrorUpdater(
          _i3.Either<_i12.Failure, _i8.NameCreationStatusEntity>? result) =>
      super.noSuchMethod(
        Invocation.method(
          #stateOrErrorUpdater,
          [result],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i11.Future<void> call(_i13.NoParams? params) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  String mapFailureToMessage(_i12.Failure? failure) => (super.noSuchMethod(
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
    implements _i10.MGetCollaboratorPhraseStore {
  MockMGetCollaboratorPhraseStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.GetCollaboratorPhraseGetterStore get getCollaboratorPhraseGetterStore =>
      (super.noSuchMethod(
        Invocation.getter(#getCollaboratorPhraseGetterStore),
        returnValue: _FakeGetCollaboratorPhraseGetterStore_9(
          this,
          Invocation.getter(#getCollaboratorPhraseGetterStore),
        ),
      ) as _i7.GetCollaboratorPhraseGetterStore);
  @override
  _i8.CollaboratorPhraseEntity get collaboratorPhraseEntity =>
      (super.noSuchMethod(
        Invocation.getter(#collaboratorPhraseEntity),
        returnValue: _FakeCollaboratorPhraseEntity_10(
          this,
          Invocation.getter(#collaboratorPhraseEntity),
        ),
      ) as _i8.CollaboratorPhraseEntity);
  @override
  set collaboratorPhraseEntity(
          _i8.CollaboratorPhraseEntity? _collaboratorPhraseEntity) =>
      super.noSuchMethod(
        Invocation.setter(
          #collaboratorPhraseEntity,
          _collaboratorPhraseEntity,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.BaseFutureStore<_i8.CollaboratorPhraseEntity> get futureStore =>
      (super.noSuchMethod(
        Invocation.getter(#futureStore),
        returnValue: _FakeBaseFutureStore_8<_i8.CollaboratorPhraseEntity>(
          this,
          Invocation.getter(#futureStore),
        ),
      ) as _i9.BaseFutureStore<_i8.CollaboratorPhraseEntity>);
  @override
  set futureStore(
          _i9.BaseFutureStore<_i8.CollaboratorPhraseEntity>? _futureStore) =>
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
  _i14.StoreState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i14.StoreState.initial,
      ) as _i14.StoreState);
  @override
  set state(_i14.StoreState? value) => super.noSuchMethod(
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
  _i6.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_4(
          this,
          Invocation.getter(#context),
        ),
      ) as _i6.ReactiveContext);
  @override
  void stateOrErrorUpdater(
          _i3.Either<_i12.Failure, _i8.CollaboratorPhraseEntity>? result) =>
      super.noSuchMethod(
        Invocation.method(
          #stateOrErrorUpdater,
          [result],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i11.Future<void> call(_i13.NoParams? params) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  String mapFailureToMessage(_i12.Failure? failure) => (super.noSuchMethod(
        Invocation.method(
          #mapFailureToMessage,
          [failure],
        ),
        returnValue: '',
      ) as String);
}

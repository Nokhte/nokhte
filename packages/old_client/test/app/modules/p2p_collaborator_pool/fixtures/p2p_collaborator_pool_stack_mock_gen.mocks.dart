// Mocks generated by Mockito 5.4.2 from annotations
// in nokhte/test/app/modules/p2p_collaborator_pool/fixtures/p2p_collaborator_pool_stack_mock_gen.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:dartz/dartz.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nokhte/app/core/error/failure.dart' as _i10;
import 'package:nokhte/app/core/interfaces/logic.dart' as _i11;
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/data.dart'
    as _i12;
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart'
    as _i6;
import 'package:nokhte_backend/edge_functions/edge_functions.dart' as _i4;
import 'package:nokhte_backend/tables/existing_collaborations.dart' as _i3;
import 'package:nokhte_backend/tables/phrase_components.dart' as _i9;
import 'package:supabase_flutter/supabase_flutter.dart' as _i2;

import 'p2p_collaborator_pool_stack_mock_gen.dart' as _i7;

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

class _FakeExistingCollaborationsStream_1 extends _i1.SmartFake
    implements _i3.ExistingCollaborationsStream {
  _FakeExistingCollaborationsStream_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInitiateCollaboratorSearch_2 extends _i1.SmartFake
    implements _i4.InitiateCollaboratorSearch {
  _FakeInitiateCollaboratorSearch_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEndCollaboratorSearch_3 extends _i1.SmartFake
    implements _i4.EndCollaboratorSearch {
  _FakeEndCollaboratorSearch_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFunctionResponse_4 extends _i1.SmartFake
    implements _i2.FunctionResponse {
  _FakeFunctionResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_5<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeP2PCollaboratorPoolContract_6 extends _i1.SmartFake
    implements _i6.P2PCollaboratorPoolContract {
  _FakeP2PCollaboratorPoolContract_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MP2PCollaboratorPoolRemoteSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockMP2PCollaboratorPoolRemoteSourceImpl extends _i1.Mock
    implements _i7.MP2PCollaboratorPoolRemoteSourceImpl {
  MockMP2PCollaboratorPoolRemoteSourceImpl() {
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
  String get currentUserUID => (super.noSuchMethod(
        Invocation.getter(#currentUserUID),
        returnValue: '',
      ) as String);

  @override
  _i3.ExistingCollaborationsStream get existingCollaborationsStream =>
      (super.noSuchMethod(
        Invocation.getter(#existingCollaborationsStream),
        returnValue: _FakeExistingCollaborationsStream_1(
          this,
          Invocation.getter(#existingCollaborationsStream),
        ),
      ) as _i3.ExistingCollaborationsStream);

  @override
  _i4.InitiateCollaboratorSearch get initiateCollaboratorSearch =>
      (super.noSuchMethod(
        Invocation.getter(#initiateCollaboratorSearch),
        returnValue: _FakeInitiateCollaboratorSearch_2(
          this,
          Invocation.getter(#initiateCollaboratorSearch),
        ),
      ) as _i4.InitiateCollaboratorSearch);

  @override
  _i4.EndCollaboratorSearch get endCollaboratorSearch => (super.noSuchMethod(
        Invocation.getter(#endCollaboratorSearch),
        returnValue: _FakeEndCollaboratorSearch_3(
          this,
          Invocation.getter(#endCollaboratorSearch),
        ),
      ) as _i4.EndCollaboratorSearch);

  @override
  _i8.Future<List<dynamic>> validateQuery({required String? query}) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateQuery,
          [],
          {#query: query},
        ),
        returnValue: _i8.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i8.Future<List<dynamic>>);

  @override
  _i8.Future<_i2.FunctionResponse> enterThePool(
          _i9.CollaboratorPhraseIDs? phraseIDs) =>
      (super.noSuchMethod(
        Invocation.method(
          #enterThePool,
          [phraseIDs],
        ),
        returnValue:
            _i8.Future<_i2.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #enterThePool,
            [phraseIDs],
          ),
        )),
      ) as _i8.Future<_i2.FunctionResponse>);

  @override
  _i8.Future<_i2.FunctionResponse> exitThePool() => (super.noSuchMethod(
        Invocation.method(
          #exitThePool,
          [],
        ),
        returnValue:
            _i8.Future<_i2.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #exitThePool,
            [],
          ),
        )),
      ) as _i8.Future<_i2.FunctionResponse>);

  @override
  _i8.Stream<_i3.CollaboratorSearchAndEntryStatus>
      getCollaboratorSearchStatus() => (super.noSuchMethod(
            Invocation.method(
              #getCollaboratorSearchStatus,
              [],
            ),
            returnValue:
                _i8.Stream<_i3.CollaboratorSearchAndEntryStatus>.empty(),
          ) as _i8.Stream<_i3.CollaboratorSearchAndEntryStatus>);

  @override
  bool cancelStream() => (super.noSuchMethod(
        Invocation.method(
          #cancelStream,
          [],
        ),
        returnValue: false,
      ) as bool);
}

/// A class which mocks [MP2PCollaboratorPoolContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockMP2PCollaboratorPoolContract extends _i1.Mock
    implements _i7.MP2PCollaboratorPoolContract {
  MockMP2PCollaboratorPoolContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.Either<_i10.Failure, _i6.CollaboratorPhraseValidationEntity>>
      validateQuery(String? query) => (super.noSuchMethod(
            Invocation.method(
              #validateQuery,
              [query],
            ),
            returnValue: _i8.Future<
                    _i5.Either<_i10.Failure,
                        _i6.CollaboratorPhraseValidationEntity>>.value(
                _FakeEither_5<_i10.Failure,
                    _i6.CollaboratorPhraseValidationEntity>(
              this,
              Invocation.method(
                #validateQuery,
                [query],
              ),
            )),
          ) as _i8.Future<
              _i5
              .Either<_i10.Failure, _i6.CollaboratorPhraseValidationEntity>>);

  @override
  _i8.Future<_i5.Either<_i10.Failure, _i6.CollaboratorPoolEntryStatusEntity>>
      enterTheCollaboratorPool(_i9.CollaboratorPhraseIDs? phraseIDs) =>
          (super.noSuchMethod(
            Invocation.method(
              #enterTheCollaboratorPool,
              [phraseIDs],
            ),
            returnValue: _i8.Future<
                _i5.Either<_i10.Failure,
                    _i6.CollaboratorPoolEntryStatusEntity>>.value(_FakeEither_5<
                _i10.Failure, _i6.CollaboratorPoolEntryStatusEntity>(
              this,
              Invocation.method(
                #enterTheCollaboratorPool,
                [phraseIDs],
              ),
            )),
          ) as _i8.Future<
              _i5.Either<_i10.Failure, _i6.CollaboratorPoolEntryStatusEntity>>);

  @override
  _i8.Future<_i5.Either<_i10.Failure, _i6.CollaboratorPoolExitStatusEntity>>
      exitCollaboratorPool() => (super.noSuchMethod(
            Invocation.method(
              #exitCollaboratorPool,
              [],
            ),
            returnValue: _i8.Future<
                _i5.Either<_i10.Failure,
                    _i6.CollaboratorPoolExitStatusEntity>>.value(_FakeEither_5<
                _i10.Failure, _i6.CollaboratorPoolExitStatusEntity>(
              this,
              Invocation.method(
                #exitCollaboratorPool,
                [],
              ),
            )),
          ) as _i8.Future<
              _i5.Either<_i10.Failure, _i6.CollaboratorPoolExitStatusEntity>>);

  @override
  _i8.Future<_i5.Either<_i10.Failure, _i6.CollaboratorSearchStatusEntity>>
      getCollaboratorSearchStatus() => (super.noSuchMethod(
            Invocation.method(
              #getCollaboratorSearchStatus,
              [],
            ),
            returnValue: _i8.Future<
                    _i5.Either<_i10.Failure,
                        _i6.CollaboratorSearchStatusEntity>>.value(
                _FakeEither_5<_i10.Failure, _i6.CollaboratorSearchStatusEntity>(
              this,
              Invocation.method(
                #getCollaboratorSearchStatus,
                [],
              ),
            )),
          ) as _i8.Future<
              _i5.Either<_i10.Failure, _i6.CollaboratorSearchStatusEntity>>);

  @override
  _i8.Future<_i5.Either<_i10.Failure, _i6.CollaboratorStreamStatusEntity>>
      cancelCollaboratorStream() => (super.noSuchMethod(
            Invocation.method(
              #cancelCollaboratorStream,
              [],
            ),
            returnValue: _i8.Future<
                    _i5.Either<_i10.Failure,
                        _i6.CollaboratorStreamStatusEntity>>.value(
                _FakeEither_5<_i10.Failure, _i6.CollaboratorStreamStatusEntity>(
              this,
              Invocation.method(
                #cancelCollaboratorStream,
                [],
              ),
            )),
          ) as _i8.Future<
              _i5.Either<_i10.Failure, _i6.CollaboratorStreamStatusEntity>>);
}

/// A class which mocks [MCancelCollaboratorStream].
///
/// See the documentation for Mockito's code generation for more information.
class MockMCancelCollaboratorStream extends _i1.Mock
    implements _i7.MCancelCollaboratorStream {
  MockMCancelCollaboratorStream() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_6(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i6.P2PCollaboratorPoolContract);

  @override
  _i8.Future<_i5.Either<_i10.Failure, _i6.CollaboratorStreamStatusEntity>> call(
          _i11.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<
                _i5.Either<_i10.Failure,
                    _i6.CollaboratorStreamStatusEntity>>.value(
            _FakeEither_5<_i10.Failure, _i6.CollaboratorStreamStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<
          _i5.Either<_i10.Failure, _i6.CollaboratorStreamStatusEntity>>);
}

/// A class which mocks [MEnterCollaboratorPool].
///
/// See the documentation for Mockito's code generation for more information.
class MockMEnterCollaboratorPool extends _i1.Mock
    implements _i7.MEnterCollaboratorPool {
  MockMEnterCollaboratorPool() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_6(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i6.P2PCollaboratorPoolContract);

  @override
  _i8.Future<
      _i5.Either<_i10.Failure, _i6.CollaboratorPoolEntryStatusEntity>> call(
          _i9.CollaboratorPhraseIDs? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<
                _i5.Either<_i10.Failure,
                    _i6.CollaboratorPoolEntryStatusEntity>>.value(
            _FakeEither_5<_i10.Failure, _i6.CollaboratorPoolEntryStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<
          _i5.Either<_i10.Failure, _i6.CollaboratorPoolEntryStatusEntity>>);
}

/// A class which mocks [MExitCollaboratorPool].
///
/// See the documentation for Mockito's code generation for more information.
class MockMExitCollaboratorPool extends _i1.Mock
    implements _i7.MExitCollaboratorPool {
  MockMExitCollaboratorPool() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_6(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i6.P2PCollaboratorPoolContract);

  @override
  _i8.Future<
      _i5.Either<_i10.Failure, _i6.CollaboratorPoolExitStatusEntity>> call(
          _i11.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<
                _i5.Either<_i10.Failure,
                    _i6.CollaboratorPoolExitStatusEntity>>.value(
            _FakeEither_5<_i10.Failure, _i6.CollaboratorPoolExitStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<
          _i5.Either<_i10.Failure, _i6.CollaboratorPoolExitStatusEntity>>);
}

/// A class which mocks [MGetCollaboratorSearchStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorSearchStatus extends _i1.Mock
    implements _i7.MGetCollaboratorSearchStatus {
  MockMGetCollaboratorSearchStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_6(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i6.P2PCollaboratorPoolContract);

  @override
  _i8.Future<_i5.Either<_i10.Failure, _i6.CollaboratorSearchStatusEntity>> call(
          _i11.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<
                _i5.Either<_i10.Failure,
                    _i6.CollaboratorSearchStatusEntity>>.value(
            _FakeEither_5<_i10.Failure, _i6.CollaboratorSearchStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<
          _i5.Either<_i10.Failure, _i6.CollaboratorSearchStatusEntity>>);
}

/// A class which mocks [MValidateQuery].
///
/// See the documentation for Mockito's code generation for more information.
class MockMValidateQuery extends _i1.Mock implements _i7.MValidateQuery {
  MockMValidateQuery() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_6(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i6.P2PCollaboratorPoolContract);

  @override
  _i8.Future<
      _i5.Either<_i10.Failure, _i6.CollaboratorPhraseValidationEntity>> call(
          _i6.ValidateQueryParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<
                _i5.Either<_i10.Failure,
                    _i6.CollaboratorPhraseValidationEntity>>.value(
            _FakeEither_5<_i10.Failure, _i6.CollaboratorPhraseValidationEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<
          _i5.Either<_i10.Failure, _i6.CollaboratorPhraseValidationEntity>>);
}

/// A class which mocks [P2PCollaboratorPoolRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockP2PCollaboratorPoolRemoteSource extends _i1.Mock
    implements _i12.P2PCollaboratorPoolRemoteSource {
  @override
  _i8.Future<List<dynamic>> validateQuery({required String? query}) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateQuery,
          [],
          {#query: query},
        ),
        returnValue: _i8.Future<List<dynamic>>.value(<dynamic>[]),
        returnValueForMissingStub: _i8.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i8.Future<List<dynamic>>);

  @override
  _i8.Future<_i2.FunctionResponse> enterThePool(
          _i9.CollaboratorPhraseIDs? phraseIDs) =>
      (super.noSuchMethod(
        Invocation.method(
          #enterThePool,
          [phraseIDs],
        ),
        returnValue:
            _i8.Future<_i2.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #enterThePool,
            [phraseIDs],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #enterThePool,
            [phraseIDs],
          ),
        )),
      ) as _i8.Future<_i2.FunctionResponse>);

  @override
  _i8.Future<_i2.FunctionResponse> exitThePool() => (super.noSuchMethod(
        Invocation.method(
          #exitThePool,
          [],
        ),
        returnValue:
            _i8.Future<_i2.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #exitThePool,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #exitThePool,
            [],
          ),
        )),
      ) as _i8.Future<_i2.FunctionResponse>);

  @override
  _i8.Stream<_i3.CollaboratorSearchAndEntryStatus>
      getCollaboratorSearchStatus() => (super.noSuchMethod(
            Invocation.method(
              #getCollaboratorSearchStatus,
              [],
            ),
            returnValue:
                _i8.Stream<_i3.CollaboratorSearchAndEntryStatus>.empty(),
            returnValueForMissingStub:
                _i8.Stream<_i3.CollaboratorSearchAndEntryStatus>.empty(),
          ) as _i8.Stream<_i3.CollaboratorSearchAndEntryStatus>);

  @override
  bool cancelStream() => (super.noSuchMethod(
        Invocation.method(
          #cancelStream,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

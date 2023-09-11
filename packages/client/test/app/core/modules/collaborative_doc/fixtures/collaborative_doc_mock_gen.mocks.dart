// Mocks generated by Mockito 5.4.1 from annotations
// in primala/test/app/core/modules/collaborative_doc/fixtures/collaborative_doc_mock_gen.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mobx/mobx.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:primala/app/core/error/failure.dart' as _i7;
import 'package:primala/app/core/interfaces/logic.dart' as _i8;
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart'
    as _i3;

import 'collaborative_doc_mock_gen.dart' as _i5;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCollaborativeDocContract_1 extends _i1.SmartFake
    implements _i3.CollaborativeDocContract {
  _FakeCollaborativeDocContract_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetCollaborativeDocContent_2 extends _i1.SmartFake
    implements _i3.GetCollaborativeDocContent {
  _FakeGetCollaborativeDocContent_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_3 extends _i1.SmartFake
    implements _i4.ReactiveContext {
  _FakeReactiveContext_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUpdateCollaborativeDoc_4 extends _i1.SmartFake
    implements _i3.UpdateCollaborativeDoc {
  _FakeUpdateCollaborativeDoc_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCreateCollaborativeDoc_5 extends _i1.SmartFake
    implements _i3.CreateCollaborativeDoc {
  _FakeCreateCollaborativeDoc_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetCollaboratorDelta_6 extends _i1.SmartFake
    implements _i3.GetCollaboratorDelta {
  _FakeGetCollaboratorDelta_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetCollaboratorPresence_7 extends _i1.SmartFake
    implements _i3.GetCollaboratorPresence {
  _FakeGetCollaboratorPresence_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MCollaborativeDocRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMCollaborativeDocRemoteSource extends _i1.Mock
    implements _i5.MCollaborativeDocRemoteSource {
  MockMCollaborativeDocRemoteSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Stream<String> getCollaborativeDocContent() => (super.noSuchMethod(
        Invocation.method(
          #getCollaborativeDocContent,
          [],
        ),
        returnValue: _i6.Stream<String>.empty(),
      ) as _i6.Stream<String>);
  @override
  _i6.Stream<int> getCollaboratorDelta() => (super.noSuchMethod(
        Invocation.method(
          #getCollaboratorDelta,
          [],
        ),
        returnValue: _i6.Stream<int>.empty(),
      ) as _i6.Stream<int>);
  @override
  _i6.Stream<bool> getCollaboratorPresence() => (super.noSuchMethod(
        Invocation.method(
          #getCollaboratorPresence,
          [],
        ),
        returnValue: _i6.Stream<bool>.empty(),
      ) as _i6.Stream<bool>);
  @override
  _i6.Future<List<dynamic>> createCollaborativeDoc(
          {required String? docType}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createCollaborativeDoc,
          [],
          {#docType: docType},
        ),
        returnValue: _i6.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i6.Future<List<dynamic>>);
  @override
  _i6.Future<List<dynamic>> updateCollaborativeDoc(
          {required String? newContent}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateCollaborativeDoc,
          [],
          {#newContent: newContent},
        ),
        returnValue: _i6.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i6.Future<List<dynamic>>);
}

/// A class which mocks [MCollaborativeDocContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockMCollaborativeDocContract extends _i1.Mock
    implements _i5.MCollaborativeDocContract {
  MockMCollaborativeDocContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.CollaborativeDocContentEntity>>
      getCollaborativeDocContent() => (super.noSuchMethod(
            Invocation.method(
              #getCollaborativeDocContent,
              [],
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocContentEntity>>.value(
                _FakeEither_0<_i7.Failure, _i3.CollaborativeDocContentEntity>(
              this,
              Invocation.method(
                #getCollaborativeDocContent,
                [],
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure, _i3.CollaborativeDocContentEntity>>);
  @override
  _i6.Future<
          _i2.Either<_i7.Failure, _i3.CollaborativeDocCollaboratorDeltaEntity>>
      getCollaboratorDelta() => (super.noSuchMethod(
            Invocation.method(
              #getCollaboratorDelta,
              [],
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocCollaboratorDeltaEntity>>.value(
                _FakeEither_0<_i7.Failure,
                    _i3.CollaborativeDocCollaboratorDeltaEntity>(
              this,
              Invocation.method(
                #getCollaboratorDelta,
                [],
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure,
                  _i3.CollaborativeDocCollaboratorDeltaEntity>>);
  @override
  _i6.Future<
          _i2.Either<_i7.Failure,
              _i3.CollaborativeDocCollaboratorPresenceEntity>>
      getCollaboratorPresence() => (super.noSuchMethod(
            Invocation.method(
              #getCollaboratorPresence,
              [],
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocCollaboratorPresenceEntity>>.value(
                _FakeEither_0<_i7.Failure,
                    _i3.CollaborativeDocCollaboratorPresenceEntity>(
              this,
              Invocation.method(
                #getCollaboratorPresence,
                [],
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure,
                  _i3.CollaborativeDocCollaboratorPresenceEntity>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.CollaborativeDocCreationStatusEntity>>
      createCollaborativeDoc({required String? docType}) => (super.noSuchMethod(
            Invocation.method(
              #createCollaborativeDoc,
              [],
              {#docType: docType},
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocCreationStatusEntity>>.value(
                _FakeEither_0<_i7.Failure,
                    _i3.CollaborativeDocCreationStatusEntity>(
              this,
              Invocation.method(
                #createCollaborativeDoc,
                [],
                {#docType: docType},
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure,
                  _i3.CollaborativeDocCreationStatusEntity>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.CollaborativeDocUpdateStatusEntity>>
      updateCollaborativeDoc({required String? newContent}) =>
          (super.noSuchMethod(
            Invocation.method(
              #updateCollaborativeDoc,
              [],
              {#newContent: newContent},
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocUpdateStatusEntity>>.value(
                _FakeEither_0<_i7.Failure,
                    _i3.CollaborativeDocUpdateStatusEntity>(
              this,
              Invocation.method(
                #updateCollaborativeDoc,
                [],
                {#newContent: newContent},
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure, _i3.CollaborativeDocUpdateStatusEntity>>);
}

/// A class which mocks [MGetCollaborativeDocContent].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaborativeDocContent extends _i1.Mock
    implements _i5.MGetCollaborativeDocContent {
  MockMGetCollaborativeDocContent() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CollaborativeDocContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeCollaborativeDocContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.CollaborativeDocContract);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.CollaborativeDocContentEntity>> call(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure,
                    _i3.CollaborativeDocContentEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.CollaborativeDocContentEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6
          .Future<_i2.Either<_i7.Failure, _i3.CollaborativeDocContentEntity>>);
}

/// A class which mocks [MGetCollaboratorDelta].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorDelta extends _i1.Mock
    implements _i5.MGetCollaboratorDelta {
  MockMGetCollaboratorDelta() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CollaborativeDocContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeCollaborativeDocContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.CollaborativeDocContract);
  @override
  _i6.Future<
          _i2.Either<_i7.Failure, _i3.CollaborativeDocCollaboratorDeltaEntity>>
      call(_i8.NoParams? params) => (super.noSuchMethod(
            Invocation.method(
              #call,
              [params],
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocCollaboratorDeltaEntity>>.value(
                _FakeEither_0<_i7.Failure,
                    _i3.CollaborativeDocCollaboratorDeltaEntity>(
              this,
              Invocation.method(
                #call,
                [params],
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure,
                  _i3.CollaborativeDocCollaboratorDeltaEntity>>);
}

/// A class which mocks [MUpdateCollaborativeDoc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMUpdateCollaborativeDoc extends _i1.Mock
    implements _i5.MUpdateCollaborativeDoc {
  MockMUpdateCollaborativeDoc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CollaborativeDocContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeCollaborativeDocContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.CollaborativeDocContract);
  @override
  _i6.Future<
      _i2.Either<_i7.Failure, _i3.CollaborativeDocUpdateStatusEntity>> call(
          _i3.UpdateCollaborativeDocParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure,
                    _i3.CollaborativeDocUpdateStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.CollaborativeDocUpdateStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<
          _i2.Either<_i7.Failure, _i3.CollaborativeDocUpdateStatusEntity>>);
}

/// A class which mocks [MCreateCollaborativeDoc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMCreateCollaborativeDoc extends _i1.Mock
    implements _i5.MCreateCollaborativeDoc {
  MockMCreateCollaborativeDoc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CollaborativeDocContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeCollaborativeDocContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.CollaborativeDocContract);
  @override
  _i6.Future<
      _i2.Either<_i7.Failure, _i3.CollaborativeDocCreationStatusEntity>> call(
          _i3.CreateCollaborativeDocParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
            _i2.Either<_i7.Failure,
                _i3.CollaborativeDocCreationStatusEntity>>.value(_FakeEither_0<
            _i7.Failure, _i3.CollaborativeDocCreationStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<
          _i2.Either<_i7.Failure, _i3.CollaborativeDocCreationStatusEntity>>);
}

/// A class which mocks [MGetCollaboratorPresence].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorPresence extends _i1.Mock
    implements _i5.MGetCollaboratorPresence {
  MockMGetCollaboratorPresence() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CollaborativeDocContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeCollaborativeDocContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.CollaborativeDocContract);
  @override
  _i6.Future<
          _i2.Either<_i7.Failure,
              _i3.CollaborativeDocCollaboratorPresenceEntity>>
      call(_i8.NoParams? params) => (super.noSuchMethod(
            Invocation.method(
              #call,
              [params],
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocCollaboratorPresenceEntity>>.value(
                _FakeEither_0<_i7.Failure,
                    _i3.CollaborativeDocCollaboratorPresenceEntity>(
              this,
              Invocation.method(
                #call,
                [params],
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure,
                  _i3.CollaborativeDocCollaboratorPresenceEntity>>);
}

/// A class which mocks [MGetCollaborativeDocContentGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaborativeDocContentGetterStore extends _i1.Mock
    implements _i5.MGetCollaborativeDocContentGetterStore {
  MockMGetCollaborativeDocContentGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GetCollaborativeDocContent get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeGetCollaborativeDocContent_2(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.GetCollaborativeDocContent);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
  @override
  _i4.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_3(
          this,
          Invocation.getter(#context),
        ),
      ) as _i4.ReactiveContext);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.CollaborativeDocContentEntity>>
      call() => (super.noSuchMethod(
            Invocation.method(
              #call,
              [],
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocContentEntity>>.value(
                _FakeEither_0<_i7.Failure, _i3.CollaborativeDocContentEntity>(
              this,
              Invocation.method(
                #call,
                [],
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure, _i3.CollaborativeDocContentEntity>>);
}

/// A class which mocks [MUpdateCollaborativeDocGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMUpdateCollaborativeDocGetterStore extends _i1.Mock
    implements _i5.MUpdateCollaborativeDocGetterStore {
  MockMUpdateCollaborativeDocGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.UpdateCollaborativeDoc get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeUpdateCollaborativeDoc_4(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.UpdateCollaborativeDoc);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
  @override
  _i4.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_3(
          this,
          Invocation.getter(#context),
        ),
      ) as _i4.ReactiveContext);
  @override
  _i6.Future<
      _i2.Either<_i7.Failure, _i3.CollaborativeDocUpdateStatusEntity>> call(
          _i3.UpdateCollaborativeDocParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure,
                    _i3.CollaborativeDocUpdateStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.CollaborativeDocUpdateStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<
          _i2.Either<_i7.Failure, _i3.CollaborativeDocUpdateStatusEntity>>);
}

/// A class which mocks [MCreateCollaborativeDocGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMCreateCollaborativeDocGetterStore extends _i1.Mock
    implements _i5.MCreateCollaborativeDocGetterStore {
  MockMCreateCollaborativeDocGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CreateCollaborativeDoc get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeCreateCollaborativeDoc_5(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.CreateCollaborativeDoc);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
  @override
  _i4.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_3(
          this,
          Invocation.getter(#context),
        ),
      ) as _i4.ReactiveContext);
  @override
  _i6.Future<
      _i2.Either<_i7.Failure, _i3.CollaborativeDocCreationStatusEntity>> call(
          _i3.CreateCollaborativeDocParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
            _i2.Either<_i7.Failure,
                _i3.CollaborativeDocCreationStatusEntity>>.value(_FakeEither_0<
            _i7.Failure, _i3.CollaborativeDocCreationStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<
          _i2.Either<_i7.Failure, _i3.CollaborativeDocCreationStatusEntity>>);
}

/// A class which mocks [MGetCollaboratorDeltaGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorDeltaGetterStore extends _i1.Mock
    implements _i5.MGetCollaboratorDeltaGetterStore {
  MockMGetCollaboratorDeltaGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GetCollaboratorDelta get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeGetCollaboratorDelta_6(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.GetCollaboratorDelta);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
  @override
  _i4.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_3(
          this,
          Invocation.getter(#context),
        ),
      ) as _i4.ReactiveContext);
  @override
  _i6.Future<
          _i2.Either<_i7.Failure, _i3.CollaborativeDocCollaboratorDeltaEntity>>
      call() => (super.noSuchMethod(
            Invocation.method(
              #call,
              [],
            ),
            returnValue: _i6.Future<
                    _i2.Either<_i7.Failure,
                        _i3.CollaborativeDocCollaboratorDeltaEntity>>.value(
                _FakeEither_0<_i7.Failure,
                    _i3.CollaborativeDocCollaboratorDeltaEntity>(
              this,
              Invocation.method(
                #call,
                [],
              ),
            )),
          ) as _i6.Future<
              _i2.Either<_i7.Failure,
                  _i3.CollaborativeDocCollaboratorDeltaEntity>>);
}

/// A class which mocks [MGetCollaboratorPresenceGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMGetCollaboratorPresenceGetterStore extends _i1.Mock
    implements _i5.MGetCollaboratorPresenceGetterStore {
  MockMGetCollaboratorPresenceGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GetCollaboratorPresence get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeGetCollaboratorPresence_7(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.GetCollaboratorPresence);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
  @override
  _i4.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_3(
          this,
          Invocation.getter(#context),
        ),
      ) as _i4.ReactiveContext);
  @override
  _i6.Future<
      _i2.Either<_i7.Failure,
          _i3.CollaborativeDocCollaboratorPresenceEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure,
                    _i3.CollaborativeDocCollaboratorPresenceEntity>>.value(
            _FakeEither_0<_i7.Failure,
                _i3.CollaborativeDocCollaboratorPresenceEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i6.Future<
          _i2.Either<_i7.Failure,
              _i3.CollaborativeDocCollaboratorPresenceEntity>>);
}

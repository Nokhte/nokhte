// Mocks generated by Mockito 5.4.0 from annotations
// in primala/test/app/modules/p2p_collaborator_pool/fixtures/p2p_collaborator_pool_stack_mock_gen.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:dartz/dartz.dart' as _i6;
import 'package:mobx/mobx.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:primala/app/core/error/failure.dart' as _i12;
import 'package:primala/app/core/interfaces/logic.dart' as _i14;
import 'package:primala/app/modules/p2p_collaborator_pool/data/data.dart'
    as _i16;
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart'
    as _i4;
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/presentation.dart'
    as _i7;
import 'package:primala_backend/phrase_components.dart' as _i11;
import 'package:primala_backend/streams.dart' as _i5;
import 'package:speech_to_text/speech_recognition_result.dart' as _i15;
import 'package:speech_to_text/speech_to_text.dart' as _i2;
import 'package:speech_to_text_platform_interface/speech_to_text_platform_interface.dart'
    as _i13;
import 'package:supabase_flutter/supabase_flutter.dart' as _i3;

import 'p2p_collaborator_pool_stack_mock_gen.dart' as _i9;

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

class _FakeSpeechToText_0 extends _i1.SmartFake implements _i2.SpeechToText {
  _FakeSpeechToText_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSupabaseClient_1 extends _i1.SmartFake
    implements _i3.SupabaseClient {
  _FakeSupabaseClient_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeOnSpeechResult_2 extends _i1.SmartFake
    implements _i4.OnSpeechResult {
  _FakeOnSpeechResult_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeExistingCollaborationsStream_3 extends _i1.SmartFake
    implements _i5.ExistingCollaborationsStream {
  _FakeExistingCollaborationsStream_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFunctionResponse_4 extends _i1.SmartFake
    implements _i3.FunctionResponse {
  _FakeFunctionResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeP2PCollaboratorPoolContract_5 extends _i1.SmartFake
    implements _i4.P2PCollaboratorPoolContract {
  _FakeP2PCollaboratorPoolContract_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_6<L, R> extends _i1.SmartFake implements _i6.Either<L, R> {
  _FakeEither_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeOnSpeechResultStore_7 extends _i1.SmartFake
    implements _i7.OnSpeechResultStore {
  _FakeOnSpeechResultStore_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_8 extends _i1.SmartFake
    implements _i8.ReactiveContext {
  _FakeReactiveContext_8(
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
    implements _i9.MP2PCollaboratorPoolRemoteSourceImpl {
  MockMP2PCollaboratorPoolRemoteSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SpeechToText get speechToText => (super.noSuchMethod(
        Invocation.getter(#speechToText),
        returnValue: _FakeSpeechToText_0(
          this,
          Invocation.getter(#speechToText),
        ),
      ) as _i2.SpeechToText);
  @override
  _i3.SupabaseClient get supabase => (super.noSuchMethod(
        Invocation.getter(#supabase),
        returnValue: _FakeSupabaseClient_1(
          this,
          Invocation.getter(#supabase),
        ),
      ) as _i3.SupabaseClient);
  @override
  _i4.OnSpeechResult get onSpeechResult => (super.noSuchMethod(
        Invocation.getter(#onSpeechResult),
        returnValue: _FakeOnSpeechResult_2(
          this,
          Invocation.getter(#onSpeechResult),
        ),
      ) as _i4.OnSpeechResult);
  @override
  String get currentUserUID => (super.noSuchMethod(
        Invocation.getter(#currentUserUID),
        returnValue: '',
      ) as String);
  @override
  _i5.ExistingCollaborationsStream get existingCollaborationsStream =>
      (super.noSuchMethod(
        Invocation.getter(#existingCollaborationsStream),
        returnValue: _FakeExistingCollaborationsStream_3(
          this,
          Invocation.getter(#existingCollaborationsStream),
        ),
      ) as _i5.ExistingCollaborationsStream);
  @override
  _i10.Future<bool> initiateSpeechToText() => (super.noSuchMethod(
        Invocation.method(
          #initiateSpeechToText,
          [],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
  @override
  _i10.Future<dynamic> startListening() => (super.noSuchMethod(
        Invocation.method(
          #startListening,
          [],
        ),
        returnValue: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Future<dynamic> stopListening() => (super.noSuchMethod(
        Invocation.method(
          #stopListening,
          [],
        ),
        returnValue: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Future<List<dynamic>> validateQuery({required String? query}) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateQuery,
          [],
          {#query: query},
        ),
        returnValue: _i10.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i10.Future<List<dynamic>>);
  @override
  _i10.Future<_i3.FunctionResponse> enterThePool(
          {required _i11.CollaboratorPhraseIDs? phraseIDs}) =>
      (super.noSuchMethod(
        Invocation.method(
          #enterThePool,
          [],
          {#phraseIDs: phraseIDs},
        ),
        returnValue:
            _i10.Future<_i3.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #enterThePool,
            [],
            {#phraseIDs: phraseIDs},
          ),
        )),
      ) as _i10.Future<_i3.FunctionResponse>);
  @override
  _i10.Future<_i3.FunctionResponse> exitThePool() => (super.noSuchMethod(
        Invocation.method(
          #exitThePool,
          [],
        ),
        returnValue:
            _i10.Future<_i3.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #exitThePool,
            [],
          ),
        )),
      ) as _i10.Future<_i3.FunctionResponse>);
  @override
  _i10.Stream<bool> getCollaboratorSearchStatus() => (super.noSuchMethod(
        Invocation.method(
          #getCollaboratorSearchStatus,
          [],
        ),
        returnValue: _i10.Stream<bool>.empty(),
      ) as _i10.Stream<bool>);
  @override
  bool cancelStream() => (super.noSuchMethod(
        Invocation.method(
          #cancelStream,
          [],
        ),
        returnValue: false,
      ) as bool);
}

/// A class which mocks [MEnterCollaboratorPool].
///
/// See the documentation for Mockito's code generation for more information.
class MockMEnterCollaboratorPool extends _i1.Mock
    implements _i9.MEnterCollaboratorPool {
  MockMEnterCollaboratorPool() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_5(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i4.P2PCollaboratorPoolContract);
  @override
  _i10.Future<
      _i6.Either<_i12.Failure, _i4.CollaboratorPoolEntryStatusEntity>> call(
          _i11.CollaboratorPhraseIDs? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i10.Future<
                _i6.Either<_i12.Failure,
                    _i4.CollaboratorPoolEntryStatusEntity>>.value(
            _FakeEither_6<_i12.Failure, _i4.CollaboratorPoolEntryStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i10.Future<
          _i6.Either<_i12.Failure, _i4.CollaboratorPoolEntryStatusEntity>>);
}

/// A class which mocks [MSpeechToText].
///
/// See the documentation for Mockito's code generation for more information.
class MockMSpeechToText extends _i1.Mock implements _i9.MSpeechToText {
  MockMSpeechToText() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set errorListener(_i2.SpeechErrorListener? _errorListener) =>
      super.noSuchMethod(
        Invocation.setter(
          #errorListener,
          _errorListener,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set statusListener(_i2.SpeechStatusListener? _statusListener) =>
      super.noSuchMethod(
        Invocation.setter(
          #statusListener,
          _statusListener,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasRecognized => (super.noSuchMethod(
        Invocation.getter(#hasRecognized),
        returnValue: false,
      ) as bool);
  @override
  String get lastRecognizedWords => (super.noSuchMethod(
        Invocation.getter(#lastRecognizedWords),
        returnValue: '',
      ) as String);
  @override
  String get lastStatus => (super.noSuchMethod(
        Invocation.getter(#lastStatus),
        returnValue: '',
      ) as String);
  @override
  double get lastSoundLevel => (super.noSuchMethod(
        Invocation.getter(#lastSoundLevel),
        returnValue: 0.0,
      ) as double);
  @override
  bool get isAvailable => (super.noSuchMethod(
        Invocation.getter(#isAvailable),
        returnValue: false,
      ) as bool);
  @override
  bool get isListening => (super.noSuchMethod(
        Invocation.getter(#isListening),
        returnValue: false,
      ) as bool);
  @override
  bool get isNotListening => (super.noSuchMethod(
        Invocation.getter(#isNotListening),
        returnValue: false,
      ) as bool);
  @override
  bool get hasError => (super.noSuchMethod(
        Invocation.getter(#hasError),
        returnValue: false,
      ) as bool);
  @override
  _i10.Future<bool> get hasPermission => (super.noSuchMethod(
        Invocation.getter(#hasPermission),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
  @override
  _i10.Future<bool> initialize({
    _i2.SpeechErrorListener? onError,
    _i2.SpeechStatusListener? onStatus,
    dynamic debugLogging = false,
    Duration? finalTimeout = const Duration(milliseconds: 2000),
    List<_i13.SpeechConfigOption>? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #initialize,
          [],
          {
            #onError: onError,
            #onStatus: onStatus,
            #debugLogging: debugLogging,
            #finalTimeout: finalTimeout,
            #options: options,
          },
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
  @override
  _i10.Future<void> stop() => (super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<void> cancel() => (super.noSuchMethod(
        Invocation.method(
          #cancel,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<dynamic> listen({
    _i2.SpeechResultListener? onResult,
    Duration? listenFor,
    Duration? pauseFor,
    String? localeId,
    _i2.SpeechSoundLevelChange? onSoundLevelChange,
    dynamic cancelOnError = false,
    dynamic partialResults = true,
    dynamic onDevice = false,
    _i2.ListenMode? listenMode = _i2.ListenMode.confirmation,
    dynamic sampleRate = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [],
          {
            #onResult: onResult,
            #listenFor: listenFor,
            #pauseFor: pauseFor,
            #localeId: localeId,
            #onSoundLevelChange: onSoundLevelChange,
            #cancelOnError: cancelOnError,
            #partialResults: partialResults,
            #onDevice: onDevice,
            #listenMode: listenMode,
            #sampleRate: sampleRate,
          },
        ),
        returnValue: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  void changePauseFor(Duration? pauseFor) => super.noSuchMethod(
        Invocation.method(
          #changePauseFor,
          [pauseFor],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<List<_i2.LocaleName>> locales() => (super.noSuchMethod(
        Invocation.method(
          #locales,
          [],
        ),
        returnValue:
            _i10.Future<List<_i2.LocaleName>>.value(<_i2.LocaleName>[]),
      ) as _i10.Future<List<_i2.LocaleName>>);
  @override
  _i10.Future<_i2.LocaleName?> systemLocale() => (super.noSuchMethod(
        Invocation.method(
          #systemLocale,
          [],
        ),
        returnValue: _i10.Future<_i2.LocaleName?>.value(),
      ) as _i10.Future<_i2.LocaleName?>);
}

/// A class which mocks [MInitiateSpeechToText].
///
/// See the documentation for Mockito's code generation for more information.
class MockMInitiateSpeechToText extends _i1.Mock
    implements _i9.MInitiateSpeechToText {
  MockMInitiateSpeechToText() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_5(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i4.P2PCollaboratorPoolContract);
  @override
  _i10.Future<
      _i6.Either<_i12.Failure, _i4.SpeechToTextInitializerStatusEntity>> call(
          _i14.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i10.Future<
            _i6.Either<_i12.Failure,
                _i4.SpeechToTextInitializerStatusEntity>>.value(_FakeEither_6<
            _i12.Failure, _i4.SpeechToTextInitializerStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i10.Future<
          _i6.Either<_i12.Failure, _i4.SpeechToTextInitializerStatusEntity>>);
}

/// A class which mocks [MOnSpeechResult].
///
/// See the documentation for Mockito's code generation for more information.
class MockMOnSpeechResult extends _i1.Mock implements _i9.MOnSpeechResult {
  MockMOnSpeechResult() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.OnSpeechResultStore get speechResultStore => (super.noSuchMethod(
        Invocation.getter(#speechResultStore),
        returnValue: _FakeOnSpeechResultStore_7(
          this,
          Invocation.getter(#speechResultStore),
        ),
      ) as _i7.OnSpeechResultStore);
  @override
  dynamic call(_i15.SpeechRecognitionResult? params) =>
      super.noSuchMethod(Invocation.method(
        #call,
        [params],
      ));
}

/// A class which mocks [MStartListening].
///
/// See the documentation for Mockito's code generation for more information.
class MockMStartListening extends _i1.Mock implements _i9.MStartListening {
  MockMStartListening() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_5(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i4.P2PCollaboratorPoolContract);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.ListeningStatusEntity>> call(
          _i14.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i10.Future<
                _i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>.value(
            _FakeEither_6<_i12.Failure, _i4.ListeningStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i10.Future<_i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>);
}

/// A class which mocks [MExitCollaboratorPool].
///
/// See the documentation for Mockito's code generation for more information.
class MockMExitCollaboratorPool extends _i1.Mock
    implements _i9.MExitCollaboratorPool {
  MockMExitCollaboratorPool() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_5(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i4.P2PCollaboratorPoolContract);
  @override
  _i10.Future<
      _i6.Either<_i12.Failure, _i4.CollaboratorPoolExitStatusEntity>> call(
          _i14.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i10.Future<
                _i6.Either<_i12.Failure,
                    _i4.CollaboratorPoolExitStatusEntity>>.value(
            _FakeEither_6<_i12.Failure, _i4.CollaboratorPoolExitStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i10.Future<
          _i6.Either<_i12.Failure, _i4.CollaboratorPoolExitStatusEntity>>);
}

/// A class which mocks [MStopListening].
///
/// See the documentation for Mockito's code generation for more information.
class MockMStopListening extends _i1.Mock implements _i9.MStopListening {
  MockMStopListening() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_5(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i4.P2PCollaboratorPoolContract);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.ListeningStatusEntity>> call(
          _i14.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i10.Future<
                _i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>.value(
            _FakeEither_6<_i12.Failure, _i4.ListeningStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i10.Future<_i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>);
}

/// A class which mocks [MValidateQuery].
///
/// See the documentation for Mockito's code generation for more information.
class MockMValidateQuery extends _i1.Mock implements _i9.MValidateQuery {
  MockMValidateQuery() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.P2PCollaboratorPoolContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeP2PCollaboratorPoolContract_5(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i4.P2PCollaboratorPoolContract);
  @override
  _i10.Future<
      _i6.Either<_i12.Failure, _i4.CollaboratorPhraseValidationEntity>> call(
          _i4.ValidateQueryParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i10.Future<
                _i6.Either<_i12.Failure,
                    _i4.CollaboratorPhraseValidationEntity>>.value(
            _FakeEither_6<_i12.Failure, _i4.CollaboratorPhraseValidationEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i10.Future<
          _i6.Either<_i12.Failure, _i4.CollaboratorPhraseValidationEntity>>);
}

/// A class which mocks [MP2PCollaboratorPoolContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockMP2PCollaboratorPoolContract extends _i1.Mock
    implements _i9.MP2PCollaboratorPoolContract {
  MockMP2PCollaboratorPoolContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<
      _i6.Either<
          _i12.Failure,
          _i4
              .CollaboratorPhraseValidationEntity>> validateQuery(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateQuery,
          [query],
        ),
        returnValue: _i10.Future<
                _i6.Either<_i12.Failure,
                    _i4.CollaboratorPhraseValidationEntity>>.value(
            _FakeEither_6<_i12.Failure, _i4.CollaboratorPhraseValidationEntity>(
          this,
          Invocation.method(
            #validateQuery,
            [query],
          ),
        )),
      ) as _i10.Future<
          _i6.Either<_i12.Failure, _i4.CollaboratorPhraseValidationEntity>>);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.SpeechToTextInitializerStatusEntity>>
      initializeSpeechToText() => (super.noSuchMethod(
            Invocation.method(
              #initializeSpeechToText,
              [],
            ),
            returnValue: _i10.Future<
                    _i6.Either<_i12.Failure,
                        _i4.SpeechToTextInitializerStatusEntity>>.value(
                _FakeEither_6<_i12.Failure,
                    _i4.SpeechToTextInitializerStatusEntity>(
              this,
              Invocation.method(
                #initializeSpeechToText,
                [],
              ),
            )),
          ) as _i10.Future<
              _i6.Either<_i12.Failure,
                  _i4.SpeechToTextInitializerStatusEntity>>);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>
      startListening() => (super.noSuchMethod(
            Invocation.method(
              #startListening,
              [],
            ),
            returnValue: _i10.Future<
                    _i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>.value(
                _FakeEither_6<_i12.Failure, _i4.ListeningStatusEntity>(
              this,
              Invocation.method(
                #startListening,
                [],
              ),
            )),
          ) as _i10
              .Future<_i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>
      stopListening() => (super.noSuchMethod(
            Invocation.method(
              #stopListening,
              [],
            ),
            returnValue: _i10.Future<
                    _i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>.value(
                _FakeEither_6<_i12.Failure, _i4.ListeningStatusEntity>(
              this,
              Invocation.method(
                #stopListening,
                [],
              ),
            )),
          ) as _i10
              .Future<_i6.Either<_i12.Failure, _i4.ListeningStatusEntity>>);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.CollaboratorPoolEntryStatusEntity>>
      enterTheCollaboratorPool(
              {required _i11.CollaboratorPhraseIDs? phraseIDs}) =>
          (super.noSuchMethod(
            Invocation.method(
              #enterTheCollaboratorPool,
              [],
              {#phraseIDs: phraseIDs},
            ),
            returnValue: _i10.Future<
                _i6.Either<_i12.Failure,
                    _i4.CollaboratorPoolEntryStatusEntity>>.value(_FakeEither_6<
                _i12.Failure, _i4.CollaboratorPoolEntryStatusEntity>(
              this,
              Invocation.method(
                #enterTheCollaboratorPool,
                [],
                {#phraseIDs: phraseIDs},
              ),
            )),
          ) as _i10.Future<
              _i6.Either<_i12.Failure, _i4.CollaboratorPoolEntryStatusEntity>>);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.CollaboratorPoolExitStatusEntity>>
      exitCollaboratorPool() => (super.noSuchMethod(
            Invocation.method(
              #exitCollaboratorPool,
              [],
            ),
            returnValue: _i10.Future<
                _i6.Either<_i12.Failure,
                    _i4.CollaboratorPoolExitStatusEntity>>.value(_FakeEither_6<
                _i12.Failure, _i4.CollaboratorPoolExitStatusEntity>(
              this,
              Invocation.method(
                #exitCollaboratorPool,
                [],
              ),
            )),
          ) as _i10.Future<
              _i6.Either<_i12.Failure, _i4.CollaboratorPoolExitStatusEntity>>);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.CollaboratorSearchStatusEntity>>
      getCollaboratorSearchStatus() => (super.noSuchMethod(
            Invocation.method(
              #getCollaboratorSearchStatus,
              [],
            ),
            returnValue: _i10.Future<
                    _i6.Either<_i12.Failure,
                        _i4.CollaboratorSearchStatusEntity>>.value(
                _FakeEither_6<_i12.Failure, _i4.CollaboratorSearchStatusEntity>(
              this,
              Invocation.method(
                #getCollaboratorSearchStatus,
                [],
              ),
            )),
          ) as _i10.Future<
              _i6.Either<_i12.Failure, _i4.CollaboratorSearchStatusEntity>>);
  @override
  _i10.Future<_i6.Either<_i12.Failure, _i4.CollaboratorStreamStatusEntity>>
      cancelCollaboratorStream() => (super.noSuchMethod(
            Invocation.method(
              #cancelCollaboratorStream,
              [],
            ),
            returnValue: _i10.Future<
                    _i6.Either<_i12.Failure,
                        _i4.CollaboratorStreamStatusEntity>>.value(
                _FakeEither_6<_i12.Failure, _i4.CollaboratorStreamStatusEntity>(
              this,
              Invocation.method(
                #cancelCollaboratorStream,
                [],
              ),
            )),
          ) as _i10.Future<
              _i6.Either<_i12.Failure, _i4.CollaboratorStreamStatusEntity>>);
}

/// A class which mocks [MOnSpeechResultStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMOnSpeechResultStore extends _i1.Mock
    implements _i9.MOnSpeechResultStore {
  MockMOnSpeechResultStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get currentPhraseIndex => (super.noSuchMethod(
        Invocation.getter(#currentPhraseIndex),
        returnValue: 0,
      ) as int);
  @override
  set currentPhraseIndex(int? value) => super.noSuchMethod(
        Invocation.setter(
          #currentPhraseIndex,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get currentSpeechResult => (super.noSuchMethod(
        Invocation.getter(#currentSpeechResult),
        returnValue: '',
      ) as String);
  @override
  set currentSpeechResult(String? value) => super.noSuchMethod(
        Invocation.setter(
          #currentSpeechResult,
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
        returnValue: _FakeReactiveContext_8(
          this,
          Invocation.getter(#context),
        ),
      ) as _i8.ReactiveContext);
  @override
  dynamic addSpeechResult({required String? result}) =>
      super.noSuchMethod(Invocation.method(
        #addSpeechResult,
        [],
        {#result: result},
      ));
}

/// A class which mocks [P2PCollaboratorPoolRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockP2PCollaboratorPoolRemoteSource extends _i1.Mock
    implements _i16.P2PCollaboratorPoolRemoteSource {
  @override
  _i10.Future<bool> initiateSpeechToText() => (super.noSuchMethod(
        Invocation.method(
          #initiateSpeechToText,
          [],
        ),
        returnValue: _i10.Future<bool>.value(false),
        returnValueForMissingStub: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
  @override
  _i10.Future<dynamic> startListening() => (super.noSuchMethod(
        Invocation.method(
          #startListening,
          [],
        ),
        returnValue: _i10.Future<dynamic>.value(),
        returnValueForMissingStub: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Future<dynamic> stopListening() => (super.noSuchMethod(
        Invocation.method(
          #stopListening,
          [],
        ),
        returnValue: _i10.Future<dynamic>.value(),
        returnValueForMissingStub: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Future<List<dynamic>> validateQuery({required String? query}) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateQuery,
          [],
          {#query: query},
        ),
        returnValue: _i10.Future<List<dynamic>>.value(<dynamic>[]),
        returnValueForMissingStub:
            _i10.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i10.Future<List<dynamic>>);
  @override
  _i10.Future<_i3.FunctionResponse> enterThePool(
          {required _i11.CollaboratorPhraseIDs? phraseIDs}) =>
      (super.noSuchMethod(
        Invocation.method(
          #enterThePool,
          [],
          {#phraseIDs: phraseIDs},
        ),
        returnValue:
            _i10.Future<_i3.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #enterThePool,
            [],
            {#phraseIDs: phraseIDs},
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i3.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #enterThePool,
            [],
            {#phraseIDs: phraseIDs},
          ),
        )),
      ) as _i10.Future<_i3.FunctionResponse>);
  @override
  _i10.Future<_i3.FunctionResponse> exitThePool() => (super.noSuchMethod(
        Invocation.method(
          #exitThePool,
          [],
        ),
        returnValue:
            _i10.Future<_i3.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #exitThePool,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i3.FunctionResponse>.value(_FakeFunctionResponse_4(
          this,
          Invocation.method(
            #exitThePool,
            [],
          ),
        )),
      ) as _i10.Future<_i3.FunctionResponse>);
  @override
  _i10.Stream<bool> getCollaboratorSearchStatus() => (super.noSuchMethod(
        Invocation.method(
          #getCollaboratorSearchStatus,
          [],
        ),
        returnValue: _i10.Stream<bool>.empty(),
        returnValueForMissingStub: _i10.Stream<bool>.empty(),
      ) as _i10.Stream<bool>);
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

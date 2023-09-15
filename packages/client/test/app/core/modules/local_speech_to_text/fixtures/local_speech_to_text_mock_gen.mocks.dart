// Mocks generated by Mockito 5.4.1 from annotations
// in primala/test/app/core/modules/local_speech_to_text/fixtures/local_speech_to_text_mock_gen.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:io' as _i11;

import 'package:dartz/dartz.dart' as _i2;
import 'package:leopard_flutter/leopard_transcript.dart' as _i10;
import 'package:mobx/mobx.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:primala/app/core/error/failure.dart' as _i7;
import 'package:primala/app/core/interfaces/logic.dart' as _i8;
import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart'
    as _i12;
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart'
    as _i9;
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart'
    as _i3;

import 'local_speech_to_text_mock_gen.dart' as _i5;

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

class _FakeLocalSpeechToTextContract_1 extends _i1.SmartFake
    implements _i3.LocalSpeechToTextContract {
  _FakeLocalSpeechToTextContract_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInitLeopard_2 extends _i1.SmartFake implements _i3.InitLeopard {
  _FakeInitLeopard_2(
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

class _FakeStartRecording_4 extends _i1.SmartFake
    implements _i3.StartRecording {
  _FakeStartRecording_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStopRecording_5 extends _i1.SmartFake implements _i3.StopRecording {
  _FakeStopRecording_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProcessAudio_6 extends _i1.SmartFake implements _i3.ProcessAudio {
  _FakeProcessAudio_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MLocalSpeechToTextContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockMLocalSpeechToTextContract extends _i1.Mock
    implements _i5.MLocalSpeechToTextContract {
  MockMLocalSpeechToTextContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.AudioProcessingEntity>> processAudio(
          _i3.ProcessAudioParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #processAudio,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.AudioProcessingEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.AudioProcessingEntity>(
          this,
          Invocation.method(
            #processAudio,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.AudioProcessingEntity>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>> startRecording(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #startRecording,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.RecordingStatusEntity>(
          this,
          Invocation.method(
            #startRecording,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>> stopRecording(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #stopRecording,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.RecordingStatusEntity>(
          this,
          Invocation.method(
            #stopRecording,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>> initLeopard(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #initLeopard,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.InitLeopardStatusEntity>(
          this,
          Invocation.method(
            #initLeopard,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>>);
}

/// A class which mocks [MInitLeopard].
///
/// See the documentation for Mockito's code generation for more information.
class MockMInitLeopard extends _i1.Mock implements _i5.MInitLeopard {
  MockMInitLeopard() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.LocalSpeechToTextContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeLocalSpeechToTextContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.LocalSpeechToTextContract);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>> call(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.InitLeopardStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>>);
}

/// A class which mocks [MStopRecording].
///
/// See the documentation for Mockito's code generation for more information.
class MockMStopRecording extends _i1.Mock implements _i5.MStopRecording {
  MockMStopRecording() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.LocalSpeechToTextContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeLocalSpeechToTextContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.LocalSpeechToTextContract);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>> call(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.RecordingStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>);
}

/// A class which mocks [MStartRecording].
///
/// See the documentation for Mockito's code generation for more information.
class MockMStartRecording extends _i1.Mock implements _i5.MStartRecording {
  MockMStartRecording() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.LocalSpeechToTextContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeLocalSpeechToTextContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.LocalSpeechToTextContract);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>> call(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.RecordingStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>);
}

/// A class which mocks [MProcessAudio].
///
/// See the documentation for Mockito's code generation for more information.
class MockMProcessAudio extends _i1.Mock implements _i5.MProcessAudio {
  MockMProcessAudio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.LocalSpeechToTextContract get contract => (super.noSuchMethod(
        Invocation.getter(#contract),
        returnValue: _FakeLocalSpeechToTextContract_1(
          this,
          Invocation.getter(#contract),
        ),
      ) as _i3.LocalSpeechToTextContract);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.AudioProcessingEntity>> call(
          _i3.ProcessAudioParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.AudioProcessingEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.AudioProcessingEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.AudioProcessingEntity>>);
}

/// A class which mocks [MInitLeopardGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMInitLeopardGetterStore extends _i1.Mock
    implements _i5.MInitLeopardGetterStore {
  MockMInitLeopardGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.InitLeopard get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeInitLeopard_2(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.InitLeopard);
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
  _i6.Future<_i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>> call(
          dynamic params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.InitLeopardStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.InitLeopardStatusEntity>>);
}

/// A class which mocks [MStartRecordingGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMStartRecordingGetterStore extends _i1.Mock
    implements _i5.MStartRecordingGetterStore {
  MockMStartRecordingGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.StartRecording get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeStartRecording_4(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.StartRecording);
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
  _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>> call(
          dynamic params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.RecordingStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>);
}

/// A class which mocks [MStopRecordingGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMStopRecordingGetterStore extends _i1.Mock
    implements _i5.MStopRecordingGetterStore {
  MockMStopRecordingGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.StopRecording get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeStopRecording_5(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.StopRecording);
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
  _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>> call(
          dynamic params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.RecordingStatusEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.RecordingStatusEntity>>);
}

/// A class which mocks [MProcessAudioGetterStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockMProcessAudioGetterStore extends _i1.Mock
    implements _i5.MProcessAudioGetterStore {
  MockMProcessAudioGetterStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ProcessAudio get logic => (super.noSuchMethod(
        Invocation.getter(#logic),
        returnValue: _FakeProcessAudio_6(
          this,
          Invocation.getter(#logic),
        ),
      ) as _i3.ProcessAudio);
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
  _i6.Future<_i2.Either<_i7.Failure, _i3.AudioProcessingEntity>> call(
          dynamic params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<
                _i2.Either<_i7.Failure, _i3.AudioProcessingEntity>>.value(
            _FakeEither_0<_i7.Failure, _i3.AudioProcessingEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i3.AudioProcessingEntity>>);
}

/// A class which mocks [LocalSpeechToTextRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalSpeechToTextRemoteSource extends _i1.Mock
    implements _i9.LocalSpeechToTextRemoteSource {
  @override
  _i6.Future<bool> initLeopard() => (super.noSuchMethod(
        Invocation.method(
          #initLeopard,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<List<_i10.LeopardWord>> processAudio(_i11.File? recordedFile) =>
      (super.noSuchMethod(
        Invocation.method(
          #processAudio,
          [recordedFile],
        ),
        returnValue:
            _i6.Future<List<_i10.LeopardWord>>.value(<_i10.LeopardWord>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i10.LeopardWord>>.value(<_i10.LeopardWord>[]),
      ) as _i6.Future<List<_i10.LeopardWord>>);
  @override
  _i6.Future<_i12.RecordingStatus> stopRecording() => (super.noSuchMethod(
        Invocation.method(
          #stopRecording,
          [],
        ),
        returnValue: _i6.Future<_i12.RecordingStatus>.value(
            _i12.RecordingStatus.initial),
        returnValueForMissingStub: _i6.Future<_i12.RecordingStatus>.value(
            _i12.RecordingStatus.initial),
      ) as _i6.Future<_i12.RecordingStatus>);
  @override
  _i6.Future<_i12.RecordingStatus> startRecording() => (super.noSuchMethod(
        Invocation.method(
          #startRecording,
          [],
        ),
        returnValue: _i6.Future<_i12.RecordingStatus>.value(
            _i12.RecordingStatus.initial),
        returnValueForMissingStub: _i6.Future<_i12.RecordingStatus>.value(
            _i12.RecordingStatus.initial),
      ) as _i6.Future<_i12.RecordingStatus>);
}

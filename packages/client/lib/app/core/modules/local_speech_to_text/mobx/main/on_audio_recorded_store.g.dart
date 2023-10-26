// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_audio_recorded_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnAudioRecordedStore on _OnAudioRecordedStoreBase, Store {
  late final _$recordedLengthAtom =
      Atom(name: '_OnAudioRecordedStoreBase.recordedLength', context: context);

  @override
  double get recordedLength {
    _$recordedLengthAtom.reportRead();
    return super.recordedLength;
  }

  @override
  set recordedLength(double value) {
    _$recordedLengthAtom.reportWrite(value, super.recordedLength, () {
      super.recordedLength = value;
    });
  }

  late final _$isTranscribingAtom =
      Atom(name: '_OnAudioRecordedStoreBase.isTranscribing', context: context);

  @override
  bool get isTranscribing {
    _$isTranscribingAtom.reportRead();
    return super.isTranscribing;
  }

  @override
  set isTranscribing(bool value) {
    _$isTranscribingAtom.reportWrite(value, super.isTranscribing, () {
      super.isTranscribing = value;
    });
  }

  late final _$errorMeessageAtom =
      Atom(name: '_OnAudioRecordedStoreBase.errorMeessage', context: context);

  @override
  String get errorMeessage {
    _$errorMeessageAtom.reportRead();
    return super.errorMeessage;
  }

  @override
  set errorMeessage(String value) {
    _$errorMeessageAtom.reportWrite(value, super.errorMeessage, () {
      super.errorMeessage = value;
    });
  }

  late final _$_OnAudioRecordedStoreBaseActionController =
      ActionController(name: '_OnAudioRecordedStoreBase', context: context);

  @override
  dynamic call(Either<LeopardException, double> res) {
    final _$actionInfo = _$_OnAudioRecordedStoreBaseActionController
        .startAction(name: '_OnAudioRecordedStoreBase.call');
    try {
      return super.call(res);
    } finally {
      _$_OnAudioRecordedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBackToDefaults() {
    final _$actionInfo = _$_OnAudioRecordedStoreBaseActionController
        .startAction(name: '_OnAudioRecordedStoreBase.setBackToDefaults');
    try {
      return super.setBackToDefaults();
    } finally {
      _$_OnAudioRecordedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recordedLength: ${recordedLength},
isTranscribing: ${isTranscribing},
errorMeessage: ${errorMeessage}
    ''';
  }
}

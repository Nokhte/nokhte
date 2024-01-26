// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speak_the_collaborator_phrase_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpeakTheCollaboratorPhraseCoordinatorStore
    on _SpeakTheCollaboratorPhraseCoordinatorStoreBase, Store {
  late final _$isFirstTimeSpeakingAtom = Atom(
      name:
          '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.isFirstTimeSpeaking',
      context: context);

  @override
  bool get isFirstTimeSpeaking {
    _$isFirstTimeSpeakingAtom.reportRead();
    return super.isFirstTimeSpeaking;
  }

  @override
  set isFirstTimeSpeaking(bool value) {
    _$isFirstTimeSpeakingAtom.reportWrite(value, super.isFirstTimeSpeaking, () {
      super.isFirstTimeSpeaking = value;
    });
  }

  late final _$isReadyToEnterPoolAtom = Atom(
      name:
          '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.isReadyToEnterPool',
      context: context);

  @override
  bool get isReadyToEnterPool {
    _$isReadyToEnterPoolAtom.reportRead();
    return super.isReadyToEnterPool;
  }

  @override
  set isReadyToEnterPool(bool value) {
    _$isReadyToEnterPoolAtom.reportWrite(value, super.isReadyToEnterPool, () {
      super.isReadyToEnterPool = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$audioButtonHoldStartCallbackAsyncAction = AsyncAction(
      '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.audioButtonHoldStartCallback',
      context: context);

  @override
  Future audioButtonHoldStartCallback() {
    return _$audioButtonHoldStartCallbackAsyncAction
        .run(() => super.audioButtonHoldStartCallback());
  }

  late final _$audioButtonHoldEndCallbackAsyncAction = AsyncAction(
      '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.audioButtonHoldEndCallback',
      context: context);

  @override
  Future audioButtonHoldEndCallback() {
    return _$audioButtonHoldEndCallbackAsyncAction
        .run(() => super.audioButtonHoldEndCallback());
  }

  late final _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController =
      ActionController(
          name: '_SpeakTheCollaboratorPhraseCoordinatorStoreBase',
          context: context);

  @override
  dynamic goBackToShore() {
    final _$actionInfo =
        _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
            .startAction(
                name:
                    '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.goBackToShore');
    try {
      return super.goBackToShore();
    } finally {
      _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic enterThePool() {
    final _$actionInfo =
        _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
            .startAction(
                name:
                    '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.enterThePool');
    try {
      return super.enterThePool();
    } finally {
      _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstTimeSpeaking: ${isFirstTimeSpeaking},
isReadyToEnterPool: ${isReadyToEnterPool}
    ''';
  }
}

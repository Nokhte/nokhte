// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speak_the_collaborator_phrase_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpeakTheCollaboratorPhraseCoordinatorStore
    on _SpeakTheCollaboratorPhraseCoordinatorStoreBase, Store {
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

  late final _$audioButtonHoldEndCallbackAsyncAction = AsyncAction(
      '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.audioButtonHoldEndCallback',
      context: context);

  @override
  Future audioButtonHoldEndCallback() {
    return _$audioButtonHoldEndCallbackAsyncAction
        .run(() => super.audioButtonHoldEndCallback());
  }

  late final _$screenConstructorCallbackAsyncAction = AsyncAction(
      '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.screenConstructorCallback',
      context: context);

  @override
  Future screenConstructorCallback(
      {required SpeakTheCollaboratorPhraseCoordinatorStore coordinatorStore}) {
    return _$screenConstructorCallbackAsyncAction.run(() =>
        super.screenConstructorCallback(coordinatorStore: coordinatorStore));
  }

  late final _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController =
      ActionController(
          name: '_SpeakTheCollaboratorPhraseCoordinatorStoreBase',
          context: context);

  @override
  dynamic audioButtonHoldStartCallback() {
    final _$actionInfo =
        _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
            .startAction(
                name:
                    '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.audioButtonHoldStartCallback');
    try {
      return super.audioButtonHoldStartCallback();
    } finally {
      _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic swipeDownCallback() {
    final _$actionInfo =
        _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
            .startAction(
                name:
                    '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.swipeDownCallback');
    try {
      return super.swipeDownCallback();
    } finally {
      _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic swipeUpCallback() {
    final _$actionInfo =
        _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
            .startAction(
                name:
                    '_SpeakTheCollaboratorPhraseCoordinatorStoreBase.swipeUpCallback');
    try {
      return super.swipeUpCallback();
    } finally {
      _$_SpeakTheCollaboratorPhraseCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isReadyToEnterPool: ${isReadyToEnterPool}
    ''';
  }
}

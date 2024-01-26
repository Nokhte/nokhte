// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collective_session_phase1_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollectiveSessionPhase1Coordinator
    on _CollectiveSessionPhase1CoordinatorBase, Store {
  Computed<bool>? _$hadAudioClipsForThePerspectiveComputed;

  @override
  bool get hadAudioClipsForThePerspective =>
      (_$hadAudioClipsForThePerspectiveComputed ??= Computed<bool>(
              () => super.hadAudioClipsForThePerspective,
              name:
                  '_CollectiveSessionPhase1CoordinatorBase.hadAudioClipsForThePerspective'))
          .value;
  Computed<String>? _$currentPerspectiveComputed;

  @override
  String get currentPerspective => (_$currentPerspectiveComputed ??=
          Computed<String>(() => super.currentPerspective,
              name:
                  '_CollectiveSessionPhase1CoordinatorBase.currentPerspective'))
      .value;

  late final _$isReadyToMoveToNextPartAtom = Atom(
      name: '_CollectiveSessionPhase1CoordinatorBase.isReadyToMoveToNextPart',
      context: context);

  @override
  bool get isReadyToMoveToNextPart {
    _$isReadyToMoveToNextPartAtom.reportRead();
    return super.isReadyToMoveToNextPart;
  }

  @override
  set isReadyToMoveToNextPart(bool value) {
    _$isReadyToMoveToNextPartAtom
        .reportWrite(value, super.isReadyToMoveToNextPart, () {
      super.isReadyToMoveToNextPart = value;
    });
  }

  late final _$chosenAudioIndexAtom = Atom(
      name: '_CollectiveSessionPhase1CoordinatorBase.chosenAudioIndex',
      context: context);

  @override
  int get chosenAudioIndex {
    _$chosenAudioIndexAtom.reportRead();
    return super.chosenAudioIndex;
  }

  @override
  set chosenAudioIndex(int value) {
    _$chosenAudioIndexAtom.reportWrite(value, super.chosenAudioIndex, () {
      super.chosenAudioIndex = value;
    });
  }

  late final _$onCompletedStreamAtom = Atom(
      name: '_CollectiveSessionPhase1CoordinatorBase.onCompletedStream',
      context: context);

  @override
  ObservableStream<dynamic> get onCompletedStream {
    _$onCompletedStreamAtom.reportRead();
    return super.onCompletedStream;
  }

  @override
  set onCompletedStream(ObservableStream<dynamic> value) {
    _$onCompletedStreamAtom.reportWrite(value, super.onCompletedStream, () {
      super.onCompletedStream = value;
    });
  }

  late final _$isPlayingAtom = Atom(
      name: '_CollectiveSessionPhase1CoordinatorBase.isPlaying',
      context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$screenTypeAtom = Atom(
      name: '_CollectiveSessionPhase1CoordinatorBase.screenType',
      context: context);

  @override
  CollectiveSessionPhase1ScreenTypes get screenType {
    _$screenTypeAtom.reportRead();
    return super.screenType;
  }

  @override
  set screenType(CollectiveSessionPhase1ScreenTypes value) {
    _$screenTypeAtom.reportWrite(value, super.screenType, () {
      super.screenType = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_CollectiveSessionPhase1CoordinatorBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$_CollectiveSessionPhase1CoordinatorBaseActionController =
      ActionController(
          name: '_CollectiveSessionPhase1CoordinatorBase', context: context);

  @override
  dynamic audioPlatformReset() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name: '_CollectiveSessionPhase1CoordinatorBase.audioPlatformReset');
    try {
      return super.audioPlatformReset();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic transitionToListeningMode() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.transitionToListeningMode');
    try {
      return super.transitionToListeningMode();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic transitionToPerspectivesMode() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.transitionToPerspectivesMode');
    try {
      return super.transitionToPerspectivesMode();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic audioPlatformIndexMarkup() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.audioPlatformIndexMarkup');
    try {
      return super.audioPlatformIndexMarkup();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic audioPlatformIndexMarkdown() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.audioPlatformIndexMarkdown');
    try {
      return super.audioPlatformIndexMarkdown();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic playAudio() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name: '_CollectiveSessionPhase1CoordinatorBase.playAudio');
    try {
      return super.playAudio();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic stopAudio() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name: '_CollectiveSessionPhase1CoordinatorBase.stopAudio');
    try {
      return super.stopAudio();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkIfTheyHaveListenedToAllTheClips() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.checkIfTheyHaveListenedToAllTheClips');
    try {
      return super.checkIfTheyHaveListenedToAllTheClips();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isReadyToMoveToNextPart: ${isReadyToMoveToNextPart},
chosenAudioIndex: ${chosenAudioIndex},
onCompletedStream: ${onCompletedStream},
isPlaying: ${isPlaying},
screenType: ${screenType},
hadAudioClipsForThePerspective: ${hadAudioClipsForThePerspective},
currentPerspective: ${currentPerspective}
    ''';
  }
}

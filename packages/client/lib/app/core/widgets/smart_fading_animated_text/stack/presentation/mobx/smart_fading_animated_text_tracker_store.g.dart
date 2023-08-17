// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_fading_animated_text_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SmartFadingAnimatedTextTrackerStore
    on _SmartFadingAnimatedTextTrackerStoreBase, Store {
  Computed<bool>? _$shouldPauseHereComputed;

  @override
  bool get shouldPauseHere =>
      (_$shouldPauseHereComputed ??= Computed<bool>(() => super.shouldPauseHere,
              name: '_SmartFadingAnimatedTextTrackerStoreBase.shouldPauseHere'))
          .value;
  Computed<Duration>? _$currentExtraDelayTimeComputed;

  @override
  Duration get currentExtraDelayTime => (_$currentExtraDelayTimeComputed ??=
          Computed<Duration>(() => super.currentExtraDelayTime,
              name:
                  '_SmartFadingAnimatedTextTrackerStoreBase.currentExtraDelayTime'))
      .value;
  Computed<Gestures>? _$currentUnlockGestureComputed;

  @override
  Gestures get currentUnlockGesture => (_$currentUnlockGestureComputed ??=
          Computed<Gestures>(() => super.currentUnlockGesture,
              name:
                  '_SmartFadingAnimatedTextTrackerStoreBase.currentUnlockGesture'))
      .value;
  Computed<String>? _$currentMainTextComputed;

  @override
  String get currentMainText => (_$currentMainTextComputed ??= Computed<String>(
          () => super.currentMainText,
          name: '_SmartFadingAnimatedTextTrackerStoreBase.currentMainText'))
      .value;
  Computed<String>? _$currentSubTextComputed;

  @override
  String get currentSubText =>
      (_$currentSubTextComputed ??= Computed<String>(() => super.currentSubText,
              name: '_SmartFadingAnimatedTextTrackerStoreBase.currentSubText'))
          .value;

  late final _$showTextAtom = Atom(
      name: '_SmartFadingAnimatedTextTrackerStoreBase.showText',
      context: context);

  @override
  bool get showText {
    _$showTextAtom.reportRead();
    return super.showText;
  }

  @override
  set showText(bool value) {
    _$showTextAtom.reportWrite(value, super.showText, () {
      super.showText = value;
    });
  }

  late final _$isPausedAtom = Atom(
      name: '_SmartFadingAnimatedTextTrackerStoreBase.isPaused',
      context: context);

  @override
  bool get isPaused {
    _$isPausedAtom.reportRead();
    return super.isPaused;
  }

  @override
  set isPaused(bool value) {
    _$isPausedAtom.reportWrite(value, super.isPaused, () {
      super.isPaused = value;
    });
  }

  late final _$hasJustBeenUnPausedAtom = Atom(
      name: '_SmartFadingAnimatedTextTrackerStoreBase.hasJustBeenUnPaused',
      context: context);

  @override
  bool get hasJustBeenUnPaused {
    _$hasJustBeenUnPausedAtom.reportRead();
    return super.hasJustBeenUnPaused;
  }

  @override
  set hasJustBeenUnPaused(bool value) {
    _$hasJustBeenUnPausedAtom.reportWrite(value, super.hasJustBeenUnPaused, () {
      super.hasJustBeenUnPaused = value;
    });
  }

  late final _$inProgressAtom = Atom(
      name: '_SmartFadingAnimatedTextTrackerStoreBase.inProgress',
      context: context);

  @override
  bool get inProgress {
    _$inProgressAtom.reportRead();
    return super.inProgress;
  }

  @override
  set inProgress(bool value) {
    _$inProgressAtom.reportWrite(value, super.inProgress, () {
      super.inProgress = value;
    });
  }

  late final _$statusAtom = Atom(
      name: '_SmartFadingAnimatedTextTrackerStoreBase.status',
      context: context);

  @override
  FadingTextStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(FadingTextStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$currentIndexAtom = Atom(
      name: '_SmartFadingAnimatedTextTrackerStoreBase.currentIndex',
      context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$startRotatingTextAsyncAction = AsyncAction(
      '_SmartFadingAnimatedTextTrackerStoreBase.startRotatingText',
      context: context);

  @override
  Future startRotatingText() {
    return _$startRotatingTextAsyncAction.run(() => super.startRotatingText());
  }

  late final _$_SmartFadingAnimatedTextTrackerStoreBaseActionController =
      ActionController(
          name: '_SmartFadingAnimatedTextTrackerStoreBase', context: context);

  @override
  dynamic togglePause({required Gestures gestureType}) {
    final _$actionInfo =
        _$_SmartFadingAnimatedTextTrackerStoreBaseActionController.startAction(
            name: '_SmartFadingAnimatedTextTrackerStoreBase.togglePause');
    try {
      return super.togglePause(gestureType: gestureType);
    } finally {
      _$_SmartFadingAnimatedTextTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void moveToNextMessage() {
    final _$actionInfo =
        _$_SmartFadingAnimatedTextTrackerStoreBaseActionController.startAction(
            name: '_SmartFadingAnimatedTextTrackerStoreBase.moveToNextMessage');
    try {
      return super.moveToNextMessage();
    } finally {
      _$_SmartFadingAnimatedTextTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showText: ${showText},
isPaused: ${isPaused},
hasJustBeenUnPaused: ${hasJustBeenUnPaused},
inProgress: ${inProgress},
status: ${status},
currentIndex: ${currentIndex},
shouldPauseHere: ${shouldPauseHere},
currentExtraDelayTime: ${currentExtraDelayTime},
currentUnlockGesture: ${currentUnlockGesture},
currentMainText: ${currentMainText},
currentSubText: ${currentSubText}
    ''';
  }
}

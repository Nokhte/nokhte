// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SmartTextStore on _SmartTextStoreBase, Store {
  Computed<bool>? _$shouldPauseHereComputed;

  @override
  bool get shouldPauseHere =>
      (_$shouldPauseHereComputed ??= Computed<bool>(() => super.shouldPauseHere,
              name: '_SmartTextStoreBase.shouldPauseHere'))
          .value;
  Computed<double>? _$currentMainMessageFontComputed;

  @override
  double get currentMainMessageFont => (_$currentMainMessageFontComputed ??=
          Computed<double>(() => super.currentMainMessageFont,
              name: '_SmartTextStoreBase.currentMainMessageFont'))
      .value;
  Computed<double>? _$currentSubMessageFontComputed;

  @override
  double get currentSubMessageFont => (_$currentSubMessageFontComputed ??=
          Computed<double>(() => super.currentSubMessageFont,
              name: '_SmartTextStoreBase.currentSubMessageFont'))
      .value;
  Computed<Duration>? _$currentExtraDelayTimeComputed;

  @override
  Duration get currentExtraDelayTime => (_$currentExtraDelayTimeComputed ??=
          Computed<Duration>(() => super.currentExtraDelayTime,
              name: '_SmartTextStoreBase.currentExtraDelayTime'))
      .value;
  Computed<Gestures>? _$currentUnlockGestureComputed;

  @override
  Gestures get currentUnlockGesture => (_$currentUnlockGestureComputed ??=
          Computed<Gestures>(() => super.currentUnlockGesture,
              name: '_SmartTextStoreBase.currentUnlockGesture'))
      .value;

  late final _$messagesDataAtom =
      Atom(name: '_SmartTextStoreBase.messagesData', context: context);

  @override
  ObservableList<RotatingTextData> get messagesData {
    _$messagesDataAtom.reportRead();
    return super.messagesData;
  }

  @override
  set messagesData(ObservableList<RotatingTextData> value) {
    _$messagesDataAtom.reportWrite(value, super.messagesData, () {
      super.messagesData = value;
    });
  }

  late final _$firstTimeAtom =
      Atom(name: '_SmartTextStoreBase.firstTime', context: context);

  @override
  bool get firstTime {
    _$firstTimeAtom.reportRead();
    return super.firstTime;
  }

  @override
  set firstTime(bool value) {
    _$firstTimeAtom.reportWrite(value, super.firstTime, () {
      super.firstTime = value;
    });
  }

  late final _$isInfiniteAtom =
      Atom(name: '_SmartTextStoreBase.isInfinite', context: context);

  @override
  bool get isInfinite {
    _$isInfiniteAtom.reportRead();
    return super.isInfinite;
  }

  @override
  set isInfinite(bool value) {
    _$isInfiniteAtom.reportWrite(value, super.isInfinite, () {
      super.isInfinite = value;
    });
  }

  late final _$showTextAtom =
      Atom(name: '_SmartTextStoreBase.showText', context: context);

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

  late final _$isPausedAtom =
      Atom(name: '_SmartTextStoreBase.isPaused', context: context);

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

  late final _$hasJustBeenUnPausedAtom =
      Atom(name: '_SmartTextStoreBase.hasJustBeenUnPaused', context: context);

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

  late final _$inProgressAtom =
      Atom(name: '_SmartTextStoreBase.inProgress', context: context);

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

  late final _$currentIndexAtom =
      Atom(name: '_SmartTextStoreBase.currentIndex', context: context);

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

  late final _$currentSubTextAtom =
      Atom(name: '_SmartTextStoreBase.currentSubText', context: context);

  @override
  String get currentSubText {
    _$currentSubTextAtom.reportRead();
    return super.currentSubText;
  }

  @override
  set currentSubText(String value) {
    _$currentSubTextAtom.reportWrite(value, super.currentSubText, () {
      super.currentSubText = value;
    });
  }

  late final _$currentMainTextAtom =
      Atom(name: '_SmartTextStoreBase.currentMainText', context: context);

  @override
  String get currentMainText {
    _$currentMainTextAtom.reportRead();
    return super.currentMainText;
  }

  @override
  set currentMainText(String value) {
    _$currentMainTextAtom.reportWrite(value, super.currentMainText, () {
      super.currentMainText = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_SmartTextStoreBase.status', context: context);

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

  late final _$resetToDefaultAsyncAction =
      AsyncAction('_SmartTextStoreBase.resetToDefault', context: context);

  @override
  Future resetToDefault() {
    return _$resetToDefaultAsyncAction.run(() => super.resetToDefault());
  }

  late final _$copyToClipboardAsyncAction =
      AsyncAction('_SmartTextStoreBase.copyToClipboard', context: context);

  @override
  Future copyToClipboard() {
    return _$copyToClipboardAsyncAction.run(() => super.copyToClipboard());
  }

  late final _$triggerRotatingTextAsyncAction =
      AsyncAction('_SmartTextStoreBase.triggerRotatingText', context: context);

  @override
  Future triggerRotatingText() {
    return _$triggerRotatingTextAsyncAction
        .run(() => super.triggerRotatingText());
  }

  late final _$togglePauseAsyncAction =
      AsyncAction('_SmartTextStoreBase.togglePause', context: context);

  @override
  Future togglePause({Gestures gestureType = Gestures.none}) {
    return _$togglePauseAsyncAction
        .run(() => super.togglePause(gestureType: gestureType));
  }

  late final _$_SmartTextStoreBaseActionController =
      ActionController(name: '_SmartTextStoreBase', context: context);

  @override
  dynamic setMessagesData(List<RotatingTextData> newList) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.setMessagesData');
    try {
      return super.setMessagesData(newList);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fadeTheTextOut() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.fadeTheTextOut');
    try {
      return super.fadeTheTextOut();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fadeTheTextIn() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.fadeTheTextIn');
    try {
      return super.fadeTheTextIn();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrrentSubMessage({required String message}) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.changeCurrrentSubMessage');
    try {
      return super.changeCurrrentSubMessage(message: message);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFutureSubMessage(
      {required int amountOfMessagesForward, required String message}) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.changeFutureSubMessage');
    try {
      return super.changeFutureSubMessage(
          amountOfMessagesForward: amountOfMessagesForward, message: message);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFutureMainMessage(
      {required int amountOfMessagesForward, required String message}) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.changeFutureMainMessage');
    try {
      return super.changeFutureMainMessage(
          amountOfMessagesForward: amountOfMessagesForward, message: message);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startRotatingText(Duration fadeInDelay) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.startRotatingText');
    try {
      return super.startRotatingText(fadeInDelay);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMainMessage({required int index, required String thePhrase}) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.setMainMessage');
    try {
      return super.setMainMessage(index: index, thePhrase: thePhrase);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void moveToNextMessage() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.moveToNextMessage');
    try {
      return super.moveToNextMessage();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messagesData: ${messagesData},
firstTime: ${firstTime},
isInfinite: ${isInfinite},
showText: ${showText},
isPaused: ${isPaused},
hasJustBeenUnPaused: ${hasJustBeenUnPaused},
inProgress: ${inProgress},
currentIndex: ${currentIndex},
currentSubText: ${currentSubText},
currentMainText: ${currentMainText},
status: ${status},
shouldPauseHere: ${shouldPauseHere},
currentMainMessageFont: ${currentMainMessageFont},
currentSubMessageFont: ${currentSubMessageFont},
currentExtraDelayTime: ${currentExtraDelayTime},
currentUnlockGesture: ${currentUnlockGesture}
    ''';
  }
}

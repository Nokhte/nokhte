// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SmartTextStore on _SmartTextStoreBase, Store {
  Computed<String>? _$currentSubTextComputed;

  @override
  String get currentSubText =>
      (_$currentSubTextComputed ??= Computed<String>(() => super.currentSubText,
              name: '_SmartTextStoreBase.currentSubText'))
          .value;
  Computed<String>? _$currentMainTextComputed;

  @override
  String get currentMainText => (_$currentMainTextComputed ??= Computed<String>(
          () => super.currentMainText,
          name: '_SmartTextStoreBase.currentMainText'))
      .value;
  Computed<bool>? _$currentShouldPauseHereComputed;

  @override
  bool get currentShouldPauseHere => (_$currentShouldPauseHereComputed ??=
          Computed<bool>(() => super.currentShouldPauseHere,
              name: '_SmartTextStoreBase.currentShouldPauseHere'))
      .value;
  Computed<double>? _$currentMainTextFontSizeComputed;

  @override
  double get currentMainTextFontSize => (_$currentMainTextFontSizeComputed ??=
          Computed<double>(() => super.currentMainTextFontSize,
              name: '_SmartTextStoreBase.currentMainTextFontSize'))
      .value;
  Computed<double>? _$currentSubTextFontSizeComputed;

  @override
  double get currentSubTextFontSize => (_$currentSubTextFontSizeComputed ??=
          Computed<double>(() => super.currentSubTextFontSize,
              name: '_SmartTextStoreBase.currentSubTextFontSize'))
      .value;
  Computed<Duration>? _$currentInitialFadeInDelayComputed;

  @override
  Duration get currentInitialFadeInDelay =>
      (_$currentInitialFadeInDelayComputed ??= Computed<Duration>(
              () => super.currentInitialFadeInDelay,
              name: '_SmartTextStoreBase.currentInitialFadeInDelay'))
          .value;
  Computed<Duration>? _$currentOnScreenTimeComputed;

  @override
  Duration get currentOnScreenTime => (_$currentOnScreenTimeComputed ??=
          Computed<Duration>(() => super.currentOnScreenTime,
              name: '_SmartTextStoreBase.currentOnScreenTime'))
      .value;
  Computed<Gestures>? _$currentUnlockGestureComputed;

  @override
  Gestures get currentUnlockGesture => (_$currentUnlockGestureComputed ??=
          Computed<Gestures>(() => super.currentUnlockGesture,
              name: '_SmartTextStoreBase.currentUnlockGesture'))
      .value;

  late final _$altMovieAtom =
      Atom(name: '_SmartTextStoreBase.altMovie', context: context);

  @override
  MovieTween get altMovie {
    _$altMovieAtom.reportRead();
    return super.altMovie;
  }

  @override
  set altMovie(MovieTween value) {
    _$altMovieAtom.reportWrite(value, super.altMovie, () {
      super.altMovie = value;
    });
  }

  late final _$altControlAtom =
      Atom(name: '_SmartTextStoreBase.altControl', context: context);

  @override
  Control get altControl {
    _$altControlAtom.reportRead();
    return super.altControl;
  }

  @override
  set altControl(Control value) {
    _$altControlAtom.reportWrite(value, super.altControl, () {
      super.altControl = value;
    });
  }

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

  late final _$disablePausingAtom =
      Atom(name: '_SmartTextStoreBase.disablePausing', context: context);

  @override
  bool get disablePausing {
    _$disablePausingAtom.reportRead();
    return super.disablePausing;
  }

  @override
  set disablePausing(bool value) {
    _$disablePausingAtom.reportWrite(value, super.disablePausing, () {
      super.disablePausing = value;
    });
  }

  late final _$_SmartTextStoreBaseActionController =
      ActionController(name: '_SmartTextStoreBase', context: context);

  @override
  dynamic setAltMovie(Duration timerLength) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.setAltMovie');
    try {
      return super.setAltMovie(timerLength);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAltControl(Control newControl) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.setAltControl');
    try {
      return super.setAltControl(newControl);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDisablePausing(bool newDisablePausing) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.setDisablePausing');
    try {
      return super.setDisablePausing(newDisablePausing);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentIndex(dynamic newIndex) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(newIndex);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic reset() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startRotatingText({bool isResuming = false}) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.startRotatingText');
    try {
      return super.startRotatingText(isResuming: isResuming);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pause() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.pause');
    try {
      return super.pause();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resume() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.resume');
    try {
      return super.resume();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onOpacityTransitionComplete() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.onOpacityTransitionComplete');
    try {
      return super.onOpacityTransitionComplete();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
altMovie: ${altMovie},
altControl: ${altControl},
messagesData: ${messagesData},
currentIndex: ${currentIndex},
isPaused: ${isPaused},
disablePausing: ${disablePausing},
currentSubText: ${currentSubText},
currentMainText: ${currentMainText},
currentShouldPauseHere: ${currentShouldPauseHere},
currentMainTextFontSize: ${currentMainTextFontSize},
currentSubTextFontSize: ${currentSubTextFontSize},
currentInitialFadeInDelay: ${currentInitialFadeInDelay},
currentOnScreenTime: ${currentOnScreenTime},
currentUnlockGesture: ${currentUnlockGesture}
    ''';
  }
}

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

  late final _$showWidgetAtom =
      Atom(name: '_SmartTextStoreBase.showWidget', context: context);

  @override
  bool get showWidget {
    _$showWidgetAtom.reportRead();
    return super.showWidget;
  }

  @override
  set showWidget(bool value) {
    _$showWidgetAtom.reportWrite(value, super.showWidget, () {
      super.showWidget = value;
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

  late final _$opacityCounterAtom =
      Atom(name: '_SmartTextStoreBase.opacityCounter', context: context);

  @override
  int get opacityCounter {
    _$opacityCounterAtom.reportRead();
    return super.opacityCounter;
  }

  @override
  set opacityCounter(int value) {
    _$opacityCounterAtom.reportWrite(value, super.opacityCounter, () {
      super.opacityCounter = value;
    });
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
  dynamic toggleWidgetVisibility() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.toggleWidgetVisibility');
    try {
      return super.toggleWidgetVisibility();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startRotatingText() {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.startRotatingText');
    try {
      return super.startRotatingText();
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onOpacityTransitionComplete(bool widgetIsVisible) {
    final _$actionInfo = _$_SmartTextStoreBaseActionController.startAction(
        name: '_SmartTextStoreBase.onOpacityTransitionComplete');
    try {
      return super.onOpacityTransitionComplete(widgetIsVisible);
    } finally {
      _$_SmartTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messagesData: ${messagesData},
showWidget: ${showWidget},
currentIndex: ${currentIndex},
opacityCounter: ${opacityCounter},
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

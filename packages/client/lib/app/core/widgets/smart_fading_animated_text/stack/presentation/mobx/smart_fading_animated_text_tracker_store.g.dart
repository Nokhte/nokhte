// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_fading_animated_text_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SmartFadingAnimatedTextTrackerStore
    on _SmartFadingAnimatedTextTrackerStoreBase, Store {
  Computed<String>? _$currentTextComputed;

  @override
  String get currentText =>
      (_$currentTextComputed ??= Computed<String>(() => super.currentText,
              name: '_SmartFadingAnimatedTextTrackerStoreBase.currentText'))
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
  Future startRotatingText(bool mounted) {
    return _$startRotatingTextAsyncAction
        .run(() => super.startRotatingText(mounted));
  }

  late final _$_SmartFadingAnimatedTextTrackerStoreBaseActionController =
      ActionController(
          name: '_SmartFadingAnimatedTextTrackerStoreBase', context: context);

  @override
  dynamic togglePause(bool mounted) {
    final _$actionInfo =
        _$_SmartFadingAnimatedTextTrackerStoreBaseActionController.startAction(
            name: '_SmartFadingAnimatedTextTrackerStoreBase.togglePause');
    try {
      return super.togglePause(mounted);
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
currentIndex: ${currentIndex},
currentText: ${currentText}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesh_circle_button_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MeshCircleButtonStore on _MeshCircleButtonStoreBase, Store {
  Computed<double>? _$enabledOpacityComputed;

  @override
  double get enabledOpacity =>
      (_$enabledOpacityComputed ??= Computed<double>(() => super.enabledOpacity,
              name: '_MeshCircleButtonStoreBase.enabledOpacity'))
          .value;
  Computed<double>? _$opacityComputed;

  @override
  double get opacity =>
      (_$opacityComputed ??= Computed<double>(() => super.opacity,
              name: '_MeshCircleButtonStoreBase.opacity'))
          .value;

  late final _$isEnabledAtom =
      Atom(name: '_MeshCircleButtonStoreBase.isEnabled', context: context);

  @override
  bool get isEnabled {
    _$isEnabledAtom.reportRead();
    return super.isEnabled;
  }

  @override
  set isEnabled(bool value) {
    _$isEnabledAtom.reportWrite(value, super.isEnabled, () {
      super.isEnabled = value;
    });
  }

  late final _$currentXTranslateAtom = Atom(
      name: '_MeshCircleButtonStoreBase.currentXTranslate', context: context);

  @override
  double get currentXTranslate {
    _$currentXTranslateAtom.reportRead();
    return super.currentXTranslate;
  }

  @override
  set currentXTranslate(double value) {
    _$currentXTranslateAtom.reportWrite(value, super.currentXTranslate, () {
      super.currentXTranslate = value;
    });
  }

  late final _$currentYTranslateAtom = Atom(
      name: '_MeshCircleButtonStoreBase.currentYTranslate', context: context);

  @override
  double get currentYTranslate {
    _$currentYTranslateAtom.reportRead();
    return super.currentYTranslate;
  }

  @override
  set currentYTranslate(double value) {
    _$currentYTranslateAtom.reportWrite(value, super.currentYTranslate, () {
      super.currentYTranslate = value;
    });
  }

  late final _$currentXScaleAtom =
      Atom(name: '_MeshCircleButtonStoreBase.currentXScale', context: context);

  @override
  double get currentXScale {
    _$currentXScaleAtom.reportRead();
    return super.currentXScale;
  }

  @override
  set currentXScale(double value) {
    _$currentXScaleAtom.reportWrite(value, super.currentXScale, () {
      super.currentXScale = value;
    });
  }

  late final _$currentYScaleAtom =
      Atom(name: '_MeshCircleButtonStoreBase.currentYScale', context: context);

  @override
  double get currentYScale {
    _$currentYScaleAtom.reportRead();
    return super.currentYScale;
  }

  @override
  set currentYScale(double value) {
    _$currentYScaleAtom.reportWrite(value, super.currentYScale, () {
      super.currentYScale = value;
    });
  }

  late final _$isAnimatingAtom =
      Atom(name: '_MeshCircleButtonStoreBase.isAnimating', context: context);

  @override
  bool get isAnimating {
    _$isAnimatingAtom.reportRead();
    return super.isAnimating;
  }

  @override
  set isAnimating(bool value) {
    _$isAnimatingAtom.reportWrite(value, super.isAnimating, () {
      super.isAnimating = value;
    });
  }

  late final _$currentGlowColorAtom = Atom(
      name: '_MeshCircleButtonStoreBase.currentGlowColor', context: context);

  @override
  Color get currentGlowColor {
    _$currentGlowColorAtom.reportRead();
    return super.currentGlowColor;
  }

  @override
  set currentGlowColor(Color value) {
    _$currentGlowColorAtom.reportWrite(value, super.currentGlowColor, () {
      super.currentGlowColor = value;
    });
  }

  late final _$_MeshCircleButtonStoreBaseActionController =
      ActionController(name: '_MeshCircleButtonStoreBase', context: context);

  @override
  dynamic toggleIsEnabled() {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.toggleIsEnabled');
    try {
      return super.toggleIsEnabled();
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentGlowColor(Color newColor) {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.setCurrentGlowColor');
    try {
      return super.setCurrentGlowColor(newColor);
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentMatrixValues(
      {required double newXTranslate,
      required double newYTranslate,
      required double newXScale,
      required double newYScale}) {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.setCurrentMatrixValues');
    try {
      return super.setCurrentMatrixValues(
          newXTranslate: newXTranslate,
          newYTranslate: newYTranslate,
          newXScale: newXScale,
          newYScale: newYScale);
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initGlowDown() {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.initGlowDown');
    try {
      return super.initGlowDown();
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initGlowUp() {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.initGlowUp');
    try {
      return super.initGlowUp();
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleColorAnimation() {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.toggleColorAnimation');
    try {
      return super.toggleColorAnimation();
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEnabled: ${isEnabled},
currentXTranslate: ${currentXTranslate},
currentYTranslate: ${currentYTranslate},
currentXScale: ${currentXScale},
currentYScale: ${currentYScale},
isAnimating: ${isAnimating},
currentGlowColor: ${currentGlowColor},
enabledOpacity: ${enabledOpacity},
opacity: ${opacity}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_glow_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BorderGlowStore on _BorderGlowStoreBase, Store {
  late final _$currentColorAtom =
      Atom(name: '_BorderGlowStoreBase.currentColor', context: context);

  @override
  Color get currentColor {
    _$currentColorAtom.reportRead();
    return super.currentColor;
  }

  @override
  set currentColor(Color value) {
    _$currentColorAtom.reportWrite(value, super.currentColor, () {
      super.currentColor = value;
    });
  }

  late final _$currentWidthAtom =
      Atom(name: '_BorderGlowStoreBase.currentWidth', context: context);

  @override
  double get currentWidth {
    _$currentWidthAtom.reportRead();
    return super.currentWidth;
  }

  @override
  set currentWidth(double value) {
    _$currentWidthAtom.reportWrite(value, super.currentWidth, () {
      super.currentWidth = value;
    });
  }

  late final _$currentBlurAtom =
      Atom(name: '_BorderGlowStoreBase.currentBlur', context: context);

  @override
  double get currentBlur {
    _$currentBlurAtom.reportRead();
    return super.currentBlur;
  }

  @override
  set currentBlur(double value) {
    _$currentBlurAtom.reportWrite(value, super.currentBlur, () {
      super.currentBlur = value;
    });
  }

  late final _$_BorderGlowStoreBaseActionController =
      ActionController(name: '_BorderGlowStoreBase', context: context);

  @override
  dynamic initMovie(NoParams param) {
    final _$actionInfo = _$_BorderGlowStoreBaseActionController.startAction(
        name: '_BorderGlowStoreBase.initMovie');
    try {
      return super.initMovie(param);
    } finally {
      _$_BorderGlowStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initGlowDown() {
    final _$actionInfo = _$_BorderGlowStoreBaseActionController.startAction(
        name: '_BorderGlowStoreBase.initGlowDown');
    try {
      return super.initGlowDown();
    } finally {
      _$_BorderGlowStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAnimationValues(
      {required Color color, required double width, required double blur}) {
    final _$actionInfo = _$_BorderGlowStoreBaseActionController.startAction(
        name: '_BorderGlowStoreBase.setAnimationValues');
    try {
      return super.setAnimationValues(color: color, width: width, blur: blur);
    } finally {
      _$_BorderGlowStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentColor: ${currentColor},
currentWidth: ${currentWidth},
currentBlur: ${currentBlur}
    ''';
  }
}

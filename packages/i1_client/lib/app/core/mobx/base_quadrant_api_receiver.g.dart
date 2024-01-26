// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_quadrant_api_receiver.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseQuadrantAPIReceiver on _BaseQuadrantAPIReceiverBase, Store {
  Computed<bool>? _$isFirstTimeComputed;

  @override
  bool get isFirstTime =>
      (_$isFirstTimeComputed ??= Computed<bool>(() => super.isFirstTime,
              name: '_BaseQuadrantAPIReceiverBase.isFirstTime'))
          .value;
  Computed<bool>? _$isSecondTimeComputed;

  @override
  bool get isSecondTime =>
      (_$isSecondTimeComputed ??= Computed<bool>(() => super.isSecondTime,
              name: '_BaseQuadrantAPIReceiverBase.isSecondTime'))
          .value;

  late final _$chosenIndexAtom =
      Atom(name: '_BaseQuadrantAPIReceiverBase.chosenIndex', context: context);

  @override
  int get chosenIndex {
    _$chosenIndexAtom.reportRead();
    return super.chosenIndex;
  }

  @override
  set chosenIndex(int value) {
    _$chosenIndexAtom.reportWrite(value, super.chosenIndex, () {
      super.chosenIndex = value;
    });
  }

  late final _$firstValueAtom =
      Atom(name: '_BaseQuadrantAPIReceiverBase.firstValue', context: context);

  @override
  int get firstValue {
    _$firstValueAtom.reportRead();
    return super.firstValue;
  }

  @override
  set firstValue(int value) {
    _$firstValueAtom.reportWrite(value, super.firstValue, () {
      super.firstValue = value;
    });
  }

  late final _$secondValueAtom =
      Atom(name: '_BaseQuadrantAPIReceiverBase.secondValue', context: context);

  @override
  int get secondValue {
    _$secondValueAtom.reportRead();
    return super.secondValue;
  }

  @override
  set secondValue(int value) {
    _$secondValueAtom.reportWrite(value, super.secondValue, () {
      super.secondValue = value;
    });
  }

  late final _$previousValueAtom = Atom(
      name: '_BaseQuadrantAPIReceiverBase.previousValue', context: context);

  @override
  int get previousValue {
    _$previousValueAtom.reportRead();
    return super.previousValue;
  }

  @override
  set previousValue(int value) {
    _$previousValueAtom.reportWrite(value, super.previousValue, () {
      super.previousValue = value;
    });
  }

  late final _$_BaseQuadrantAPIReceiverBaseActionController =
      ActionController(name: '_BaseQuadrantAPIReceiverBase', context: context);

  @override
  dynamic setChosenIndex(int newInt) {
    final _$actionInfo = _$_BaseQuadrantAPIReceiverBaseActionController
        .startAction(name: '_BaseQuadrantAPIReceiverBase.setChosenIndex');
    try {
      return super.setChosenIndex(newInt);
    } finally {
      _$_BaseQuadrantAPIReceiverBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic valueTrackingSetup(int p0) {
    final _$actionInfo = _$_BaseQuadrantAPIReceiverBaseActionController
        .startAction(name: '_BaseQuadrantAPIReceiverBase.valueTrackingSetup');
    try {
      return super.valueTrackingSetup(p0);
    } finally {
      _$_BaseQuadrantAPIReceiverBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chosenIndex: ${chosenIndex},
firstValue: ${firstValue},
secondValue: ${secondValue},
previousValue: ${previousValue},
isFirstTime: ${isFirstTime},
isSecondTime: ${isSecondTime}
    ''';
  }
}

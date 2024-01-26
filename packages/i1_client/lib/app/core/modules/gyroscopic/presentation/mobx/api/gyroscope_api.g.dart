// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gyroscope_api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GyroscopeAPI on _GyroscopeAPIBase, Store {
  Computed<bool>? _$isFirstTimeComputed;

  @override
  bool get isFirstTime =>
      (_$isFirstTimeComputed ??= Computed<bool>(() => super.isFirstTime,
              name: '_GyroscopeAPIBase.isFirstTime'))
          .value;
  Computed<bool>? _$isSecondTimeComputed;

  @override
  bool get isSecondTime =>
      (_$isSecondTimeComputed ??= Computed<bool>(() => super.isSecondTime,
              name: '_GyroscopeAPIBase.isSecondTime'))
          .value;

  late final _$firstValueAtom =
      Atom(name: '_GyroscopeAPIBase.firstValue', context: context);

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
      Atom(name: '_GyroscopeAPIBase.secondValue', context: context);

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

  late final _$currentModeAtom =
      Atom(name: '_GyroscopeAPIBase.currentMode', context: context);

  @override
  GyroscopeModes get currentMode {
    _$currentModeAtom.reportRead();
    return super.currentMode;
  }

  @override
  set currentMode(GyroscopeModes value) {
    _$currentModeAtom.reportWrite(value, super.currentMode, () {
      super.currentMode = value;
    });
  }

  late final _$_GyroscopeAPIBaseActionController =
      ActionController(name: '_GyroscopeAPIBase', context: context);

  @override
  dynamic valueTrackingSetup(int value) {
    final _$actionInfo = _$_GyroscopeAPIBaseActionController.startAction(
        name: '_GyroscopeAPIBase.valueTrackingSetup');
    try {
      return super.valueTrackingSetup(value);
    } finally {
      _$_GyroscopeAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstValue: ${firstValue},
secondValue: ${secondValue},
currentMode: ${currentMode},
isFirstTime: ${isFirstTime},
isSecondTime: ${isSecondTime}
    ''';
  }
}

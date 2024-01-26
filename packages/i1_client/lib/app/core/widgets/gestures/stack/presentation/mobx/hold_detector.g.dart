// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hold_detector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HoldDetector on _HoldDetector, Store {
  late final _$holdCountAtom =
      Atom(name: '_HoldDetector.holdCount', context: context);

  @override
  int get holdCount {
    _$holdCountAtom.reportRead();
    return super.holdCount;
  }

  @override
  set holdCount(int value) {
    _$holdCountAtom.reportWrite(value, super.holdCount, () {
      super.holdCount = value;
    });
  }

  late final _$letGoCountAtom =
      Atom(name: '_HoldDetector.letGoCount', context: context);

  @override
  int get letGoCount {
    _$letGoCountAtom.reportRead();
    return super.letGoCount;
  }

  @override
  set letGoCount(int value) {
    _$letGoCountAtom.reportWrite(value, super.letGoCount, () {
      super.letGoCount = value;
    });
  }

  late final _$_HoldDetectorActionController =
      ActionController(name: '_HoldDetector', context: context);

  @override
  dynamic onHold() {
    final _$actionInfo = _$_HoldDetectorActionController.startAction(
        name: '_HoldDetector.onHold');
    try {
      return super.onHold();
    } finally {
      _$_HoldDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
holdCount: ${holdCount},
letGoCount: ${letGoCount}
    ''';
  }
}

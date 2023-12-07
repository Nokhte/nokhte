// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tap_detector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TapDetector on _TapDetector, Store {
  late final _$tapCountAtom =
      Atom(name: '_TapDetector.tapCount', context: context);

  @override
  int get tapCount {
    _$tapCountAtom.reportRead();
    return super.tapCount;
  }

  @override
  set tapCount(int value) {
    _$tapCountAtom.reportWrite(value, super.tapCount, () {
      super.tapCount = value;
    });
  }

  late final _$currentTapPositionAtom =
      Atom(name: '_TapDetector.currentTapPosition', context: context);

  @override
  Offset get currentTapPosition {
    _$currentTapPositionAtom.reportRead();
    return super.currentTapPosition;
  }

  @override
  set currentTapPosition(Offset value) {
    _$currentTapPositionAtom.reportWrite(value, super.currentTapPosition, () {
      super.currentTapPosition = value;
    });
  }

  late final _$_TapDetectorActionController =
      ActionController(name: '_TapDetector', context: context);

  @override
  dynamic onTapDown(Offset newOffset) {
    final _$actionInfo = _$_TapDetectorActionController.startAction(
        name: '_TapDetector.onTapDown');
    try {
      return super.onTapDown(newOffset);
    } finally {
      _$_TapDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onTap() {
    final _$actionInfo =
        _$_TapDetectorActionController.startAction(name: '_TapDetector.onTap');
    try {
      return super.onTap();
    } finally {
      _$_TapDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tapCount: ${tapCount},
currentTapPosition: ${currentTapPosition}
    ''';
  }
}

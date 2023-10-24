// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PortalAPI on _PortalAPIBase, Store {
  late final _$drawingModeAtom =
      Atom(name: '_PortalAPIBase.drawingMode', context: context);

  @override
  DrawingModes get drawingMode {
    _$drawingModeAtom.reportRead();
    return super.drawingMode;
  }

  @override
  set drawingMode(DrawingModes value) {
    _$drawingModeAtom.reportWrite(value, super.drawingMode, () {
      super.drawingMode = value;
    });
  }

  late final _$lowerThresholdBoundAtom =
      Atom(name: '_PortalAPIBase.lowerThresholdBound', context: context);

  @override
  int get lowerThresholdBound {
    _$lowerThresholdBoundAtom.reportRead();
    return super.lowerThresholdBound;
  }

  @override
  set lowerThresholdBound(int value) {
    _$lowerThresholdBoundAtom.reportWrite(value, super.lowerThresholdBound, () {
      super.lowerThresholdBound = value;
    });
  }

  late final _$upperThresholdBoundAtom =
      Atom(name: '_PortalAPIBase.upperThresholdBound', context: context);

  @override
  int get upperThresholdBound {
    _$upperThresholdBoundAtom.reportRead();
    return super.upperThresholdBound;
  }

  @override
  set upperThresholdBound(int value) {
    _$upperThresholdBoundAtom.reportWrite(value, super.upperThresholdBound, () {
      super.upperThresholdBound = value;
    });
  }

  late final _$_PortalAPIBaseActionController =
      ActionController(name: '_PortalAPIBase', context: context);

  @override
  dynamic negativeAndRegularModeWatcher(int value) {
    final _$actionInfo = _$_PortalAPIBaseActionController.startAction(
        name: '_PortalAPIBase.negativeAndRegularModeWatcher');
    try {
      return super.negativeAndRegularModeWatcher(value);
    } finally {
      _$_PortalAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLowerThresholdBound(int value) {
    final _$actionInfo = _$_PortalAPIBaseActionController.startAction(
        name: '_PortalAPIBase.setLowerThresholdBound');
    try {
      return super.setLowerThresholdBound(value);
    } finally {
      _$_PortalAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUpperThresholdBound(int value) {
    final _$actionInfo = _$_PortalAPIBaseActionController.startAction(
        name: '_PortalAPIBase.setUpperThresholdBound');
    try {
      return super.setUpperThresholdBound(value);
    } finally {
      _$_PortalAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
drawingMode: ${drawingMode},
lowerThresholdBound: ${lowerThresholdBound},
upperThresholdBound: ${upperThresholdBound}
    ''';
  }
}

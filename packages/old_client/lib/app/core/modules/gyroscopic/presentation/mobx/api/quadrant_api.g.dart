// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quadrant_api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuadrantAPI on _QuadrantAPIBase, Store {
  Computed<int>? _$lowerThresholdBoundComputed;

  @override
  int get lowerThresholdBound => (_$lowerThresholdBoundComputed ??=
          Computed<int>(() => super.lowerThresholdBound,
              name: '_QuadrantAPIBase.lowerThresholdBound'))
      .value;
  Computed<int>? _$upperThresholdBoundComputed;

  @override
  int get upperThresholdBound => (_$upperThresholdBoundComputed ??=
          Computed<int>(() => super.upperThresholdBound,
              name: '_QuadrantAPIBase.upperThresholdBound'))
      .value;
  Computed<bool>? _$isANegativeModeMovementComputed;

  @override
  bool get isANegativeModeMovement => (_$isANegativeModeMovementComputed ??=
          Computed<bool>(() => super.isANegativeModeMovement,
              name: '_QuadrantAPIBase.isANegativeModeMovement'))
      .value;
  Computed<bool>? _$isAPositiveRevolutionMovementComputed;

  @override
  bool get isAPositiveRevolutionMovement =>
      (_$isAPositiveRevolutionMovementComputed ??= Computed<bool>(
              () => super.isAPositiveRevolutionMovement,
              name: '_QuadrantAPIBase.isAPositiveRevolutionMovement'))
          .value;
  Computed<bool>? _$isANegativeRevolutionMovementComputed;

  @override
  bool get isANegativeRevolutionMovement =>
      (_$isANegativeRevolutionMovementComputed ??= Computed<bool>(
              () => super.isANegativeRevolutionMovement,
              name: '_QuadrantAPIBase.isANegativeRevolutionMovement'))
          .value;

  late final _$setupReturnTypeAtom =
      Atom(name: '_QuadrantAPIBase.setupReturnType', context: context);

  @override
  GyroSetupReturnType get setupReturnType {
    _$setupReturnTypeAtom.reportRead();
    return super.setupReturnType;
  }

  @override
  set setupReturnType(GyroSetupReturnType value) {
    _$setupReturnTypeAtom.reportWrite(value, super.setupReturnType, () {
      super.setupReturnType = value;
    });
  }

  late final _$currentValueAtom =
      Atom(name: '_QuadrantAPIBase.currentValue', context: context);

  @override
  int get currentValue {
    _$currentValueAtom.reportRead();
    return super.currentValue;
  }

  @override
  set currentValue(int value) {
    _$currentValueAtom.reportWrite(value, super.currentValue, () {
      super.currentValue = value;
    });
  }

  late final _$currentRevolutionAtom =
      Atom(name: '_QuadrantAPIBase.currentRevolution', context: context);

  @override
  int get currentRevolution {
    _$currentRevolutionAtom.reportRead();
    return super.currentRevolution;
  }

  @override
  set currentRevolution(int value) {
    _$currentRevolutionAtom.reportWrite(value, super.currentRevolution, () {
      super.currentRevolution = value;
    });
  }

  late final _$currentQuadrantAtom =
      Atom(name: '_QuadrantAPIBase.currentQuadrant', context: context);

  @override
  int get currentQuadrant {
    _$currentQuadrantAtom.reportRead();
    return super.currentQuadrant;
  }

  @override
  set currentQuadrant(int value) {
    _$currentQuadrantAtom.reportWrite(value, super.currentQuadrant, () {
      super.currentQuadrant = value;
    });
  }

  late final _$theSideTheThresholdWasEnteredFromAtom = Atom(
      name: '_QuadrantAPIBase.theSideTheThresholdWasEnteredFrom',
      context: context);

  @override
  CloserTo get theSideTheThresholdWasEnteredFrom {
    _$theSideTheThresholdWasEnteredFromAtom.reportRead();
    return super.theSideTheThresholdWasEnteredFrom;
  }

  @override
  set theSideTheThresholdWasEnteredFrom(CloserTo value) {
    _$theSideTheThresholdWasEnteredFromAtom
        .reportWrite(value, super.theSideTheThresholdWasEnteredFrom, () {
      super.theSideTheThresholdWasEnteredFrom = value;
    });
  }

  late final _$desiredNegativeModeBehaviorAtom = Atom(
      name: '_QuadrantAPIBase.desiredNegativeModeBehavior', context: context);

  @override
  NegativeModeBehaviors get desiredNegativeModeBehavior {
    _$desiredNegativeModeBehaviorAtom.reportRead();
    return super.desiredNegativeModeBehavior;
  }

  @override
  set desiredNegativeModeBehavior(NegativeModeBehaviors value) {
    _$desiredNegativeModeBehaviorAtom
        .reportWrite(value, super.desiredNegativeModeBehavior, () {
      super.desiredNegativeModeBehavior = value;
    });
  }

  late final _$thresholdListAtom =
      Atom(name: '_QuadrantAPIBase.thresholdList', context: context);

  @override
  ObservableList<Threshold> get thresholdList {
    _$thresholdListAtom.reportRead();
    return super.thresholdList;
  }

  @override
  set thresholdList(ObservableList<Threshold> value) {
    _$thresholdListAtom.reportWrite(value, super.thresholdList, () {
      super.thresholdList = value;
    });
  }

  late final _$hasBeenMarkedUpAtom =
      Atom(name: '_QuadrantAPIBase.hasBeenMarkedUp', context: context);

  @override
  bool get hasBeenMarkedUp {
    _$hasBeenMarkedUpAtom.reportRead();
    return super.hasBeenMarkedUp;
  }

  @override
  set hasBeenMarkedUp(bool value) {
    _$hasBeenMarkedUpAtom.reportWrite(value, super.hasBeenMarkedUp, () {
      super.hasBeenMarkedUp = value;
    });
  }

  late final _$disposeAsyncAction =
      AsyncAction('_QuadrantAPIBase.dispose', context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_QuadrantAPIBaseActionController =
      ActionController(name: '_QuadrantAPIBase', context: context);

  @override
  dynamic setCurrentValue(int newInt) {
    final _$actionInfo = _$_QuadrantAPIBaseActionController.startAction(
        name: '_QuadrantAPIBase.setCurrentValue');
    try {
      return super.setCurrentValue(newInt);
    } finally {
      _$_QuadrantAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentRevolution(int newRev) {
    final _$actionInfo = _$_QuadrantAPIBaseActionController.startAction(
        name: '_QuadrantAPIBase.setCurrentRevolution');
    try {
      return super.setCurrentRevolution(newRev);
    } finally {
      _$_QuadrantAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentQuadrant(int newQuad) {
    final _$actionInfo = _$_QuadrantAPIBaseActionController.startAction(
        name: '_QuadrantAPIBase.setCurrentQuadrant');
    try {
      return super.setCurrentQuadrant(newQuad);
    } finally {
      _$_QuadrantAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDesiredNegativeModeBehavior(NegativeModeBehaviors newNegBehavior) {
    final _$actionInfo = _$_QuadrantAPIBaseActionController.startAction(
        name: '_QuadrantAPIBase.setDesiredNegativeModeBehavior');
    try {
      return super.setDesiredNegativeModeBehavior(newNegBehavior);
    } finally {
      _$_QuadrantAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetTheQuadrantLayout(
      {required int startingQuadrant,
      required int numberOfQuadrants,
      required int quadrantSpread}) {
    final _$actionInfo = _$_QuadrantAPIBaseActionController.startAction(
        name: '_QuadrantAPIBase.resetTheQuadrantLayout');
    try {
      return super.resetTheQuadrantLayout(
          startingQuadrant: startingQuadrant,
          numberOfQuadrants: numberOfQuadrants,
          quadrantSpread: quadrantSpread);
    } finally {
      _$_QuadrantAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic negativeAndRegularModeWatcher(int value) {
    final _$actionInfo = _$_QuadrantAPIBaseActionController.startAction(
        name: '_QuadrantAPIBase.negativeAndRegularModeWatcher');
    try {
      return super.negativeAndRegularModeWatcher(value);
    } finally {
      _$_QuadrantAPIBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
setupReturnType: ${setupReturnType},
currentValue: ${currentValue},
currentRevolution: ${currentRevolution},
currentQuadrant: ${currentQuadrant},
theSideTheThresholdWasEnteredFrom: ${theSideTheThresholdWasEnteredFrom},
desiredNegativeModeBehavior: ${desiredNegativeModeBehavior},
thresholdList: ${thresholdList},
hasBeenMarkedUp: ${hasBeenMarkedUp},
lowerThresholdBound: ${lowerThresholdBound},
upperThresholdBound: ${upperThresholdBound},
isANegativeModeMovement: ${isANegativeModeMovement},
isAPositiveRevolutionMovement: ${isAPositiveRevolutionMovement},
isANegativeRevolutionMovement: ${isANegativeRevolutionMovement}
    ''';
  }
}

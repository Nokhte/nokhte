// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gyroscopic_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GyroscopicCoordinatorStore on _GyroscopicCoordinatorStoreBase, Store {
  Computed<bool>? _$isSecondTimeComputed;

  @override
  bool get isSecondTime =>
      (_$isSecondTimeComputed ??= Computed<bool>(() => super.isSecondTime,
              name: '_GyroscopicCoordinatorStoreBase.isSecondTime'))
          .value;
  Computed<int>? _$lowerThresholdBoundComputed;

  @override
  int get lowerThresholdBound => (_$lowerThresholdBoundComputed ??=
          Computed<int>(() => super.lowerThresholdBound,
              name: '_GyroscopicCoordinatorStoreBase.lowerThresholdBound'))
      .value;
  Computed<int>? _$upperThresholdBoundComputed;

  @override
  int get upperThresholdBound => (_$upperThresholdBoundComputed ??=
          Computed<int>(() => super.upperThresholdBound,
              name: '_GyroscopicCoordinatorStoreBase.upperThresholdBound'))
      .value;
  Computed<bool>? _$isFirstTimeComputed;

  @override
  bool get isFirstTime =>
      (_$isFirstTimeComputed ??= Computed<bool>(() => super.isFirstTime,
              name: '_GyroscopicCoordinatorStoreBase.isFirstTime'))
          .value;
  Computed<bool>? _$isANegativeModeMovementComputed;

  @override
  bool get isANegativeModeMovement => (_$isANegativeModeMovementComputed ??=
          Computed<bool>(() => super.isANegativeModeMovement,
              name: '_GyroscopicCoordinatorStoreBase.isANegativeModeMovement'))
      .value;
  Computed<bool>? _$isAPositiveRevolutionMovementComputed;

  @override
  bool get isAPositiveRevolutionMovement =>
      (_$isAPositiveRevolutionMovementComputed ??= Computed<bool>(
              () => super.isAPositiveRevolutionMovement,
              name:
                  '_GyroscopicCoordinatorStoreBase.isAPositiveRevolutionMovement'))
          .value;
  Computed<bool>? _$isANegativeRevolutionMovementComputed;

  @override
  bool get isANegativeRevolutionMovement =>
      (_$isANegativeRevolutionMovementComputed ??= Computed<bool>(
              () => super.isANegativeRevolutionMovement,
              name:
                  '_GyroscopicCoordinatorStoreBase.isANegativeRevolutionMovement'))
          .value;
  Computed<bool>? _$isAtMaxCapacityComputed;

  @override
  bool get isAtMaxCapacity =>
      (_$isAtMaxCapacityComputed ??= Computed<bool>(() => super.isAtMaxCapacity,
              name: '_GyroscopicCoordinatorStoreBase.isAtMaxCapacity'))
          .value;

  late final _$setupReturnTypeAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.setupReturnType',
      context: context);

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

  late final _$currentValueAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.currentValue', context: context);

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

  late final _$currentModeAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.currentMode', context: context);

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

  late final _$currentRevolutionAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.currentRevolution',
      context: context);

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

  late final _$currentQuadrantAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.currentQuadrant',
      context: context);

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
      name: '_GyroscopicCoordinatorStoreBase.theSideTheThresholdWasEnteredFrom',
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

  late final _$thresholdListAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.thresholdList', context: context);

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

  late final _$firstValueAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.firstValue', context: context);

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

  late final _$hasBeenMarkedUpAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.hasBeenMarkedUp',
      context: context);

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

  late final _$secondValueAtom = Atom(
      name: '_GyroscopicCoordinatorStoreBase.secondValue', context: context);

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

  late final _$disposeAsyncAction =
      AsyncAction('_GyroscopicCoordinatorStoreBase.dispose', context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_GyroscopicCoordinatorStoreBaseActionController =
      ActionController(
          name: '_GyroscopicCoordinatorStoreBase', context: context);

  @override
  dynamic resetTheQuadrantLayout(
      {required int startingQuadrant,
      required int numberOfQuadrants,
      required int totalAngleCoverageOfEachQuadrant}) {
    final _$actionInfo =
        _$_GyroscopicCoordinatorStoreBaseActionController.startAction(
            name: '_GyroscopicCoordinatorStoreBase.resetTheQuadrantLayout');
    try {
      return super.resetTheQuadrantLayout(
          startingQuadrant: startingQuadrant,
          numberOfQuadrants: numberOfQuadrants,
          totalAngleCoverageOfEachQuadrant: totalAngleCoverageOfEachQuadrant);
    } finally {
      _$_GyroscopicCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic negativeAndRegularModeWatcher(int value) {
    final _$actionInfo =
        _$_GyroscopicCoordinatorStoreBaseActionController.startAction(
            name:
                '_GyroscopicCoordinatorStoreBase.negativeAndRegularModeWatcher');
    try {
      return super.negativeAndRegularModeWatcher(value);
    } finally {
      _$_GyroscopicCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic valueTrackingSetup(int value) {
    final _$actionInfo =
        _$_GyroscopicCoordinatorStoreBaseActionController.startAction(
            name: '_GyroscopicCoordinatorStoreBase.valueTrackingSetup');
    try {
      return super.valueTrackingSetup(value);
    } finally {
      _$_GyroscopicCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentValue(int newInt) {
    final _$actionInfo = _$_GyroscopicCoordinatorStoreBaseActionController
        .startAction(name: '_GyroscopicCoordinatorStoreBase.setCurrentValue');
    try {
      return super.setCurrentValue(newInt);
    } finally {
      _$_GyroscopicCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentQuadrant(int newQuad) {
    final _$actionInfo =
        _$_GyroscopicCoordinatorStoreBaseActionController.startAction(
            name: '_GyroscopicCoordinatorStoreBase.setCurrentQuadrant');
    try {
      return super.setCurrentQuadrant(newQuad);
    } finally {
      _$_GyroscopicCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
setupReturnType: ${setupReturnType},
currentValue: ${currentValue},
currentMode: ${currentMode},
currentRevolution: ${currentRevolution},
currentQuadrant: ${currentQuadrant},
theSideTheThresholdWasEnteredFrom: ${theSideTheThresholdWasEnteredFrom},
thresholdList: ${thresholdList},
firstValue: ${firstValue},
hasBeenMarkedUp: ${hasBeenMarkedUp},
secondValue: ${secondValue},
isSecondTime: ${isSecondTime},
lowerThresholdBound: ${lowerThresholdBound},
upperThresholdBound: ${upperThresholdBound},
isFirstTime: ${isFirstTime},
isANegativeModeMovement: ${isANegativeModeMovement},
isAPositiveRevolutionMovement: ${isAPositiveRevolutionMovement},
isANegativeRevolutionMovement: ${isANegativeRevolutionMovement},
isAtMaxCapacity: ${isAtMaxCapacity}
    ''';
  }
}

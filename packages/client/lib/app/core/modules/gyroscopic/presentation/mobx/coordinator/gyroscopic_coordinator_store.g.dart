// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gyroscopic_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GyroscopicCoordinatorStore on _GyroscopicCoordinatorStoreBase, Store {
  Computed<int>? _$lowerBoundComputed;

  @override
  int get lowerBound =>
      (_$lowerBoundComputed ??= Computed<int>(() => super.lowerBound,
              name: '_GyroscopicCoordinatorStoreBase.lowerBound'))
          .value;
  Computed<int>? _$upperBoundComputed;

  @override
  int get upperBound =>
      (_$upperBoundComputed ??= Computed<int>(() => super.upperBound,
              name: '_GyroscopicCoordinatorStoreBase.upperBound'))
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

  late final _$_GyroscopicCoordinatorStoreBaseActionController =
      ActionController(
          name: '_GyroscopicCoordinatorStoreBase', context: context);

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
  String toString() {
    return '''
currentMode: ${currentMode},
currentRevolution: ${currentRevolution},
theSideTheThresholdWasEnteredFrom: ${theSideTheThresholdWasEnteredFrom},
thresholdList: ${thresholdList},
firstValue: ${firstValue},
hasBeenMarkedUp: ${hasBeenMarkedUp},
secondValue: ${secondValue},
lowerBound: ${lowerBound},
upperBound: ${upperBound},
isANegativeModeMovement: ${isANegativeModeMovement},
isAPositiveRevolutionMovement: ${isAPositiveRevolutionMovement},
isANegativeRevolutionMovement: ${isANegativeRevolutionMovement}
    ''';
  }
}

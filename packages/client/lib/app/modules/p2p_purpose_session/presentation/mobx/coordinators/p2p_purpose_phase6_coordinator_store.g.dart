// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase6_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase6CoordinatorStore
    on _P2PPurposePhase6CoordinatorStoreBase, Store {
  late final _$currentModeAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.currentMode',
      context: context);

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

  late final _$refAngleAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.refAngle', context: context);

  @override
  int get refAngle {
    _$refAngleAtom.reportRead();
    return super.refAngle;
  }

  @override
  set refAngle(int value) {
    _$refAngleAtom.reportWrite(value, super.refAngle, () {
      super.refAngle = value;
    });
  }

  late final _$currentRevolutionAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.currentRevolution',
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
      name:
          '_P2PPurposePhase6CoordinatorStoreBase.theSideTheThresholdWasEnteredFrom',
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

  late final _$unFilteredAngleListAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.unFilteredAngleList',
      context: context);

  @override
  ObservableList<int> get unFilteredAngleList {
    _$unFilteredAngleListAtom.reportRead();
    return super.unFilteredAngleList;
  }

  @override
  set unFilteredAngleList(ObservableList<int> value) {
    _$unFilteredAngleListAtom.reportWrite(value, super.unFilteredAngleList, () {
      super.unFilteredAngleList = value;
    });
  }

  late final _$thresholdListAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.thresholdList',
      context: context);

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

  late final _$shortenedAngleListAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.shortenedAngleList',
      context: context);

  @override
  ObservableList<int> get shortenedAngleList {
    _$shortenedAngleListAtom.reportRead();
    return super.shortenedAngleList;
  }

  @override
  set shortenedAngleList(ObservableList<int> value) {
    _$shortenedAngleListAtom.reportWrite(value, super.shortenedAngleList, () {
      super.shortenedAngleList = value;
    });
  }

  late final _$filteredAngleListAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.filteredAngleList',
      context: context);

  @override
  ObservableList<int> get filteredAngleList {
    _$filteredAngleListAtom.reportRead();
    return super.filteredAngleList;
  }

  @override
  set filteredAngleList(ObservableList<int> value) {
    _$filteredAngleListAtom.reportWrite(value, super.filteredAngleList, () {
      super.filteredAngleList = value;
    });
  }

  late final _$firstValueAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.firstValue',
      context: context);

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

  late final _$secondValueAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.secondValue',
      context: context);

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

  late final _$_P2PPurposePhase6CoordinatorStoreBaseActionController =
      ActionController(
          name: '_P2PPurposePhase6CoordinatorStoreBase', context: context);

  @override
  dynamic setRefAngleInfo({required int newRefAngle}) {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name: '_P2PPurposePhase6CoordinatorStoreBase.setRefAngleInfo');
    try {
      return super.setRefAngleInfo(newRefAngle: newRefAngle);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addToFilteredAngleList(int newAngle) {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPurposePhase6CoordinatorStoreBase.addToFilteredAngleList');
    try {
      return super.addToFilteredAngleList(newAngle);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentMode: ${currentMode},
refAngle: ${refAngle},
currentRevolution: ${currentRevolution},
theSideTheThresholdWasEnteredFrom: ${theSideTheThresholdWasEnteredFrom},
unFilteredAngleList: ${unFilteredAngleList},
thresholdList: ${thresholdList},
shortenedAngleList: ${shortenedAngleList},
filteredAngleList: ${filteredAngleList},
firstValue: ${firstValue},
secondValue: ${secondValue}
    ''';
  }
}

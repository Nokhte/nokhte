// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase6_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase6CoordinatorStore
    on _P2PPurposePhase6CoordinatorStoreBase, Store {
  Computed<bool>? _$previousValueIsNotSetComputed;

  @override
  bool get previousValueIsNotSet => (_$previousValueIsNotSetComputed ??=
          Computed<bool>(() => super.previousValueIsNotSet,
              name:
                  '_P2PPurposePhase6CoordinatorStoreBase.previousValueIsNotSet'))
      .value;

  late final _$timesWidgetIsReadyAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.timesWidgetIsReady',
      context: context);

  @override
  bool get timesWidgetIsReady {
    _$timesWidgetIsReadyAtom.reportRead();
    return super.timesWidgetIsReady;
  }

  @override
  set timesWidgetIsReady(bool value) {
    _$timesWidgetIsReadyAtom.reportWrite(value, super.timesWidgetIsReady, () {
      super.timesWidgetIsReady = value;
    });
  }

  late final _$timesQuadrantsAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.timesQuadrants',
      context: context);

  @override
  List<int> get timesQuadrants {
    _$timesQuadrantsAtom.reportRead();
    return super.timesQuadrants;
  }

  @override
  set timesQuadrants(List<int> value) {
    _$timesQuadrantsAtom.reportWrite(value, super.timesQuadrants, () {
      super.timesQuadrants = value;
    });
  }

  late final _$startingQuadrantAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.startingQuadrant',
      context: context);

  @override
  int get startingQuadrant {
    _$startingQuadrantAtom.reportRead();
    return super.startingQuadrant;
  }

  @override
  set startingQuadrant(int value) {
    _$startingQuadrantAtom.reportWrite(value, super.startingQuadrant, () {
      super.startingQuadrant = value;
    });
  }

  late final _$confirmingMatchAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.confirmingMatch',
      context: context);

  @override
  bool get confirmingMatch {
    _$confirmingMatchAtom.reportRead();
    return super.confirmingMatch;
  }

  @override
  set confirmingMatch(bool value) {
    _$confirmingMatchAtom.reportWrite(value, super.confirmingMatch, () {
      super.confirmingMatch = value;
    });
  }

  late final _$newDateOrTimeAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.newDateOrTime',
      context: context);

  @override
  DateTime get newDateOrTime {
    _$newDateOrTimeAtom.reportRead();
    return super.newDateOrTime;
  }

  @override
  set newDateOrTime(DateTime value) {
    _$newDateOrTimeAtom.reportWrite(value, super.newDateOrTime, () {
      super.newDateOrTime = value;
    });
  }

  late final _$nowAtom =
      Atom(name: '_P2PPurposePhase6CoordinatorStoreBase.now', context: context);

  @override
  DateTime get now {
    _$nowAtom.reportRead();
    return super.now;
  }

  @override
  set now(DateTime value) {
    _$nowAtom.reportWrite(value, super.now, () {
      super.now = value;
    });
  }

  late final _$currentlySelectedDateAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.currentlySelectedDate',
      context: context);

  @override
  DateTime get currentlySelectedDate {
    _$currentlySelectedDateAtom.reportRead();
    return super.currentlySelectedDate;
  }

  @override
  set currentlySelectedDate(DateTime value) {
    _$currentlySelectedDateAtom.reportWrite(value, super.currentlySelectedDate,
        () {
      super.currentlySelectedDate = value;
    });
  }

  late final _$updateTheBackendAsyncAction = AsyncAction(
      '_P2PPurposePhase6CoordinatorStoreBase.updateTheBackend',
      context: context);

  @override
  Future updateTheBackend(
      {required bool isAForwardMovement, required bool isADate}) {
    return _$updateTheBackendAsyncAction.run(() => super.updateTheBackend(
        isAForwardMovement: isAForwardMovement, isADate: isADate));
  }

  late final _$_P2PPurposePhase6CoordinatorStoreBaseActionController =
      ActionController(
          name: '_P2PPurposePhase6CoordinatorStoreBase', context: context);

  @override
  dynamic setTimesWidgetIsReady(dynamic newBool) {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPurposePhase6CoordinatorStoreBase.setTimesWidgetIsReady');
    try {
      return super.setTimesWidgetIsReady(newBool);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetValues() {
    final _$actionInfo = _$_P2PPurposePhase6CoordinatorStoreBaseActionController
        .startAction(name: '_P2PPurposePhase6CoordinatorStoreBase.resetValues');
    try {
      return super.resetValues();
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStartingQuadrant(int newQuad) {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name: '_P2PPurposePhase6CoordinatorStoreBase.setStartingQuadrant');
    try {
      return super.setStartingQuadrant(newQuad);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNewDateOrTime(DateTime newDT) {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name: '_P2PPurposePhase6CoordinatorStoreBase.setNewDateOrTime');
    try {
      return super.setNewDateOrTime(newDT);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNow(DateTime newNow) {
    final _$actionInfo = _$_P2PPurposePhase6CoordinatorStoreBaseActionController
        .startAction(name: '_P2PPurposePhase6CoordinatorStoreBase.setNow');
    try {
      return super.setNow(newNow);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic agreementProtocolTimer() {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPurposePhase6CoordinatorStoreBase.agreementProtocolTimer');
    try {
      return super.agreementProtocolTimer();
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic conveyerBeltController() {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPurposePhase6CoordinatorStoreBase.conveyerBeltController');
    try {
      return super.conveyerBeltController();
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic disagreementAfterAgreementProtocol() {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPurposePhase6CoordinatorStoreBase.disagreementAfterAgreementProtocol');
    try {
      return super.disagreementAfterAgreementProtocol();
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  bool checkIfDatesMatch(DateTime comparisonDate) {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name: '_P2PPurposePhase6CoordinatorStoreBase.checkIfDatesMatch');
    try {
      return super.checkIfDatesMatch(comparisonDate);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  bool checkIfTimesMatch(DateTime comparisonDate) {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name: '_P2PPurposePhase6CoordinatorStoreBase.checkIfTimesMatch');
    try {
      return super.checkIfTimesMatch(comparisonDate);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timesWidgetIsReady: ${timesWidgetIsReady},
timesQuadrants: ${timesQuadrants},
startingQuadrant: ${startingQuadrant},
confirmingMatch: ${confirmingMatch},
newDateOrTime: ${newDateOrTime},
now: ${now},
currentlySelectedDate: ${currentlySelectedDate},
previousValueIsNotSet: ${previousValueIsNotSet}
    ''';
  }
}

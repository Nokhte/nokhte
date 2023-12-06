// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase6_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase6WidgetsCoordinator
    on _P2PPurposePhase6WidgetsCoordinatorBase, Store {
  late final _$beachWavesVisibilityAtom = Atom(
      name: '_P2PPurposePhase6WidgetsCoordinatorBase.beachWavesVisibility',
      context: context);

  @override
  bool get beachWavesVisibility {
    _$beachWavesVisibilityAtom.reportRead();
    return super.beachWavesVisibility;
  }

  @override
  set beachWavesVisibility(bool value) {
    _$beachWavesVisibilityAtom.reportWrite(value, super.beachWavesVisibility,
        () {
      super.beachWavesVisibility = value;
    });
  }

  late final _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_P2PPurposePhase6WidgetsCoordinatorBase', context: context);

  @override
  dynamic toggleBeachWavesVisibility() {
    final _$actionInfo =
        _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController.startAction(
            name:
                '_P2PPurposePhase6WidgetsCoordinatorBase.toggleBeachWavesVisibility');
    try {
      return super.toggleBeachWavesVisibility();
    } finally {
      _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic attuneTheWidgets(DateTime currentTimeParam) {
    final _$actionInfo =
        _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController.startAction(
            name: '_P2PPurposePhase6WidgetsCoordinatorBase.attuneTheWidgets');
    try {
      return super.attuneTheWidgets(currentTimeParam);
    } finally {
      _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic widgetSetup(DateTime currentDateTime) {
    final _$actionInfo =
        _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController.startAction(
            name: '_P2PPurposePhase6WidgetsCoordinatorBase.widgetSetup');
    try {
      return super.widgetSetup(currentDateTime);
    } finally {
      _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initBackToShore(DateTime theTimeToTransitionFrom) {
    final _$actionInfo =
        _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController.startAction(
            name: '_P2PPurposePhase6WidgetsCoordinatorBase.initBackToShore');
    try {
      return super.initBackToShore(theTimeToTransitionFrom);
    } finally {
      _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initForwardTimeShift(
      {required bool isADate, required DateTime newTime}) {
    final _$actionInfo =
        _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController.startAction(
            name:
                '_P2PPurposePhase6WidgetsCoordinatorBase.initForwardTimeShift');
    try {
      return super.initForwardTimeShift(isADate: isADate, newTime: newTime);
    } finally {
      _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initBackwardTimeShift(
      {required bool isADate, required DateTime newTime}) {
    final _$actionInfo =
        _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController.startAction(
            name:
                '_P2PPurposePhase6WidgetsCoordinatorBase.initBackwardTimeShift');
    try {
      return super.initBackwardTimeShift(isADate: isADate, newTime: newTime);
    } finally {
      _$_P2PPurposePhase6WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
beachWavesVisibility: ${beachWavesVisibility}
    ''';
  }
}

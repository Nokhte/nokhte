// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_widgets_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SchedulingWidgetsCoordinatorStore
    on _SchedulingWidgetsCoordinatorStoreBase, Store {
  late final _$currentSelectedTimeAtom = Atom(
      name: '_SchedulingWidgetsCoordinatorStoreBase.currentSelectedTime',
      context: context);

  @override
  DateTime get currentSelectedTime {
    _$currentSelectedTimeAtom.reportRead();
    return super.currentSelectedTime;
  }

  @override
  set currentSelectedTime(DateTime value) {
    _$currentSelectedTimeAtom.reportWrite(value, super.currentSelectedTime, () {
      super.currentSelectedTime = value;
    });
  }

  late final _$_SchedulingWidgetsCoordinatorStoreBaseActionController =
      ActionController(
          name: '_SchedulingWidgetsCoordinatorStoreBase', context: context);

  @override
  dynamic attuneTheWidgets(DateTime currentTimeParam) {
    final _$actionInfo =
        _$_SchedulingWidgetsCoordinatorStoreBaseActionController.startAction(
            name: '_SchedulingWidgetsCoordinatorStoreBase.attuneTheWidgets');
    try {
      return super.attuneTheWidgets(currentTimeParam);
    } finally {
      _$_SchedulingWidgetsCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initForwardTimeShift() {
    final _$actionInfo =
        _$_SchedulingWidgetsCoordinatorStoreBaseActionController.startAction(
            name:
                '_SchedulingWidgetsCoordinatorStoreBase.initForwardTimeShift');
    try {
      return super.initForwardTimeShift();
    } finally {
      _$_SchedulingWidgetsCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initBackwardTimeShift() {
    final _$actionInfo =
        _$_SchedulingWidgetsCoordinatorStoreBaseActionController.startAction(
            name:
                '_SchedulingWidgetsCoordinatorStoreBase.initBackwardTimeShift');
    try {
      return super.initBackwardTimeShift();
    } finally {
      _$_SchedulingWidgetsCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentSelectedTime: ${currentSelectedTime}
    ''';
  }
}

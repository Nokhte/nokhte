// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_session_phase2_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurposeSessionPhase2Coordinator
    on _PurposeSessionPhase2CoordinatorBase, Store {
  late final _$hasInitializedTimerAtom = Atom(
      name: '_PurposeSessionPhase2CoordinatorBase.hasInitializedTimer',
      context: context);

  @override
  bool get hasInitializedTimer {
    _$hasInitializedTimerAtom.reportRead();
    return super.hasInitializedTimer;
  }

  @override
  set hasInitializedTimer(bool value) {
    _$hasInitializedTimerAtom.reportWrite(value, super.hasInitializedTimer, () {
      super.hasInitializedTimer = value;
    });
  }

  late final _$isFirstTimeBothAreInSyncAtom = Atom(
      name: '_PurposeSessionPhase2CoordinatorBase.isFirstTimeBothAreInSync',
      context: context);

  @override
  bool get isFirstTimeBothAreInSync {
    _$isFirstTimeBothAreInSyncAtom.reportRead();
    return super.isFirstTimeBothAreInSync;
  }

  @override
  set isFirstTimeBothAreInSync(bool value) {
    _$isFirstTimeBothAreInSyncAtom
        .reportWrite(value, super.isFirstTimeBothAreInSync, () {
      super.isFirstTimeBothAreInSync = value;
    });
  }

  late final _$canSwipeUpAtom = Atom(
      name: '_PurposeSessionPhase2CoordinatorBase.canSwipeUp',
      context: context);

  @override
  bool get canSwipeUp {
    _$canSwipeUpAtom.reportRead();
    return super.canSwipeUp;
  }

  @override
  set canSwipeUp(bool value) {
    _$canSwipeUpAtom.reportWrite(value, super.canSwipeUp, () {
      super.canSwipeUp = value;
    });
  }

  late final _$hasSwipedUpAtom = Atom(
      name: '_PurposeSessionPhase2CoordinatorBase.hasSwipedUp',
      context: context);

  @override
  bool get hasSwipedUp {
    _$hasSwipedUpAtom.reportRead();
    return super.hasSwipedUp;
  }

  @override
  set hasSwipedUp(bool value) {
    _$hasSwipedUpAtom.reportWrite(value, super.hasSwipedUp, () {
      super.hasSwipedUp = value;
    });
  }

  late final _$constructorAsyncAction = AsyncAction(
      '_PurposeSessionPhase2CoordinatorBase.constructor',
      context: context);

  @override
  Future constructor() {
    return _$constructorAsyncAction.run(() => super.constructor());
  }

  late final _$onInactiveAsyncAction = AsyncAction(
      '_PurposeSessionPhase2CoordinatorBase.onInactive',
      context: context);

  @override
  Future onInactive() {
    return _$onInactiveAsyncAction.run(() => super.onInactive());
  }

  late final _$onResumedAsyncAction = AsyncAction(
      '_PurposeSessionPhase2CoordinatorBase.onResumed',
      context: context);

  @override
  Future onResumed() {
    return _$onResumedAsyncAction.run(() => super.onResumed());
  }

  late final _$onPhaseChangeAsyncAction = AsyncAction(
      '_PurposeSessionPhase2CoordinatorBase.onPhaseChange',
      context: context);

  @override
  Future onPhaseChange() {
    return _$onPhaseChangeAsyncAction.run(() => super.onPhaseChange());
  }

  late final _$onTimesUpAsyncAction = AsyncAction(
      '_PurposeSessionPhase2CoordinatorBase.onTimesUp',
      context: context);

  @override
  Future onTimesUp() {
    return _$onTimesUpAsyncAction.run(() => super.onTimesUp());
  }

  late final _$_PurposeSessionPhase2CoordinatorBaseActionController =
      ActionController(
          name: '_PurposeSessionPhase2CoordinatorBase', context: context);

  @override
  dynamic onKeyboardUp() {
    final _$actionInfo = _$_PurposeSessionPhase2CoordinatorBaseActionController
        .startAction(name: '_PurposeSessionPhase2CoordinatorBase.onKeyboardUp');
    try {
      return super.onKeyboardUp();
    } finally {
      _$_PurposeSessionPhase2CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onKeyboardDown() {
    final _$actionInfo =
        _$_PurposeSessionPhase2CoordinatorBaseActionController.startAction(
            name: '_PurposeSessionPhase2CoordinatorBase.onKeyboardDown');
    try {
      return super.onKeyboardDown();
    } finally {
      _$_PurposeSessionPhase2CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initTimer() {
    final _$actionInfo = _$_PurposeSessionPhase2CoordinatorBaseActionController
        .startAction(name: '_PurposeSessionPhase2CoordinatorBase.initTimer');
    try {
      return super.initTimer();
    } finally {
      _$_PurposeSessionPhase2CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasInitializedTimer: ${hasInitializedTimer},
isFirstTimeBothAreInSync: ${isFirstTimeBothAreInSync},
canSwipeUp: ${canSwipeUp},
hasSwipedUp: ${hasSwipedUp}
    ''';
  }
}

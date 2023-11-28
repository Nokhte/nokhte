// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerCoordinator on _TimerCoordinatorBase, Store {
  late final _$currentTimeLeftAtom =
      Atom(name: '_TimerCoordinatorBase.currentTimeLeft', context: context);

  @override
  double get currentTimeLeft {
    _$currentTimeLeftAtom.reportRead();
    return super.currentTimeLeft;
  }

  @override
  set currentTimeLeft(double value) {
    _$currentTimeLeftAtom.reportWrite(value, super.currentTimeLeft, () {
      super.currentTimeLeft = value;
    });
  }

  late final _$isFirstTimeAtom =
      Atom(name: '_TimerCoordinatorBase.isFirstTime', context: context);

  @override
  bool get isFirstTime {
    _$isFirstTimeAtom.reportRead();
    return super.isFirstTime;
  }

  @override
  set isFirstTime(bool value) {
    _$isFirstTimeAtom.reportWrite(value, super.isFirstTime, () {
      super.isFirstTime = value;
    });
  }

  late final _$shouldCancelTimerAtom =
      Atom(name: '_TimerCoordinatorBase.shouldCancelTimer', context: context);

  @override
  bool get shouldCancelTimer {
    _$shouldCancelTimerAtom.reportRead();
    return super.shouldCancelTimer;
  }

  @override
  set shouldCancelTimer(bool value) {
    _$shouldCancelTimerAtom.reportWrite(value, super.shouldCancelTimer, () {
      super.shouldCancelTimer = value;
    });
  }

  late final _$createTheTimerAsyncAction =
      AsyncAction('_TimerCoordinatorBase.createTheTimer', context: context);

  @override
  Future createTheTimer(CreateTimerParams params) {
    return _$createTheTimerAsyncAction.run(() => super.createTheTimer(params));
  }

  late final _$setOnlineStatusAsyncAction =
      AsyncAction('_TimerCoordinatorBase.setOnlineStatus', context: context);

  @override
  Future setOnlineStatus(bool isOnline) {
    return _$setOnlineStatusAsyncAction
        .run(() => super.setOnlineStatus(isOnline));
  }

  late final _$getTimerInformationStreamAsyncAction = AsyncAction(
      '_TimerCoordinatorBase.getTimerInformationStream',
      context: context);

  @override
  Future getTimerInformationStream() {
    return _$getTimerInformationStreamAsyncAction
        .run(() => super.getTimerInformationStream());
  }

  late final _$setupAndStreamListenerActivationAsyncAction = AsyncAction(
      '_TimerCoordinatorBase.setupAndStreamListenerActivation',
      context: context);

  @override
  Future setupAndStreamListenerActivation(CreateTimerParams params,
      {required dynamic Function(bool) timerUICallback,
      required Function onBothCollaboratorTimersCompleted}) {
    return _$setupAndStreamListenerActivationAsyncAction.run(() => super
        .setupAndStreamListenerActivation(params,
            timerUICallback: timerUICallback,
            onBothCollaboratorTimersCompleted:
                onBothCollaboratorTimersCompleted));
  }

  late final _$_TimerCoordinatorBaseActionController =
      ActionController(name: '_TimerCoordinatorBase', context: context);

  @override
  dynamic timerInfoStreamListener(
      {required dynamic Function(bool) initOrPauseUITimer,
      required Function onBothCollaboratorTimersCompleted}) {
    final _$actionInfo = _$_TimerCoordinatorBaseActionController.startAction(
        name: '_TimerCoordinatorBase.timerInfoStreamListener');
    try {
      return super.timerInfoStreamListener(
          initOrPauseUITimer: initOrPauseUITimer,
          onBothCollaboratorTimersCompleted: onBothCollaboratorTimersCompleted);
    } finally {
      _$_TimerCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTimeLeft: ${currentTimeLeft},
isFirstTime: ${isFirstTime},
shouldCancelTimer: ${shouldCancelTimer}
    ''';
  }
}

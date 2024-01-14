// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_session_phase_one_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurposeSessionPhaseOneCoordinator
    on _PurposeSessionPhaseOneCoordinatorBase, Store {
  late final _$isFirstTimeInitializingTimerAtom = Atom(
      name:
          '_PurposeSessionPhaseOneCoordinatorBase.isFirstTimeInitializingTimer',
      context: context);

  @override
  bool get isFirstTimeInitializingTimer {
    _$isFirstTimeInitializingTimerAtom.reportRead();
    return super.isFirstTimeInitializingTimer;
  }

  @override
  set isFirstTimeInitializingTimer(bool value) {
    _$isFirstTimeInitializingTimerAtom
        .reportWrite(value, super.isFirstTimeInitializingTimer, () {
      super.isFirstTimeInitializingTimer = value;
    });
  }

  late final _$constructorAsyncAction = AsyncAction(
      '_PurposeSessionPhaseOneCoordinatorBase.constructor',
      context: context);

  @override
  Future constructor() {
    return _$constructorAsyncAction.run(() => super.constructor());
  }

  late final _$onInactiveAsyncAction = AsyncAction(
      '_PurposeSessionPhaseOneCoordinatorBase.onInactive',
      context: context);

  @override
  Future onInactive() {
    return _$onInactiveAsyncAction.run(() => super.onInactive());
  }

  late final _$onResumedAsyncAction = AsyncAction(
      '_PurposeSessionPhaseOneCoordinatorBase.onResumed',
      context: context);

  @override
  Future onResumed() {
    return _$onResumedAsyncAction.run(() => super.onResumed());
  }

  late final _$onDetachedAsyncAction = AsyncAction(
      '_PurposeSessionPhaseOneCoordinatorBase.onDetached',
      context: context);

  @override
  Future onDetached() {
    return _$onDetachedAsyncAction.run(() => super.onDetached());
  }

  @override
  String toString() {
    return '''
isFirstTimeInitializingTimer: ${isFirstTimeInitializingTimer}
    ''';
  }
}

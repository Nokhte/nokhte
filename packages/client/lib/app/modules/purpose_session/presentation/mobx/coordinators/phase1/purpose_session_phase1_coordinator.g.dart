// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_session_phase1_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurposeSessionPhase1Coordinator
    on _PurposeSessionPhase1CoordinatorBase, Store {
  late final _$canSpeakAtom = Atom(
      name: '_PurposeSessionPhase1CoordinatorBase.canSpeak', context: context);

  @override
  bool get canSpeak {
    _$canSpeakAtom.reportRead();
    return super.canSpeak;
  }

  @override
  set canSpeak(bool value) {
    _$canSpeakAtom.reportWrite(value, super.canSpeak, () {
      super.canSpeak = value;
    });
  }

  late final _$isFirstTimeBothAreInSyncAtom = Atom(
      name: '_PurposeSessionPhase1CoordinatorBase.isFirstTimeBothAreInSync',
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

  late final _$hasInitializedTimerAtom = Atom(
      name: '_PurposeSessionPhase1CoordinatorBase.hasInitializedTimer',
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

  late final _$speakerCountAtom = Atom(
      name: '_PurposeSessionPhase1CoordinatorBase.speakerCount',
      context: context);

  @override
  int get speakerCount {
    _$speakerCountAtom.reportRead();
    return super.speakerCount;
  }

  @override
  set speakerCount(int value) {
    _$speakerCountAtom.reportWrite(value, super.speakerCount, () {
      super.speakerCount = value;
    });
  }

  late final _$constructorAsyncAction = AsyncAction(
      '_PurposeSessionPhase1CoordinatorBase.constructor',
      context: context);

  @override
  Future constructor() {
    return _$constructorAsyncAction.run(() => super.constructor());
  }

  late final _$onInactiveAsyncAction = AsyncAction(
      '_PurposeSessionPhase1CoordinatorBase.onInactive',
      context: context);

  @override
  Future onInactive() {
    return _$onInactiveAsyncAction.run(() => super.onInactive());
  }

  late final _$onResumedAsyncAction = AsyncAction(
      '_PurposeSessionPhase1CoordinatorBase.onResumed',
      context: context);

  @override
  Future onResumed() {
    return _$onResumedAsyncAction.run(() => super.onResumed());
  }

  late final _$onTimesUpCompletedAsyncAction = AsyncAction(
      '_PurposeSessionPhase1CoordinatorBase.onTimesUpCompleted',
      context: context);

  @override
  Future onTimesUpCompleted() {
    return _$onTimesUpCompletedAsyncAction
        .run(() => super.onTimesUpCompleted());
  }

  @override
  String toString() {
    return '''
canSpeak: ${canSpeak},
isFirstTimeBothAreInSync: ${isFirstTimeBothAreInSync},
hasInitializedTimer: ${hasInitializedTimer},
speakerCount: ${speakerCount}
    ''';
  }
}

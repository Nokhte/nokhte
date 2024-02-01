// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nokhte_session_phase1_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NokhteSessionPhase1Coordinator
    on _NokhteSessionPhase1CoordinatorBase, Store {
  Computed<bool>? _$speakerCountIsOddComputed;

  @override
  bool get speakerCountIsOdd => (_$speakerCountIsOddComputed ??= Computed<bool>(
          () => super.speakerCountIsOdd,
          name: '_NokhteSessionPhase1CoordinatorBase.speakerCountIsOdd'))
      .value;
  Computed<bool>? _$speakerCountIsEvenComputed;

  @override
  bool get speakerCountIsEven => (_$speakerCountIsEvenComputed ??=
          Computed<bool>(() => super.speakerCountIsEven,
              name: '_NokhteSessionPhase1CoordinatorBase.speakerCountIsEven'))
      .value;
  Computed<bool>? _$shouldIncrementSpeakerCountComputed;

  @override
  bool get shouldIncrementSpeakerCount =>
      (_$shouldIncrementSpeakerCountComputed ??= Computed<bool>(
              () => super.shouldIncrementSpeakerCount,
              name:
                  '_NokhteSessionPhase1CoordinatorBase.shouldIncrementSpeakerCount'))
          .value;

  late final _$canSpeakAtom = Atom(
      name: '_NokhteSessionPhase1CoordinatorBase.canSpeak', context: context);

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

  late final _$speakerCountAtom = Atom(
      name: '_NokhteSessionPhase1CoordinatorBase.speakerCount',
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

  late final _$questionIndexTypeAtom = Atom(
      name: '_NokhteSessionPhase1CoordinatorBase.questionIndexType',
      context: context);

  @override
  QuestionIndexType get questionIndexType {
    _$questionIndexTypeAtom.reportRead();
    return super.questionIndexType;
  }

  @override
  set questionIndexType(QuestionIndexType value) {
    _$questionIndexTypeAtom.reportWrite(value, super.questionIndexType, () {
      super.questionIndexType = value;
    });
  }

  late final _$constructorAsyncAction = AsyncAction(
      '_NokhteSessionPhase1CoordinatorBase.constructor',
      context: context);

  @override
  Future constructor() {
    return _$constructorAsyncAction.run(() => super.constructor());
  }

  late final _$onInactiveAsyncAction = AsyncAction(
      '_NokhteSessionPhase1CoordinatorBase.onInactive',
      context: context);

  @override
  Future onInactive() {
    return _$onInactiveAsyncAction.run(() => super.onInactive());
  }

  late final _$onResumedAsyncAction = AsyncAction(
      '_NokhteSessionPhase1CoordinatorBase.onResumed',
      context: context);

  @override
  Future onResumed() {
    return _$onResumedAsyncAction.run(() => super.onResumed());
  }

  @override
  String toString() {
    return '''
canSpeak: ${canSpeak},
speakerCount: ${speakerCount},
questionIndexType: ${questionIndexType},
speakerCountIsOdd: ${speakerCountIsOdd},
speakerCountIsEven: ${speakerCountIsEven},
shouldIncrementSpeakerCount: ${shouldIncrementSpeakerCount}
    ''';
  }
}

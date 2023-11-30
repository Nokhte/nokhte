// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase2_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase2Coordinator on _P2PPurposePhase2CoordinatorBase, Store {
  late final _$isFirstTimeTalkingAtom = Atom(
      name: '_P2PPurposePhase2CoordinatorBase.isFirstTimeTalking',
      context: context);

  @override
  bool get isFirstTimeTalking {
    _$isFirstTimeTalkingAtom.reportRead();
    return super.isFirstTimeTalking;
  }

  @override
  set isFirstTimeTalking(bool value) {
    _$isFirstTimeTalkingAtom.reportWrite(value, super.isFirstTimeTalking, () {
      super.isFirstTimeTalking = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_P2PPurposePhase2CoordinatorBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$audioButtonHoldStartCallbackAsyncAction = AsyncAction(
      '_P2PPurposePhase2CoordinatorBase.audioButtonHoldStartCallback',
      context: context);

  @override
  Future audioButtonHoldStartCallback() {
    return _$audioButtonHoldStartCallbackAsyncAction
        .run(() => super.audioButtonHoldStartCallback());
  }

  late final _$audioButtonHoldEndCallbackAsyncAction = AsyncAction(
      '_P2PPurposePhase2CoordinatorBase.audioButtonHoldEndCallback',
      context: context);

  @override
  Future audioButtonHoldEndCallback() {
    return _$audioButtonHoldEndCallbackAsyncAction
        .run(() => super.audioButtonHoldEndCallback());
  }

  @override
  String toString() {
    return '''
isFirstTimeTalking: ${isFirstTimeTalking}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase2_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase2WidgetsCoordinator
    on _P2PPurposePhase2WidgetsCoordinatorBase, Store {
  late final _$isFirstTimeTalkingAtom = Atom(
      name: '_P2PPurposePhase2WidgetsCoordinatorBase.isFirstTimeTalking',
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

  late final _$constructorAsyncAction = AsyncAction(
      '_P2PPurposePhase2WidgetsCoordinatorBase.constructor',
      context: context);

  @override
  Future constructor({required String mainOnScreenMessage}) {
    return _$constructorAsyncAction
        .run(() => super.constructor(mainOnScreenMessage: mainOnScreenMessage));
  }

  late final _$audioButtonHoldStartCallbackAsyncAction = AsyncAction(
      '_P2PPurposePhase2WidgetsCoordinatorBase.audioButtonHoldStartCallback',
      context: context);

  @override
  Future audioButtonHoldStartCallback(
      {required Function firstTimeTalkingCallback,
      required Function everyTimeCallback}) {
    return _$audioButtonHoldStartCallbackAsyncAction.run(() => super
        .audioButtonHoldStartCallback(
            firstTimeTalkingCallback: firstTimeTalkingCallback,
            everyTimeCallback: everyTimeCallback));
  }

  late final _$_P2PPurposePhase2WidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_P2PPurposePhase2WidgetsCoordinatorBase', context: context);

  @override
  dynamic disableMeshAndMirrorCollaboratorsGlow() {
    final _$actionInfo =
        _$_P2PPurposePhase2WidgetsCoordinatorBaseActionController.startAction(
            name:
                '_P2PPurposePhase2WidgetsCoordinatorBase.disableMeshAndMirrorCollaboratorsGlow');
    try {
      return super.disableMeshAndMirrorCollaboratorsGlow();
    } finally {
      _$_P2PPurposePhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic enableMeshAfterCooldownPeriod() {
    final _$actionInfo =
        _$_P2PPurposePhase2WidgetsCoordinatorBaseActionController.startAction(
            name:
                '_P2PPurposePhase2WidgetsCoordinatorBase.enableMeshAfterCooldownPeriod');
    try {
      return super.enableMeshAfterCooldownPeriod();
    } finally {
      _$_P2PPurposePhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic uiCleanUpAndTransition() {
    final _$actionInfo =
        _$_P2PPurposePhase2WidgetsCoordinatorBaseActionController.startAction(
            name:
                '_P2PPurposePhase2WidgetsCoordinatorBase.uiCleanUpAndTransition');
    try {
      return super.uiCleanUpAndTransition();
    } finally {
      _$_P2PPurposePhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstTimeTalking: ${isFirstTimeTalking}
    ''';
  }
}

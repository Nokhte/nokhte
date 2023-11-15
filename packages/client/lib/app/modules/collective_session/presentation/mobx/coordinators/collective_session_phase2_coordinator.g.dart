// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collective_session_phase2_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollectiveSessionPhase2Coordinator
    on _CollectiveSessionPhase2CoordinatorBase, Store {
  late final _$previousWordAtom = Atom(
      name: '_CollectiveSessionPhase2CoordinatorBase.previousWord',
      context: context);

  @override
  String get previousWord {
    _$previousWordAtom.reportRead();
    return super.previousWord;
  }

  @override
  set previousWord(String value) {
    _$previousWordAtom.reportWrite(value, super.previousWord, () {
      super.previousWord = value;
    });
  }

  late final _$bottomCircleIsUpAtom = Atom(
      name: '_CollectiveSessionPhase2CoordinatorBase.bottomCircleIsUp',
      context: context);

  @override
  bool get bottomCircleIsUp {
    _$bottomCircleIsUpAtom.reportRead();
    return super.bottomCircleIsUp;
  }

  @override
  set bottomCircleIsUp(bool value) {
    _$bottomCircleIsUpAtom.reportWrite(value, super.bottomCircleIsUp, () {
      super.bottomCircleIsUp = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_CollectiveSessionPhase2CoordinatorBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$updateCommitStatusAsyncAction = AsyncAction(
      '_CollectiveSessionPhase2CoordinatorBase.updateCommitStatus',
      context: context);

  @override
  Future updateCommitStatus() {
    return _$updateCommitStatusAsyncAction
        .run(() => super.updateCommitStatus());
  }

  late final _$_CollectiveSessionPhase2CoordinatorBaseActionController =
      ActionController(
          name: '_CollectiveSessionPhase2CoordinatorBase', context: context);

  @override
  dynamic userTextControllerListener() {
    final _$actionInfo =
        _$_CollectiveSessionPhase2CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase2CoordinatorBase.userTextControllerListener');
    try {
      return super.userTextControllerListener();
    } finally {
      _$_CollectiveSessionPhase2CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
previousWord: ${previousWord},
bottomCircleIsUp: ${bottomCircleIsUp}
    ''';
  }
}

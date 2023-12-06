// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_talker_at_a_time_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OneTalkerAtATimeCoordinator on _OneTalkerAtATimeCoordinatorBase, Store {
  late final _$collaboratorIsTalkingAtom = Atom(
      name: '_OneTalkerAtATimeCoordinatorBase.collaboratorIsTalking',
      context: context);

  @override
  bool get collaboratorIsTalking {
    _$collaboratorIsTalkingAtom.reportRead();
    return super.collaboratorIsTalking;
  }

  @override
  set collaboratorIsTalking(bool value) {
    _$collaboratorIsTalkingAtom.reportWrite(value, super.collaboratorIsTalking,
        () {
      super.collaboratorIsTalking = value;
    });
  }

  late final _$startListeningToCheckIfCollaboratorIsTalkingAsyncAction =
      AsyncAction(
          '_OneTalkerAtATimeCoordinatorBase.startListeningToCheckIfCollaboratorIsTalking',
          context: context);

  @override
  Future startListeningToCheckIfCollaboratorIsTalking() {
    return _$startListeningToCheckIfCollaboratorIsTalkingAsyncAction
        .run(() => super.startListeningToCheckIfCollaboratorIsTalking());
  }

  late final _$_OneTalkerAtATimeCoordinatorBaseActionController =
      ActionController(
          name: '_OneTalkerAtATimeCoordinatorBase', context: context);

  @override
  dynamic setWhoIsTalking(bool newBool) {
    final _$actionInfo = _$_OneTalkerAtATimeCoordinatorBaseActionController
        .startAction(name: '_OneTalkerAtATimeCoordinatorBase.setWhoIsTalking');
    try {
      return super.setWhoIsTalking(newBool);
    } finally {
      _$_OneTalkerAtATimeCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic markUserAsTheTalker() {
    final _$actionInfo =
        _$_OneTalkerAtATimeCoordinatorBaseActionController.startAction(
            name: '_OneTalkerAtATimeCoordinatorBase.markUserAsTheTalker');
    try {
      return super.markUserAsTheTalker();
    } finally {
      _$_OneTalkerAtATimeCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearOutTalkerRow() {
    final _$actionInfo =
        _$_OneTalkerAtATimeCoordinatorBaseActionController.startAction(
            name: '_OneTalkerAtATimeCoordinatorBase.clearOutTalkerRow');
    try {
      return super.clearOutTalkerRow();
    } finally {
      _$_OneTalkerAtATimeCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
collaboratorIsTalking: ${collaboratorIsTalking}
    ''';
  }
}

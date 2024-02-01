// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_session_presence_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurposeSessionPresenceCoordinator
    on _PurposeSessionPresenceCoordinatorBase, Store {
  late final _$timerStatusIsUpdatedAtom = Atom(
      name: '_PurposeSessionPresenceCoordinatorBase.timerStatusIsUpdated',
      context: context);

  @override
  bool get timerStatusIsUpdated {
    _$timerStatusIsUpdatedAtom.reportRead();
    return super.timerStatusIsUpdated;
  }

  @override
  set timerStatusIsUpdated(bool value) {
    _$timerStatusIsUpdatedAtom.reportWrite(value, super.timerStatusIsUpdated,
        () {
      super.timerStatusIsUpdated = value;
    });
  }

  late final _$updateTimerStatusAsyncAction = AsyncAction(
      '_PurposeSessionPresenceCoordinatorBase.updateTimerStatus',
      context: context);

  @override
  Future updateTimerStatus(bool params) {
    return _$updateTimerStatusAsyncAction
        .run(() => super.updateTimerStatus(params));
  }

  late final _$disposeAsyncAction = AsyncAction(
      '_PurposeSessionPresenceCoordinatorBase.dispose',
      context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_PurposeSessionPresenceCoordinatorBaseActionController =
      ActionController(
          name: '_PurposeSessionPresenceCoordinatorBase', context: context);

  @override
  dynamic initReactors(
      {required Function onCollaboratorJoined,
      required Function onCollaboratorLeft}) {
    final _$actionInfo =
        _$_PurposeSessionPresenceCoordinatorBaseActionController.startAction(
            name: '_PurposeSessionPresenceCoordinatorBase.initReactors');
    try {
      return super.initReactors(
          onCollaboratorJoined: onCollaboratorJoined,
          onCollaboratorLeft: onCollaboratorLeft);
    } finally {
      _$_PurposeSessionPresenceCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic listen() {
    final _$actionInfo =
        _$_PurposeSessionPresenceCoordinatorBaseActionController.startAction(
            name: '_PurposeSessionPresenceCoordinatorBase.listen');
    try {
      return super.listen();
    } finally {
      _$_PurposeSessionPresenceCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBasePhaseForScreen(double updateCurrentPhaseLogic) {
    final _$actionInfo =
        _$_PurposeSessionPresenceCoordinatorBaseActionController.startAction(
            name:
                '_PurposeSessionPresenceCoordinatorBase.setBasePhaseForScreen');
    try {
      return super.setBasePhaseForScreen(updateCurrentPhaseLogic);
    } finally {
      _$_PurposeSessionPresenceCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timerStatusIsUpdated: ${timerStatusIsUpdated}
    ''';
  }
}

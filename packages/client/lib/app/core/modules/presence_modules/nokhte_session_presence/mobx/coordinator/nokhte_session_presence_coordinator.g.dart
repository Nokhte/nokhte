// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nokhte_session_presence_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NokhteSessionPresenceCoordinator
    on _NokhteSessionPresenceCoordinatorBase, Store {
  late final _$disposeAsyncAction = AsyncAction(
      '_NokhteSessionPresenceCoordinatorBase.dispose',
      context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_NokhteSessionPresenceCoordinatorBaseActionController =
      ActionController(
          name: '_NokhteSessionPresenceCoordinatorBase', context: context);

  @override
  dynamic initReactors(
      {required Function onCollaboratorJoined,
      required Function onCollaboratorLeft}) {
    final _$actionInfo =
        _$_NokhteSessionPresenceCoordinatorBaseActionController.startAction(
            name: '_NokhteSessionPresenceCoordinatorBase.initReactors');
    try {
      return super.initReactors(
          onCollaboratorJoined: onCollaboratorJoined,
          onCollaboratorLeft: onCollaboratorLeft);
    } finally {
      _$_NokhteSessionPresenceCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic listen() {
    final _$actionInfo = _$_NokhteSessionPresenceCoordinatorBaseActionController
        .startAction(name: '_NokhteSessionPresenceCoordinatorBase.listen');
    try {
      return super.listen();
    } finally {
      _$_NokhteSessionPresenceCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBasePhaseForScreen(double updateCurrentPhaseLogic) {
    final _$actionInfo =
        _$_NokhteSessionPresenceCoordinatorBaseActionController.startAction(
            name:
                '_NokhteSessionPresenceCoordinatorBase.setBasePhaseForScreen');
    try {
      return super.setBasePhaseForScreen(updateCurrentPhaseLogic);
    } finally {
      _$_NokhteSessionPresenceCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

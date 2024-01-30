// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaborator_pool_screen_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaboratorPoolScreenWidgetsCoordinator
    on _CollaboratorPoolScreenWidgetsCoordinatorBase, Store {
  late final _$isTransitioningToNokhteSessionAtom = Atom(
      name:
          '_CollaboratorPoolScreenWidgetsCoordinatorBase.isTransitioningToNokhteSession',
      context: context);

  @override
  bool get isTransitioningToNokhteSession {
    _$isTransitioningToNokhteSessionAtom.reportRead();
    return super.isTransitioningToNokhteSession;
  }

  @override
  set isTransitioningToNokhteSession(bool value) {
    _$isTransitioningToNokhteSessionAtom
        .reportWrite(value, super.isTransitioningToNokhteSession, () {
      super.isTransitioningToNokhteSession = value;
    });
  }

  late final _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_CollaboratorPoolScreenWidgetsCoordinatorBase',
          context: context);

  @override
  dynamic constructor() {
    final _$actionInfo =
        _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaboratorPoolScreenWidgetsCoordinatorBase.constructor');
    try {
      return super.constructor();
    } finally {
      _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInactive() {
    final _$actionInfo =
        _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaboratorPoolScreenWidgetsCoordinatorBase.onInactive');
    try {
      return super.onInactive();
    } finally {
      _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initTransition({bool isNokhteSession = false}) {
    final _$actionInfo =
        _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController.startAction(
            name:
                '_CollaboratorPoolScreenWidgetsCoordinatorBase.initTransition');
    try {
      return super.initTransition(isNokhteSession: isNokhteSession);
    } finally {
      _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onConnected() {
    final _$actionInfo =
        _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaboratorPoolScreenWidgetsCoordinatorBase.onConnected');
    try {
      return super.onConnected();
    } finally {
      _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDisconnected() {
    final _$actionInfo =
        _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController.startAction(
            name:
                '_CollaboratorPoolScreenWidgetsCoordinatorBase.onDisconnected');
    try {
      return super.onDisconnected();
    } finally {
      _$_CollaboratorPoolScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTransitioningToNokhteSession: ${isTransitioningToNokhteSession}
    ''';
  }
}

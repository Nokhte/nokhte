// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaboration_home_screen_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaborationHomeScreenCoordinator
    on _CollaborationHomeScreenCoordinatorBase, Store {
  late final _$isNavigatingAwayAtom = Atom(
      name: '_CollaborationHomeScreenCoordinatorBase.isNavigatingAway',
      context: context);

  @override
  bool get isNavigatingAway {
    _$isNavigatingAwayAtom.reportRead();
    return super.isNavigatingAway;
  }

  @override
  set isNavigatingAway(bool value) {
    _$isNavigatingAwayAtom.reportWrite(value, super.isNavigatingAway, () {
      super.isNavigatingAway = value;
    });
  }

  late final _$constructorAsyncAction = AsyncAction(
      '_CollaborationHomeScreenCoordinatorBase.constructor',
      context: context);

  @override
  Future constructor() {
    return _$constructorAsyncAction.run(() => super.constructor());
  }

  late final _$_CollaborationHomeScreenCoordinatorBaseActionController =
      ActionController(
          name: '_CollaborationHomeScreenCoordinatorBase', context: context);

  @override
  dynamic toggleIsNavigatingAway() {
    final _$actionInfo =
        _$_CollaborationHomeScreenCoordinatorBaseActionController.startAction(
            name:
                '_CollaborationHomeScreenCoordinatorBase.toggleIsNavigatingAway');
    try {
      return super.toggleIsNavigatingAway();
    } finally {
      _$_CollaborationHomeScreenCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onGradientTreeNodeTap() {
    final _$actionInfo =
        _$_CollaborationHomeScreenCoordinatorBaseActionController.startAction(
            name:
                '_CollaborationHomeScreenCoordinatorBase.onGradientTreeNodeTap');
    try {
      return super.onGradientTreeNodeTap();
    } finally {
      _$_CollaborationHomeScreenCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onFlowCompleted() {
    final _$actionInfo =
        _$_CollaborationHomeScreenCoordinatorBaseActionController.startAction(
            name: '_CollaborationHomeScreenCoordinatorBase.onFlowCompleted');
    try {
      return super.onFlowCompleted();
    } finally {
      _$_CollaborationHomeScreenCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNavigatingAway: ${isNavigatingAway}
    ''';
  }
}

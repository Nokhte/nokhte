// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaboration_home_screen_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaborationHomeScreenCoordinator
    on _CollaborationHomeScreenCoordinatorBase, Store {
  late final _$additionalRoutingDataAtom = Atom(
      name: '_CollaborationHomeScreenCoordinatorBase.additionalRoutingData',
      context: context);

  @override
  ObservableMap<dynamic, dynamic> get additionalRoutingData {
    _$additionalRoutingDataAtom.reportRead();
    return super.additionalRoutingData;
  }

  @override
  set additionalRoutingData(ObservableMap<dynamic, dynamic> value) {
    _$additionalRoutingDataAtom.reportWrite(value, super.additionalRoutingData,
        () {
      super.additionalRoutingData = value;
    });
  }

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

  late final _$onInvitationSharedAsyncAction = AsyncAction(
      '_CollaborationHomeScreenCoordinatorBase.onInvitationShared',
      context: context);

  @override
  Future onInvitationShared(bool isShared) {
    return _$onInvitationSharedAsyncAction
        .run(() => super.onInvitationShared(isShared));
  }

  late final _$_CollaborationHomeScreenCoordinatorBaseActionController =
      ActionController(
          name: '_CollaborationHomeScreenCoordinatorBase', context: context);

  @override
  dynamic setAdditionalRoutingData(Map<dynamic, dynamic>? newMap) {
    final _$actionInfo =
        _$_CollaborationHomeScreenCoordinatorBaseActionController.startAction(
            name:
                '_CollaborationHomeScreenCoordinatorBase.setAdditionalRoutingData');
    try {
      return super.setAdditionalRoutingData(newMap);
    } finally {
      _$_CollaborationHomeScreenCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

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
  dynamic onEnterCollaboratorPool() {
    final _$actionInfo =
        _$_CollaborationHomeScreenCoordinatorBaseActionController.startAction(
            name:
                '_CollaborationHomeScreenCoordinatorBase.onEnterCollaboratorPool');
    try {
      return super.onEnterCollaboratorPool();
    } finally {
      _$_CollaborationHomeScreenCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDeepLinkOpened(String path) {
    final _$actionInfo =
        _$_CollaborationHomeScreenCoordinatorBaseActionController.startAction(
            name: '_CollaborationHomeScreenCoordinatorBase.onDeepLinkOpened');
    try {
      return super.onDeepLinkOpened(path);
    } finally {
      _$_CollaborationHomeScreenCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSwipe(GestureDirections direction) {
    final _$actionInfo =
        _$_CollaborationHomeScreenCoordinatorBaseActionController.startAction(
            name: '_CollaborationHomeScreenCoordinatorBase.onSwipe');
    try {
      return super.onSwipe(direction);
    } finally {
      _$_CollaborationHomeScreenCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
additionalRoutingData: ${additionalRoutingData},
isNavigatingAway: ${isNavigatingAway}
    ''';
  }
}

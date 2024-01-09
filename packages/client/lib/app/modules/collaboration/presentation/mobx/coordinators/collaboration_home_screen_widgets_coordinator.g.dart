// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaboration_home_screen_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaborationHomeScreenWidgetsCoordinator
    on _CollaborationHomeScreenWidgetsCoordinatorBase, Store {
  late final _$invitationIsSentAtom = Atom(
      name: '_CollaborationHomeScreenWidgetsCoordinatorBase.invitationIsSent',
      context: context);

  @override
  bool get invitationIsSent {
    _$invitationIsSentAtom.reportRead();
    return super.invitationIsSent;
  }

  @override
  set invitationIsSent(bool value) {
    _$invitationIsSentAtom.reportWrite(value, super.invitationIsSent, () {
      super.invitationIsSent = value;
    });
  }

  late final _$isDisconnectedAtom = Atom(
      name: '_CollaborationHomeScreenWidgetsCoordinatorBase.isDisconnected',
      context: context);

  @override
  bool get isDisconnected {
    _$isDisconnectedAtom.reportRead();
    return super.isDisconnected;
  }

  @override
  set isDisconnected(bool value) {
    _$isDisconnectedAtom.reportWrite(value, super.isDisconnected, () {
      super.isDisconnected = value;
    });
  }

  late final _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_CollaborationHomeScreenWidgetsCoordinatorBase',
          context: context);

  @override
  dynamic toggleIsDisconnected() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.toggleIsDisconnected');
    try {
      return super.toggleIsDisconnected();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleInvitationIsSent() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.toggleInvitationIsSent');
    try {
      return super.toggleInvitationIsSent();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onConnected() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.onConnected');
    try {
      return super.onConnected();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDisconnected() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.onDisconnected');
    try {
      return super.onDisconnected();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onResumed() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.onResumed');
    try {
      return super.onResumed();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInactive() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.onInactive');
    try {
      return super.onInactive();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic constructor() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.constructor');
    try {
      return super.constructor();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic invitationFlowConstructor() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.invitationFlowConstructor');
    try {
      return super.invitationFlowConstructor();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic postInvitationFlowNoInviteConstructor() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.postInvitationFlowNoInviteConstructor');
    try {
      return super.postInvitationFlowNoInviteConstructor();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic postInvitationFlowConstructor() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.postInvitationFlowConstructor');
    try {
      return super.postInvitationFlowConstructor();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSwipeDown() {
    final _$actionInfo =
        _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollaborationHomeScreenWidgetsCoordinatorBase.onSwipeDown');
    try {
      return super.onSwipeDown();
    } finally {
      _$_CollaborationHomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
invitationIsSent: ${invitationIsSent},
isDisconnected: ${isDisconnected}
    ''';
  }
}

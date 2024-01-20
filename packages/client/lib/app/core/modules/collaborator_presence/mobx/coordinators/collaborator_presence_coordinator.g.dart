// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaborator_presence_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaboratorPresenceCoordinator
    on _CollaboratorPresenceCoordinatorBase, Store {
  late final _$callStatusIsUpdatedAtom = Atom(
      name: '_CollaboratorPresenceCoordinatorBase.callStatusIsUpdated',
      context: context);

  @override
  bool get callStatusIsUpdated {
    _$callStatusIsUpdatedAtom.reportRead();
    return super.callStatusIsUpdated;
  }

  @override
  set callStatusIsUpdated(bool value) {
    _$callStatusIsUpdatedAtom.reportWrite(value, super.callStatusIsUpdated, () {
      super.callStatusIsUpdated = value;
    });
  }

  late final _$onlineStatusIsUpdatedAtom = Atom(
      name: '_CollaboratorPresenceCoordinatorBase.onlineStatusIsUpdated',
      context: context);

  @override
  bool get onlineStatusIsUpdated {
    _$onlineStatusIsUpdatedAtom.reportRead();
    return super.onlineStatusIsUpdated;
  }

  @override
  set onlineStatusIsUpdated(bool value) {
    _$onlineStatusIsUpdatedAtom.reportWrite(value, super.onlineStatusIsUpdated,
        () {
      super.onlineStatusIsUpdated = value;
    });
  }

  late final _$timerStatusIsUpdatedAtom = Atom(
      name: '_CollaboratorPresenceCoordinatorBase.timerStatusIsUpdated',
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

  late final _$whoIsTalkingIsUpdatedAtom = Atom(
      name: '_CollaboratorPresenceCoordinatorBase.whoIsTalkingIsUpdated',
      context: context);

  @override
  bool get whoIsTalkingIsUpdated {
    _$whoIsTalkingIsUpdatedAtom.reportRead();
    return super.whoIsTalkingIsUpdated;
  }

  @override
  set whoIsTalkingIsUpdated(bool value) {
    _$whoIsTalkingIsUpdatedAtom.reportWrite(value, super.whoIsTalkingIsUpdated,
        () {
      super.whoIsTalkingIsUpdated = value;
    });
  }

  late final _$currentPhaseIsUpdatedAtom = Atom(
      name: '_CollaboratorPresenceCoordinatorBase.currentPhaseIsUpdated',
      context: context);

  @override
  bool get currentPhaseIsUpdated {
    _$currentPhaseIsUpdatedAtom.reportRead();
    return super.currentPhaseIsUpdated;
  }

  @override
  set currentPhaseIsUpdated(bool value) {
    _$currentPhaseIsUpdatedAtom.reportWrite(value, super.currentPhaseIsUpdated,
        () {
      super.currentPhaseIsUpdated = value;
    });
  }

  late final _$isListeningAtom = Atom(
      name: '_CollaboratorPresenceCoordinatorBase.isListening',
      context: context);

  @override
  bool get isListening {
    _$isListeningAtom.reportRead();
    return super.isListening;
  }

  @override
  set isListening(bool value) {
    _$isListeningAtom.reportWrite(value, super.isListening, () {
      super.isListening = value;
    });
  }

  late final _$updateCallStatusAsyncAction = AsyncAction(
      '_CollaboratorPresenceCoordinatorBase.updateCallStatus',
      context: context);

  @override
  Future updateCallStatus(UpdatePresencePropertyParams params) {
    return _$updateCallStatusAsyncAction
        .run(() => super.updateCallStatus(params));
  }

  late final _$updateOnlineStatusAsyncAction = AsyncAction(
      '_CollaboratorPresenceCoordinatorBase.updateOnlineStatus',
      context: context);

  @override
  Future updateOnlineStatus(UpdatePresencePropertyParams params) {
    return _$updateOnlineStatusAsyncAction
        .run(() => super.updateOnlineStatus(params));
  }

  late final _$updateTimerStatusAsyncAction = AsyncAction(
      '_CollaboratorPresenceCoordinatorBase.updateTimerStatus',
      context: context);

  @override
  Future updateTimerStatus(bool params) {
    return _$updateTimerStatusAsyncAction
        .run(() => super.updateTimerStatus(params));
  }

  late final _$updateWhoIsTalkingAsyncAction = AsyncAction(
      '_CollaboratorPresenceCoordinatorBase.updateWhoIsTalking',
      context: context);

  @override
  Future updateWhoIsTalking(UpdateWhoIsTalkingParams params) {
    return _$updateWhoIsTalkingAsyncAction
        .run(() => super.updateWhoIsTalking(params));
  }

  late final _$updateCurrentPhaseAsyncAction = AsyncAction(
      '_CollaboratorPresenceCoordinatorBase.updateCurrentPhase',
      context: context);

  @override
  Future updateCurrentPhase(UpdateCurrentPhaseParams params) {
    return _$updateCurrentPhaseAsyncAction
        .run(() => super.updateCurrentPhase(params));
  }

  late final _$disposeAsyncAction = AsyncAction(
      '_CollaboratorPresenceCoordinatorBase.dispose',
      context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_CollaboratorPresenceCoordinatorBaseActionController =
      ActionController(
          name: '_CollaboratorPresenceCoordinatorBase', context: context);

  @override
  dynamic listen() {
    final _$actionInfo = _$_CollaboratorPresenceCoordinatorBaseActionController
        .startAction(name: '_CollaboratorPresenceCoordinatorBase.listen');
    try {
      return super.listen();
    } finally {
      _$_CollaboratorPresenceCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentPhase(double currentPhase) {
    final _$actionInfo =
        _$_CollaboratorPresenceCoordinatorBaseActionController.startAction(
            name: '_CollaboratorPresenceCoordinatorBase.setCurrentPhase');
    try {
      return super.setCurrentPhase(currentPhase);
    } finally {
      _$_CollaboratorPresenceCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
callStatusIsUpdated: ${callStatusIsUpdated},
onlineStatusIsUpdated: ${onlineStatusIsUpdated},
timerStatusIsUpdated: ${timerStatusIsUpdated},
whoIsTalkingIsUpdated: ${whoIsTalkingIsUpdated},
currentPhaseIsUpdated: ${currentPhaseIsUpdated},
isListening: ${isListening}
    ''';
  }
}

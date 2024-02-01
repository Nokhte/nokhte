// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_presence_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BasePresenceCoordinator<T> on _BasePresenceCoordinatorBase<T>, Store {
  late final _$callStatusIsUpdatedAtom = Atom(
      name: '_BasePresenceCoordinatorBase.callStatusIsUpdated',
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
      name: '_BasePresenceCoordinatorBase.onlineStatusIsUpdated',
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

  late final _$whoIsTalkingIsUpdatedAtom = Atom(
      name: '_BasePresenceCoordinatorBase.whoIsTalkingIsUpdated',
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
      name: '_BasePresenceCoordinatorBase.currentPhaseIsUpdated',
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

  late final _$isListeningAtom =
      Atom(name: '_BasePresenceCoordinatorBase.isListening', context: context);

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

  late final _$updateOnlineStatusAsyncAction = AsyncAction(
      '_BasePresenceCoordinatorBase.updateOnlineStatus',
      context: context);

  @override
  Future updateOnlineStatus(UpdatePresencePropertyParams params) {
    return _$updateOnlineStatusAsyncAction
        .run(() => super.updateOnlineStatus(params));
  }

  late final _$updateWhoIsTalkingAsyncAction = AsyncAction(
      '_BasePresenceCoordinatorBase.updateWhoIsTalking',
      context: context);

  @override
  Future updateWhoIsTalking(UpdateWhoIsTalkingParams params) {
    return _$updateWhoIsTalkingAsyncAction
        .run(() => super.updateWhoIsTalking(params));
  }

  late final _$updateCurrentPhaseAsyncAction = AsyncAction(
      '_BasePresenceCoordinatorBase.updateCurrentPhase',
      context: context);

  @override
  Future updateCurrentPhase(double params) {
    return _$updateCurrentPhaseAsyncAction
        .run(() => super.updateCurrentPhase(params));
  }

  late final _$disposeAsyncAction =
      AsyncAction('_BasePresenceCoordinatorBase.dispose', context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_BasePresenceCoordinatorBaseActionController =
      ActionController(name: '_BasePresenceCoordinatorBase', context: context);

  @override
  dynamic initReactors(
      {required Function onCollaboratorJoined,
      required Function onCollaboratorLeft}) {
    final _$actionInfo = _$_BasePresenceCoordinatorBaseActionController
        .startAction(name: '_BasePresenceCoordinatorBase.initReactors');
    try {
      return super.initReactors(
          onCollaboratorJoined: onCollaboratorJoined,
          onCollaboratorLeft: onCollaboratorLeft);
    } finally {
      _$_BasePresenceCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic listen() {
    final _$actionInfo = _$_BasePresenceCoordinatorBaseActionController
        .startAction(name: '_BasePresenceCoordinatorBase.listen');
    try {
      return super.listen();
    } finally {
      _$_BasePresenceCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBasePhaseForScreen(double updateCurrentPhaseLogic) {
    final _$actionInfo =
        _$_BasePresenceCoordinatorBaseActionController.startAction(
            name: '_BasePresenceCoordinatorBase.setBasePhaseForScreen');
    try {
      return super.setBasePhaseForScreen(updateCurrentPhaseLogic);
    } finally {
      _$_BasePresenceCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
callStatusIsUpdated: ${callStatusIsUpdated},
onlineStatusIsUpdated: ${onlineStatusIsUpdated},
whoIsTalkingIsUpdated: ${whoIsTalkingIsUpdated},
currentPhaseIsUpdated: ${currentPhaseIsUpdated},
isListening: ${isListening}
    ''';
  }
}

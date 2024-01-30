// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaboration_logic_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaborationLogicCoordinator
    on _CollaborationLogicCoordinatorBase, Store {
  late final _$collaboratorSearchStatusIsListeningAtom = Atom(
      name:
          '_CollaborationLogicCoordinatorBase.collaboratorSearchStatusIsListening',
      context: context);

  @override
  bool get collaboratorSearchStatusIsListening {
    _$collaboratorSearchStatusIsListeningAtom.reportRead();
    return super.collaboratorSearchStatusIsListening;
  }

  @override
  set collaboratorSearchStatusIsListening(bool value) {
    _$collaboratorSearchStatusIsListeningAtom
        .reportWrite(value, super.collaboratorSearchStatusIsListening, () {
      super.collaboratorSearchStatusIsListening = value;
    });
  }

  late final _$nokhteSearchStatusIsListeningAtom = Atom(
      name: '_CollaborationLogicCoordinatorBase.nokhteSearchStatusIsListening',
      context: context);

  @override
  bool get nokhteSearchStatusIsListening {
    _$nokhteSearchStatusIsListeningAtom.reportRead();
    return super.nokhteSearchStatusIsListening;
  }

  @override
  set nokhteSearchStatusIsListening(bool value) {
    _$nokhteSearchStatusIsListeningAtom
        .reportWrite(value, super.nokhteSearchStatusIsListening, () {
      super.nokhteSearchStatusIsListening = value;
    });
  }

  late final _$hasEnteredAtom = Atom(
      name: '_CollaborationLogicCoordinatorBase.hasEntered', context: context);

  @override
  bool get hasEntered {
    _$hasEnteredAtom.reportRead();
    return super.hasEntered;
  }

  @override
  set hasEntered(bool value) {
    _$hasEnteredAtom.reportWrite(value, super.hasEntered, () {
      super.hasEntered = value;
    });
  }

  late final _$collaboratorSearchStatusAtom = Atom(
      name: '_CollaborationLogicCoordinatorBase.collaboratorSearchStatus',
      context: context);

  @override
  ObservableStream<bool> get collaboratorSearchStatus {
    _$collaboratorSearchStatusAtom.reportRead();
    return super.collaboratorSearchStatus;
  }

  @override
  set collaboratorSearchStatus(ObservableStream<bool> value) {
    _$collaboratorSearchStatusAtom
        .reportWrite(value, super.collaboratorSearchStatus, () {
      super.collaboratorSearchStatus = value;
    });
  }

  late final _$nokhteSearchStatusAtom = Atom(
      name: '_CollaborationLogicCoordinatorBase.nokhteSearchStatus',
      context: context);

  @override
  ObservableStream<bool> get nokhteSearchStatus {
    _$nokhteSearchStatusAtom.reportRead();
    return super.nokhteSearchStatus;
  }

  @override
  set nokhteSearchStatus(ObservableStream<bool> value) {
    _$nokhteSearchStatusAtom.reportWrite(value, super.nokhteSearchStatus, () {
      super.nokhteSearchStatus = value;
    });
  }

  late final _$hasFoundCollaboratorAtom = Atom(
      name: '_CollaborationLogicCoordinatorBase.hasFoundCollaborator',
      context: context);

  @override
  bool get hasFoundCollaborator {
    _$hasFoundCollaboratorAtom.reportRead();
    return super.hasFoundCollaborator;
  }

  @override
  set hasFoundCollaborator(bool value) {
    _$hasFoundCollaboratorAtom.reportWrite(value, super.hasFoundCollaborator,
        () {
      super.hasFoundCollaborator = value;
    });
  }

  late final _$hasFoundNokhteSessionAtom = Atom(
      name: '_CollaborationLogicCoordinatorBase.hasFoundNokhteSession',
      context: context);

  @override
  bool get hasFoundNokhteSession {
    _$hasFoundNokhteSessionAtom.reportRead();
    return super.hasFoundNokhteSession;
  }

  @override
  set hasFoundNokhteSession(bool value) {
    _$hasFoundNokhteSessionAtom.reportWrite(value, super.hasFoundNokhteSession,
        () {
      super.hasFoundNokhteSession = value;
    });
  }

  late final _$disposeAsyncAction = AsyncAction(
      '_CollaborationLogicCoordinatorBase.dispose',
      context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$listenToCollaboratorSearchAsyncAction = AsyncAction(
      '_CollaborationLogicCoordinatorBase.listenToCollaboratorSearch',
      context: context);

  @override
  Future listenToCollaboratorSearch() {
    return _$listenToCollaboratorSearchAsyncAction
        .run(() => super.listenToCollaboratorSearch());
  }

  late final _$listenToNokhteSearchAsyncAction = AsyncAction(
      '_CollaborationLogicCoordinatorBase.listenToNokhteSearch',
      context: context);

  @override
  Future listenToNokhteSearch() {
    return _$listenToNokhteSearchAsyncAction
        .run(() => super.listenToNokhteSearch());
  }

  late final _$enterAsyncAction =
      AsyncAction('_CollaborationLogicCoordinatorBase.enter', context: context);

  @override
  Future enter(EnterCollaboratorPoolParams collaboratorUID) {
    return _$enterAsyncAction.run(() => super.enter(collaboratorUID));
  }

  late final _$exitAsyncAction =
      AsyncAction('_CollaborationLogicCoordinatorBase.exit', context: context);

  @override
  Future exit() {
    return _$exitAsyncAction.run(() => super.exit());
  }

  @override
  String toString() {
    return '''
collaboratorSearchStatusIsListening: ${collaboratorSearchStatusIsListening},
nokhteSearchStatusIsListening: ${nokhteSearchStatusIsListening},
hasEntered: ${hasEntered},
collaboratorSearchStatus: ${collaboratorSearchStatus},
nokhteSearchStatus: ${nokhteSearchStatus},
hasFoundCollaborator: ${hasFoundCollaborator},
hasFoundNokhteSession: ${hasFoundNokhteSession}
    ''';
  }
}

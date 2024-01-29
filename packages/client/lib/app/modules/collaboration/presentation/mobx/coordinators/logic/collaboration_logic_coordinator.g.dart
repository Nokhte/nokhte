// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaboration_logic_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaborationLogicCoordinator
    on _CollaborationLogicCoordinatorBase, Store {
  late final _$searchStatusIsListeningAtom = Atom(
      name: '_CollaborationLogicCoordinatorBase.searchStatusIsListening',
      context: context);

  @override
  bool get searchStatusIsListening {
    _$searchStatusIsListeningAtom.reportRead();
    return super.searchStatusIsListening;
  }

  @override
  set searchStatusIsListening(bool value) {
    _$searchStatusIsListeningAtom
        .reportWrite(value, super.searchStatusIsListening, () {
      super.searchStatusIsListening = value;
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

  late final _$searchStatusAtom = Atom(
      name: '_CollaborationLogicCoordinatorBase.searchStatus',
      context: context);

  @override
  ObservableStream<bool> get searchStatus {
    _$searchStatusAtom.reportRead();
    return super.searchStatus;
  }

  @override
  set searchStatus(ObservableStream<bool> value) {
    _$searchStatusAtom.reportWrite(value, super.searchStatus, () {
      super.searchStatus = value;
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

  late final _$disposeAsyncAction = AsyncAction(
      '_CollaborationLogicCoordinatorBase.dispose',
      context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$listenAsyncAction = AsyncAction(
      '_CollaborationLogicCoordinatorBase.listen',
      context: context);

  @override
  Future listen() {
    return _$listenAsyncAction.run(() => super.listen());
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
searchStatusIsListening: ${searchStatusIsListening},
hasEntered: ${hasEntered},
searchStatus: ${searchStatus},
hasFoundCollaborator: ${hasFoundCollaborator}
    ''';
  }
}

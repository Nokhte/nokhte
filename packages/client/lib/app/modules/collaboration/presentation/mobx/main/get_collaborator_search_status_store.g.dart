// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collaborator_search_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCollaboratorSearchStatusStore
    on _GetCollaboratorSearchStatusStoreBase, Store {
  late final _$searchStatusAtom = Atom(
      name: '_GetCollaboratorSearchStatusStoreBase.searchStatus',
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

  late final _$errorMessageAtom = Atom(
      name: '_GetCollaboratorSearchStatusStoreBase.errorMessage',
      context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$hasFoundCollaboratorAtom = Atom(
      name: '_GetCollaboratorSearchStatusStoreBase.hasFoundCollaborator',
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

  late final _$stateAtom = Atom(
      name: '_GetCollaboratorSearchStatusStoreBase.state', context: context);

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$disposeAsyncAction = AsyncAction(
      '_GetCollaboratorSearchStatusStoreBase.dispose',
      context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_GetCollaboratorSearchStatusStoreBaseActionController =
      ActionController(
          name: '_GetCollaboratorSearchStatusStoreBase', context: context);

  @override
  dynamic toggleHasFoundCollaborator() {
    final _$actionInfo =
        _$_GetCollaboratorSearchStatusStoreBaseActionController.startAction(
            name:
                '_GetCollaboratorSearchStatusStoreBase.toggleHasFoundCollaborator');
    try {
      return super.toggleHasFoundCollaborator();
    } finally {
      _$_GetCollaboratorSearchStatusStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetStream() {
    final _$actionInfo = _$_GetCollaboratorSearchStatusStoreBaseActionController
        .startAction(name: '_GetCollaboratorSearchStatusStoreBase.resetStream');
    try {
      return super.resetStream();
    } finally {
      _$_GetCollaboratorSearchStatusStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchStatus: ${searchStatus},
errorMessage: ${errorMessage},
hasFoundCollaborator: ${hasFoundCollaborator},
state: ${state}
    ''';
  }
}

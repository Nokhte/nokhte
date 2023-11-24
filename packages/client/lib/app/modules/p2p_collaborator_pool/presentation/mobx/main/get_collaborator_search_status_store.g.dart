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
  ObservableStream<CollaboratorSearchAndEntryStatus> get searchStatus {
    _$searchStatusAtom.reportRead();
    return super.searchStatus;
  }

  @override
  set searchStatus(ObservableStream<CollaboratorSearchAndEntryStatus> value) {
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

  @override
  String toString() {
    return '''
searchStatus: ${searchStatus},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}

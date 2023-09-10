// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collaborator_presence_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCollaboratorPresenceStore
    on _GetCollaboratorPresenceStoreBase, Store {
  late final _$collaboratorPresenceAtom = Atom(
      name: '_GetCollaboratorPresenceStoreBase.collaboratorPresence',
      context: context);

  @override
  ObservableStream<bool> get collaboratorPresence {
    _$collaboratorPresenceAtom.reportRead();
    return super.collaboratorPresence;
  }

  @override
  set collaboratorPresence(ObservableStream<bool> value) {
    _$collaboratorPresenceAtom.reportWrite(value, super.collaboratorPresence,
        () {
      super.collaboratorPresence = value;
    });
  }

  @override
  String toString() {
    return '''
collaboratorPresence: ${collaboratorPresence}
    ''';
  }
}

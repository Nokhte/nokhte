// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collaborator_phrase_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCollaboratorPhraseStore on _GetCollaboratorPhraseStoreBase, Store {
  late final _$collaboratorPhraseAtom = Atom(
      name: '_GetCollaboratorPhraseStoreBase.collaboratorPhrase',
      context: context);

  @override
  String get collaboratorPhrase {
    _$collaboratorPhraseAtom.reportRead();
    return super.collaboratorPhrase;
  }

  @override
  set collaboratorPhrase(String value) {
    _$collaboratorPhraseAtom.reportWrite(value, super.collaboratorPhrase, () {
      super.collaboratorPhrase = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetCollaboratorPhraseStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
collaboratorPhrase: ${collaboratorPhrase}
    ''';
  }
}

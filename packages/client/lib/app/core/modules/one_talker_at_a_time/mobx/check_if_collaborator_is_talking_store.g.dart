// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_if_collaborator_is_talking_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckIfCollaboratorIsTalkingStore
    on _CheckIfCollaboratorIsTalkingStoreBase, Store {
  late final _$collaboratorIsTalkingAtom = Atom(
      name: '_CheckIfCollaboratorIsTalkingStoreBase.collaboratorIsTalking',
      context: context);

  @override
  ObservableStream<bool> get collaboratorIsTalking {
    _$collaboratorIsTalkingAtom.reportRead();
    return super.collaboratorIsTalking;
  }

  @override
  set collaboratorIsTalking(ObservableStream<bool> value) {
    _$collaboratorIsTalkingAtom.reportWrite(value, super.collaboratorIsTalking,
        () {
      super.collaboratorIsTalking = value;
    });
  }

  @override
  String toString() {
    return '''
collaboratorIsTalking: ${collaboratorIsTalking}
    ''';
  }
}

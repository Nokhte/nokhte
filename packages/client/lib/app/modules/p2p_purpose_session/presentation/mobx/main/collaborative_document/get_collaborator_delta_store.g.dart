// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collaborator_delta_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCollaboratorDeltaStore on _GetCollaboratorDeltaStoreBase, Store {
  late final _$collaboratorDeltaAtom = Atom(
      name: '_GetCollaboratorDeltaStoreBase.collaboratorDelta',
      context: context);

  @override
  ObservableStream<int> get collaboratorDelta {
    _$collaboratorDeltaAtom.reportRead();
    return super.collaboratorDelta;
  }

  @override
  set collaboratorDelta(ObservableStream<int> value) {
    _$collaboratorDeltaAtom.reportWrite(value, super.collaboratorDelta, () {
      super.collaboratorDelta = value;
    });
  }

  @override
  String toString() {
    return '''
collaboratorDelta: ${collaboratorDelta}
    ''';
  }
}

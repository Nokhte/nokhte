// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collaborator_doc_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCollaboratorDocInfoStore on _GetCollaboratorDocInfoStoreBase, Store {
  late final _$collaboratorDocinfoAtom = Atom(
      name: '_GetCollaboratorDocInfoStoreBase.collaboratorDocinfo',
      context: context);

  @override
  ObservableStream<CollaboratorDocInfo> get collaboratorDocinfo {
    _$collaboratorDocinfoAtom.reportRead();
    return super.collaboratorDocinfo;
  }

  @override
  set collaboratorDocinfo(ObservableStream<CollaboratorDocInfo> value) {
    _$collaboratorDocinfoAtom.reportWrite(value, super.collaboratorDocinfo, () {
      super.collaboratorDocinfo = value;
    });
  }

  @override
  String toString() {
    return '''
collaboratorDocinfo: ${collaboratorDocinfo}
    ''';
  }
}

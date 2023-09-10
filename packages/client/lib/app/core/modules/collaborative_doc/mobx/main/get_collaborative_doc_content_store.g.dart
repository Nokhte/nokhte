// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collaborative_doc_content_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCollaborativeDocContentStore
    on _GetCollaborativeDocContentStoreBase, Store {
  late final _$docContentAtom = Atom(
      name: '_GetCollaborativeDocContentStoreBase.docContent',
      context: context);

  @override
  ObservableStream<String> get docContent {
    _$docContentAtom.reportRead();
    return super.docContent;
  }

  @override
  set docContent(ObservableStream<String> value) {
    _$docContentAtom.reportWrite(value, super.docContent, () {
      super.docContent = value;
    });
  }

  @override
  String toString() {
    return '''
docContent: ${docContent}
    ''';
  }
}

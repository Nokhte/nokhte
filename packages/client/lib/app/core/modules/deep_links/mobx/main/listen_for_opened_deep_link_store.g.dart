// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listen_for_opened_deep_link_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListenForOpenedDeepLinkStore
    on _ListenForOpenedDeepLinkStoreBase, Store {
  late final _$deepLinkSreamAtom = Atom(
      name: '_ListenForOpenedDeepLinkStoreBase.deepLinkSream',
      context: context);

  @override
  ObservableStream<Map<dynamic, dynamic>> get deepLinkSream {
    _$deepLinkSreamAtom.reportRead();
    return super.deepLinkSream;
  }

  @override
  set deepLinkSream(ObservableStream<Map<dynamic, dynamic>> value) {
    _$deepLinkSreamAtom.reportWrite(value, super.deepLinkSream, () {
      super.deepLinkSream = value;
    });
  }

  late final _$pathAtom =
      Atom(name: '_ListenForOpenedDeepLinkStoreBase.path', context: context);

  @override
  String get path {
    _$pathAtom.reportRead();
    return super.path;
  }

  @override
  set path(String value) {
    _$pathAtom.reportWrite(value, super.path, () {
      super.path = value;
    });
  }

  late final _$additionalMetadataAtom = Atom(
      name: '_ListenForOpenedDeepLinkStoreBase.additionalMetadata',
      context: context);

  @override
  ObservableMap<dynamic, dynamic> get additionalMetadata {
    _$additionalMetadataAtom.reportRead();
    return super.additionalMetadata;
  }

  @override
  set additionalMetadata(ObservableMap<dynamic, dynamic> value) {
    _$additionalMetadataAtom.reportWrite(value, super.additionalMetadata, () {
      super.additionalMetadata = value;
    });
  }

  late final _$_ListenForOpenedDeepLinkStoreBaseActionController =
      ActionController(
          name: '_ListenForOpenedDeepLinkStoreBase', context: context);

  @override
  dynamic call(NoParams params) {
    final _$actionInfo = _$_ListenForOpenedDeepLinkStoreBaseActionController
        .startAction(name: '_ListenForOpenedDeepLinkStoreBase.call');
    try {
      return super.call(params);
    } finally {
      _$_ListenForOpenedDeepLinkStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deepLinkSream: ${deepLinkSream},
path: ${path},
additionalMetadata: ${additionalMetadata}
    ''';
  }
}

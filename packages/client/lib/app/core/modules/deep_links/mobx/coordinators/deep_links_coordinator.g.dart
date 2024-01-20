// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_links_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeepLinksCoordinator on _DeepLinksCoordinatorBase, Store {
  late final _$linkAtom =
      Atom(name: '_DeepLinksCoordinatorBase.link', context: context);

  @override
  String get link {
    _$linkAtom.reportRead();
    return super.link;
  }

  @override
  set link(String value) {
    _$linkAtom.reportWrite(value, super.link, () {
      super.link = value;
    });
  }

  late final _$isSharedAtom =
      Atom(name: '_DeepLinksCoordinatorBase.isShared', context: context);

  @override
  bool get isShared {
    _$isSharedAtom.reportRead();
    return super.isShared;
  }

  @override
  set isShared(bool value) {
    _$isSharedAtom.reportWrite(value, super.isShared, () {
      super.isShared = value;
    });
  }

  late final _$getDeepLinkAsyncAction =
      AsyncAction('_DeepLinksCoordinatorBase.getDeepLink', context: context);

  @override
  Future getDeepLink(DeepLinkTypes params) {
    return _$getDeepLinkAsyncAction.run(() => super.getDeepLink(params));
  }

  late final _$shareAsyncAction =
      AsyncAction('_DeepLinksCoordinatorBase.share', context: context);

  @override
  Future share(String link) {
    return _$shareAsyncAction.run(() => super.share(link));
  }

  @override
  String toString() {
    return '''
link: ${link},
isShared: ${isShared}
    ''';
  }
}

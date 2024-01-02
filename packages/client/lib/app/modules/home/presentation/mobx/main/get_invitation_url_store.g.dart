// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_invitation_url_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetInvitationURLStore on _GetInvitationURLStoreBase, Store {
  late final _$linkAtom =
      Atom(name: '_GetInvitationURLStoreBase.link', context: context);

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

  late final _$futureStoreAtom =
      Atom(name: '_GetInvitationURLStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CollaborationInvitationDataEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CollaborationInvitationDataEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetInvitationURLStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
link: ${link},
futureStore: ${futureStore}
    ''';
  }
}

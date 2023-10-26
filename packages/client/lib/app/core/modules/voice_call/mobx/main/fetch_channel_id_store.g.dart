// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_channel_id_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchChannelIdStore on _FetchChannelIdStoreBase, Store {
  late final _$channelIdAtom =
      Atom(name: '_FetchChannelIdStoreBase.channelId', context: context);

  @override
  String get channelId {
    _$channelIdAtom.reportRead();
    return super.channelId;
  }

  @override
  set channelId(String value) {
    _$channelIdAtom.reportWrite(value, super.channelId, () {
      super.channelId = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_FetchChannelIdStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<ChannelIdEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<ChannelIdEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_FetchChannelIdStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
channelId: ${channelId},
futureStore: ${futureStore}
    ''';
  }
}

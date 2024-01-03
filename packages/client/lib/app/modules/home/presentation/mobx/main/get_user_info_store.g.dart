// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetUserInfoStore on _GetUserInfoStoreBase, Store {
  late final _$hasGoneThroughInvitationFlowAtom = Atom(
      name: '_GetUserInfoStoreBase.hasGoneThroughInvitationFlow',
      context: context);

  @override
  bool get hasGoneThroughInvitationFlow {
    _$hasGoneThroughInvitationFlowAtom.reportRead();
    return super.hasGoneThroughInvitationFlow;
  }

  @override
  set hasGoneThroughInvitationFlow(bool value) {
    _$hasGoneThroughInvitationFlowAtom
        .reportWrite(value, super.hasGoneThroughInvitationFlow, () {
      super.hasGoneThroughInvitationFlow = value;
    });
  }

  late final _$hasSentAnInvitationAtom =
      Atom(name: '_GetUserInfoStoreBase.hasSentAnInvitation', context: context);

  @override
  bool get hasSentAnInvitation {
    _$hasSentAnInvitationAtom.reportRead();
    return super.hasSentAnInvitation;
  }

  @override
  set hasSentAnInvitation(bool value) {
    _$hasSentAnInvitationAtom.reportWrite(value, super.hasSentAnInvitation, () {
      super.hasSentAnInvitation = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_GetUserInfoStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<UserJourneyInfoEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<UserJourneyInfoEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetUserInfoStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
hasGoneThroughInvitationFlow: ${hasGoneThroughInvitationFlow},
hasSentAnInvitation: ${hasSentAnInvitation},
futureStore: ${futureStore}
    ''';
  }
}

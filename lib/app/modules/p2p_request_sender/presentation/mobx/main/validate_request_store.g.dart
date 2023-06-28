// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_request_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ValidateRequestStore on _ValidateRequestStoreBase, Store {
  late final _$futureStoreAtom =
      Atom(name: '_ValidateRequestStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<P2PRequestRecipientEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<P2PRequestRecipientEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$recipientExistsAtom =
      Atom(name: '_ValidateRequestStoreBase.recipientExists', context: context);

  @override
  bool get recipientExists {
    _$recipientExistsAtom.reportRead();
    return super.recipientExists;
  }

  @override
  set recipientExists(bool value) {
    _$recipientExistsAtom.reportWrite(value, super.recipientExists, () {
      super.recipientExists = value;
    });
  }

  late final _$duplicateSenderAtom =
      Atom(name: '_ValidateRequestStoreBase.duplicateSender', context: context);

  @override
  bool get duplicateSender {
    _$duplicateSenderAtom.reportRead();
    return super.duplicateSender;
  }

  @override
  set duplicateSender(bool value) {
    _$duplicateSenderAtom.reportWrite(value, super.duplicateSender, () {
      super.duplicateSender = value;
    });
  }

  late final _$duplicateRecipientAtom = Atom(
      name: '_ValidateRequestStoreBase.duplicateRecipient', context: context);

  @override
  bool get duplicateRecipient {
    _$duplicateRecipientAtom.reportRead();
    return super.duplicateRecipient;
  }

  @override
  set duplicateRecipient(bool value) {
    _$duplicateRecipientAtom.reportWrite(value, super.duplicateRecipient, () {
      super.duplicateRecipient = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_ValidateRequestStoreBase.call', context: context);

  @override
  Future<void> call(P2PReqRecipientParams param) {
    return _$callAsyncAction.run(() => super.call(param));
  }

  late final _$_ValidateRequestStoreBaseActionController =
      ActionController(name: '_ValidateRequestStoreBase', context: context);

  @override
  void stateOrErrorUpdater(Either<Failure, P2PRequestRecipientEntity> result) {
    final _$actionInfo = _$_ValidateRequestStoreBaseActionController
        .startAction(name: '_ValidateRequestStoreBase.stateOrErrorUpdater');
    try {
      return super.stateOrErrorUpdater(result);
    } finally {
      _$_ValidateRequestStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStore() {
    final _$actionInfo = _$_ValidateRequestStoreBaseActionController
        .startAction(name: '_ValidateRequestStoreBase.resetStore');
    try {
      return super.resetStore();
    } finally {
      _$_ValidateRequestStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
futureStore: ${futureStore},
recipientExists: ${recipientExists},
duplicateSender: ${duplicateSender},
duplicateRecipient: ${duplicateRecipient}
    ''';
  }
}

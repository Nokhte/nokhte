// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_query_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ValidateQueryStore on _ValidateQueryStoreBase, Store {
  late final _$isNotProperLengthAtom =
      Atom(name: '_ValidateQueryStoreBase.isNotProperLength', context: context);

  @override
  bool get isNotProperLength {
    _$isNotProperLengthAtom.reportRead();
    return super.isNotProperLength;
  }

  @override
  set isNotProperLength(bool value) {
    _$isNotProperLengthAtom.reportWrite(value, super.isNotProperLength, () {
      super.isNotProperLength = value;
    });
  }

  late final _$isValidatedAtom =
      Atom(name: '_ValidateQueryStoreBase.isValidated', context: context);

  @override
  bool get isValidated {
    _$isValidatedAtom.reportRead();
    return super.isValidated;
  }

  @override
  set isValidated(bool value) {
    _$isValidatedAtom.reportWrite(value, super.isValidated, () {
      super.isValidated = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_ValidateQueryStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CollaboratorPhraseValidationEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CollaboratorPhraseValidationEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_ValidateQueryStoreBase.call', context: context);

  @override
  Future<void> call(ValidateQueryParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  late final _$_ValidateQueryStoreBaseActionController =
      ActionController(name: '_ValidateQueryStoreBase', context: context);

  @override
  dynamic resetLengthCheckerBool() {
    final _$actionInfo = _$_ValidateQueryStoreBaseActionController.startAction(
        name: '_ValidateQueryStoreBase.resetLengthCheckerBool');
    try {
      return super.resetLengthCheckerBool();
    } finally {
      _$_ValidateQueryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateTheLength({required String inputString}) {
    final _$actionInfo = _$_ValidateQueryStoreBaseActionController.startAction(
        name: '_ValidateQueryStoreBase.validateTheLength');
    try {
      return super.validateTheLength(inputString: inputString);
    } finally {
      _$_ValidateQueryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNotProperLength: ${isNotProperLength},
isValidated: ${isValidated},
futureStore: ${futureStore}
    ''';
  }
}

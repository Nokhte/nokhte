// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_mobx_db_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseMobxDBStore<Params, T> on _BaseMobxDBStoreBase<Params, T>, Store {
  late final _$stateAtom =
      Atom(name: '_BaseMobxDBStoreBase.state', context: context);

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_BaseMobxDBStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_BaseMobxDBStoreBase.call', context: context);

  @override
  Future<void> call(Params params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  late final _$_BaseMobxDBStoreBaseActionController =
      ActionController(name: '_BaseMobxDBStoreBase', context: context);

  @override
  dynamic errorUpdater(Failure failure) {
    final _$actionInfo = _$_BaseMobxDBStoreBaseActionController.startAction(
        name: '_BaseMobxDBStoreBase.errorUpdater');
    try {
      return super.errorUpdater(failure);
    } finally {
      _$_BaseMobxDBStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage}
    ''';
  }
}

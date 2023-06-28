// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStateStore on _AuthStateStoreBase, Store {
  late final _$authStateAtom =
      Atom(name: '_AuthStateStoreBase.authState', context: context);

  @override
  Stream<bool> get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(Stream<bool> value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  @override
  String toString() {
    return '''
authState: ${authState}
    ''';
  }
}

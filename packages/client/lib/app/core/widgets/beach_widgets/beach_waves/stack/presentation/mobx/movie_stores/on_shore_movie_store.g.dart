// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_shore_movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnShoreMovieStore on _OnShoreMovieStoreBase, Store {
  late final _$currentWaterYPositionAtom = Atom(
      name: '_OnShoreMovieStoreBase.currentWaterYPosition', context: context);

  @override
  double get currentWaterYPosition {
    _$currentWaterYPositionAtom.reportRead();
    return super.currentWaterYPosition;
  }

  @override
  set currentWaterYPosition(double value) {
    _$currentWaterYPositionAtom.reportWrite(value, super.currentWaterYPosition,
        () {
      super.currentWaterYPosition = value;
    });
  }

  late final _$_OnShoreMovieStoreBaseActionController =
      ActionController(name: '_OnShoreMovieStoreBase', context: context);

  @override
  dynamic setCurrentWaterYPosition(double newYWaterPosition) {
    final _$actionInfo = _$_OnShoreMovieStoreBaseActionController.startAction(
        name: '_OnShoreMovieStoreBase.setCurrentWaterYPosition');
    try {
      return super.setCurrentWaterYPosition(newYWaterPosition);
    } finally {
      _$_OnShoreMovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentWaterYPosition: ${currentWaterYPosition}
    ''';
  }
}

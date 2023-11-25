// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_times_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseTimesUpStore on _BaseTimesUpStoreBase, Store {
  late final _$isFirstTimeStartingMovieAtom = Atom(
      name: '_BaseTimesUpStoreBase.isFirstTimeStartingMovie', context: context);

  @override
  bool get isFirstTimeStartingMovie {
    _$isFirstTimeStartingMovieAtom.reportRead();
    return super.isFirstTimeStartingMovie;
  }

  @override
  set isFirstTimeStartingMovie(bool value) {
    _$isFirstTimeStartingMovieAtom
        .reportWrite(value, super.isFirstTimeStartingMovie, () {
      super.isFirstTimeStartingMovie = value;
    });
  }

  late final _$_BaseTimesUpStoreBaseActionController =
      ActionController(name: '_BaseTimesUpStoreBase', context: context);

  @override
  dynamic initOrPauseTimesUp(bool shouldRun) {
    final _$actionInfo = _$_BaseTimesUpStoreBaseActionController.startAction(
        name: '_BaseTimesUpStoreBase.initOrPauseTimesUp');
    try {
      return super.initOrPauseTimesUp(shouldRun);
    } finally {
      _$_BaseTimesUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstTimeStartingMovie: ${isFirstTimeStartingMovie}
    ''';
  }
}

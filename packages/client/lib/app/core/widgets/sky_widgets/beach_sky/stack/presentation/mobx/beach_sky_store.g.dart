// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_sky_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachSkyStore on _BeachSkyStoreBase, Store {
  late final _$movieAtom =
      Atom(name: '_BeachSkyStoreBase.movie', context: context);

  @override
  MovieTween get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(MovieTween value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$controlAtom =
      Atom(name: '_BeachSkyStoreBase.control', context: context);

  @override
  Control get control {
    _$controlAtom.reportRead();
    return super.control;
  }

  @override
  set control(Control value) {
    _$controlAtom.reportWrite(value, super.control, () {
      super.control = value;
    });
  }

  late final _$_BeachSkyStoreBaseActionController =
      ActionController(name: '_BeachSkyStoreBase', context: context);

  @override
  dynamic selectTimeBasedMovie(DateTime date) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.selectTimeBasedMovie');
    try {
      return super.selectTimeBasedMovie(date);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
control: ${control}
    ''';
  }
}

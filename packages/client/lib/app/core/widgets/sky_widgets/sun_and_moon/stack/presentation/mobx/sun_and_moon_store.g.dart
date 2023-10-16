// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun_and_moon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SunAndMoonStore on _SunAndMoonStoreBase, Store {
  late final _$isTheMoonAtom =
      Atom(name: '_SunAndMoonStoreBase.isTheMoon', context: context);

  @override
  bool get isTheMoon {
    _$isTheMoonAtom.reportRead();
    return super.isTheMoon;
  }

  @override
  set isTheMoon(bool value) {
    _$isTheMoonAtom.reportWrite(value, super.isTheMoon, () {
      super.isTheMoon = value;
    });
  }

  late final _$movieAtom =
      Atom(name: '_SunAndMoonStoreBase.movie', context: context);

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
      Atom(name: '_SunAndMoonStoreBase.control', context: context);

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

  late final _$_SunAndMoonStoreBaseActionController =
      ActionController(name: '_SunAndMoonStoreBase', context: context);

  @override
  dynamic selectTimeBasedMovie(DateTime date) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.selectTimeBasedMovie');
    try {
      return super.selectTimeBasedMovie(date);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDuskCallback(int hour) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback(hour);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback(int hour) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback(hour);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback(int hour) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initDayCallback');
    try {
      return super.initDayCallback(hour);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback(int hour) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback(hour);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTheMoon: ${isTheMoon},
movie: ${movie},
control: ${control}
    ''';
  }
}

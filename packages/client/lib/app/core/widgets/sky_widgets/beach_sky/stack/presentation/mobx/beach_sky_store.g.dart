// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_sky_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachSkyStore on _BeachSkyStoreBase, Store {
  late final _$movieIsLongerAtom =
      Atom(name: '_BeachSkyStoreBase.movieIsLonger', context: context);

  @override
  bool get movieIsLonger {
    _$movieIsLongerAtom.reportRead();
    return super.movieIsLonger;
  }

  @override
  set movieIsLonger(bool value) {
    _$movieIsLongerAtom.reportWrite(value, super.movieIsLonger, () {
      super.movieIsLonger = value;
    });
  }

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
  dynamic setGradient(DateTime date, {required bool isStart}) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.setGradient');
    try {
      return super.setGradient(date, isStart: isStart);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void initDuskCallback(NoParams params) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback(params);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback(NoParams params) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initDayCallback');
    try {
      return super.initDayCallback(params);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback(NoParams params) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback(params);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback(NoParams params) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback(params);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isADuskTime(IsATimeMobxParams param) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.isADuskTime');
    try {
      return super.isADuskTime(param);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAMorningTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.isAMorningTime');
    try {
      return super.isAMorningTime(params);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isADayTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.isADayTime');
    try {
      return super.isADayTime(params);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAEveningTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.isAEveningTime');
    try {
      return super.isAEveningTime(params);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initTimeShift(DateTime pastTime, DateTime newTime) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initTimeShift');
    try {
      return super.initTimeShift(pastTime, newTime);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieIsLonger: ${movieIsLonger},
movie: ${movie},
control: ${control}
    ''';
  }
}

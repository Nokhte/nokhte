// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_sky_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachSkyStore on _BeachSkyStoreBase, Store {
  late final _$startingGradAtom =
      Atom(name: '_BeachSkyStoreBase.startingGrad', context: context);

  @override
  List<Color> get startingGrad {
    _$startingGradAtom.reportRead();
    return super.startingGrad;
  }

  @override
  set startingGrad(List<Color> value) {
    _$startingGradAtom.reportWrite(value, super.startingGrad, () {
      super.startingGrad = value;
    });
  }

  late final _$endingGradAtom =
      Atom(name: '_BeachSkyStoreBase.endingGrad', context: context);

  @override
  List<Color> get endingGrad {
    _$endingGradAtom.reportRead();
    return super.endingGrad;
  }

  @override
  set endingGrad(List<Color> value) {
    _$endingGradAtom.reportWrite(value, super.endingGrad, () {
      super.endingGrad = value;
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
  void initDuskCallback() {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback();
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback() {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initDayCallback');
    try {
      return super.initDayCallback();
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback() {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback();
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback() {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback();
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isADuskTime(bool isAStartingValue) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.isADuskTime');
    try {
      return super.isADuskTime(isAStartingValue);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAMorningTime(bool isAStartingValue) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.isAMorningTime');
    try {
      return super.isAMorningTime(isAStartingValue);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isADayTime(bool isAStartingValue) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.isADayTime');
    try {
      return super.isADayTime(isAStartingValue);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAEveningTime(bool isAStartingValue) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.isAEveningTime');
    try {
      return super.isAEveningTime(isAStartingValue);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initForwardShift(DateTime pastTime, DateTime newTime) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initForwardShift');
    try {
      return super.initForwardShift(pastTime, newTime);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initBackwardsShift(DateTime pastTime, DateTime newTime) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initBackwardsShift');
    try {
      return super.initBackwardsShift(pastTime, newTime);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startingGrad: ${startingGrad},
endingGrad: ${endingGrad},
movie: ${movie},
control: ${control}
    ''';
  }
}

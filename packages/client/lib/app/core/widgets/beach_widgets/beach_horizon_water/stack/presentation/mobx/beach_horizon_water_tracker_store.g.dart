// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_horizon_water_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachHorizonWaterTrackerStore
    on _BeachHorizonWaterTrackerStoreBase, Store {
  late final _$isCompleteAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.isComplete', context: context);

  @override
  bool get isComplete {
    _$isCompleteAtom.reportRead();
    return super.isComplete;
  }

  @override
  set isComplete(bool value) {
    _$isCompleteAtom.reportWrite(value, super.isComplete, () {
      super.isComplete = value;
    });
  }

  late final _$startingGradAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.startingGrad',
      context: context);

  @override
  List<ColorAndStop> get startingGrad {
    _$startingGradAtom.reportRead();
    return super.startingGrad;
  }

  @override
  set startingGrad(List<ColorAndStop> value) {
    _$startingGradAtom.reportWrite(value, super.startingGrad, () {
      super.startingGrad = value;
    });
  }

  late final _$endingGradAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.endingGrad', context: context);

  @override
  List<ColorAndStop> get endingGrad {
    _$endingGradAtom.reportRead();
    return super.endingGrad;
  }

  @override
  set endingGrad(List<ColorAndStop> value) {
    _$endingGradAtom.reportWrite(value, super.endingGrad, () {
      super.endingGrad = value;
    });
  }

  late final _$movieAtom =
      Atom(name: '_BeachHorizonWaterTrackerStoreBase.movie', context: context);

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

  late final _$controlAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.control', context: context);

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

  late final _$_BeachHorizonWaterTrackerStoreBaseActionController =
      ActionController(
          name: '_BeachHorizonWaterTrackerStoreBase', context: context);

  @override
  void isADuskTime(bool isAStartingValue) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.isADuskTime');
    try {
      return super.isADuskTime(isAStartingValue);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isAMorningTime(bool isAStartingValue) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.isAMorningTime');
    try {
      return super.isAMorningTime(isAStartingValue);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isADayTime(bool isAStartingValue) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.isADayTime');
    try {
      return super.isADayTime(isAStartingValue);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isAEveningTime(bool isAStartingValue) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.isAEveningTime');
    try {
      return super.isAEveningTime(isAStartingValue);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectTimeBasedMovie(DateTime date) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.selectTimeBasedMovie');
    try {
      return super.selectTimeBasedMovie(date);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initDuskCallback() {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback();
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback() {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback();
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback() {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initDayCallback');
    try {
      return super.initDayCallback();
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback() {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback();
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initBackwardsShift(DateTime pastTime, DateTime newTime) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initBackwardsShift');
    try {
      return super.initBackwardsShift(pastTime, newTime);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isComplete: ${isComplete},
startingGrad: ${startingGrad},
endingGrad: ${endingGrad},
movie: ${movie},
control: ${control}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_horizon_water_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachHorizonWaterTrackerStore
    on _BeachHorizonWaterTrackerStoreBase, Store {
  late final _$isGoingToFullSkyAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.isGoingToFullSky',
      context: context);

  @override
  bool get isGoingToFullSky {
    _$isGoingToFullSkyAtom.reportRead();
    return super.isGoingToFullSky;
  }

  @override
  set isGoingToFullSky(bool value) {
    _$isGoingToFullSkyAtom.reportWrite(value, super.isGoingToFullSky, () {
      super.isGoingToFullSky = value;
    });
  }

  late final _$currentWaterValueAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.currentWaterValue',
      context: context);

  @override
  double get currentWaterValue {
    _$currentWaterValueAtom.reportRead();
    return super.currentWaterValue;
  }

  @override
  set currentWaterValue(double value) {
    _$currentWaterValueAtom.reportWrite(value, super.currentWaterValue, () {
      super.currentWaterValue = value;
    });
  }

  late final _$movieModeAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.movieMode', context: context);

  @override
  HorizonMovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(HorizonMovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
    });
  }

  late final _$backToShoreCompletedAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.backToShoreCompleted',
      context: context);

  @override
  bool get backToShoreCompleted {
    _$backToShoreCompletedAtom.reportRead();
    return super.backToShoreCompleted;
  }

  @override
  set backToShoreCompleted(bool value) {
    _$backToShoreCompletedAtom.reportWrite(value, super.backToShoreCompleted,
        () {
      super.backToShoreCompleted = value;
    });
  }

  late final _$isFirstTimeCompletingAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.isFirstTimeCompleting',
      context: context);

  @override
  bool get isFirstTimeCompleting {
    _$isFirstTimeCompletingAtom.reportRead();
    return super.isFirstTimeCompleting;
  }

  @override
  set isFirstTimeCompleting(bool value) {
    _$isFirstTimeCompletingAtom.reportWrite(value, super.isFirstTimeCompleting,
        () {
      super.isFirstTimeCompleting = value;
    });
  }

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

  late final _$movieIsLongerAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.movieIsLonger',
      context: context);

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

  late final _$_BeachHorizonWaterTrackerStoreBaseActionController =
      ActionController(
          name: '_BeachHorizonWaterTrackerStoreBase', context: context);

  @override
  dynamic initImmersionBackToHorizon() {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name:
                '_BeachHorizonWaterTrackerStoreBase.initImmersionBackToHorizon');
    try {
      return super.initImmersionBackToHorizon();
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentWaterValue(double newValue) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.setCurrentWaterValue');
    try {
      return super.setCurrentWaterValue(newValue);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsGoingFullSky() {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.toggleIsGoingFullSky');
    try {
      return super.toggleIsGoingFullSky();
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void toggleShoreCompletionStatus() {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name:
                '_BeachHorizonWaterTrackerStoreBase.toggleShoreCompletionStatus');
    try {
      return super.toggleShoreCompletionStatus();
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMovieMode(HorizonMovieModes newMovieMode) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.setMovieMode');
    try {
      return super.setMovieMode(newMovieMode);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAnimationCompleted() {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.onAnimationCompleted');
    try {
      return super.onAnimationCompleted();
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGradient(DateTime date, {required bool isStart}) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.setGradient');
    try {
      return super.setGradient(date, isStart: isStart);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isADuskTime(IsATimeMobxParams param) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.isADuskTime');
    try {
      return super.isADuskTime(param);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isAMorningTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.isAMorningTime');
    try {
      return super.isAMorningTime(params);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isADayTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.isADayTime');
    try {
      return super.isADayTime(params);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isAEveningTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.isAEveningTime');
    try {
      return super.isAEveningTime(params);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectTimeBasedMovie(
      DateTime date, List<ColorAndStop> startingMovieGrad) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.selectTimeBasedMovie');
    try {
      return super.selectTimeBasedMovie(date, startingMovieGrad);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initDuskCallback(List<ColorAndStop> params) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback(params);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback(List<ColorAndStop> params) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback(params);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback(List<ColorAndStop> params) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initDayCallback');
    try {
      return super.initDayCallback(params);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback(List<ColorAndStop> params) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback(params);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initTimeShift(
      {required DateTime pastTime, required DateTime newTime}) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.initTimeShift');
    try {
      return super.initTimeShift(pastTime: pastTime, newTime: newTime);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic fullSkyBackToShorePreReq({required DateTime currentTime}) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name:
                '_BeachHorizonWaterTrackerStoreBase.fullSkyBackToShorePreReq');
    try {
      return super.fullSkyBackToShorePreReq(currentTime: currentTime);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initBackToShore({required DateTime currentTime}) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.initBackToShore');
    try {
      return super.initBackToShore(currentTime: currentTime);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isGoingToFullSky: ${isGoingToFullSky},
currentWaterValue: ${currentWaterValue},
movieMode: ${movieMode},
backToShoreCompleted: ${backToShoreCompleted},
isFirstTimeCompleting: ${isFirstTimeCompleting},
isComplete: ${isComplete},
movieIsLonger: ${movieIsLonger}
    ''';
  }
}

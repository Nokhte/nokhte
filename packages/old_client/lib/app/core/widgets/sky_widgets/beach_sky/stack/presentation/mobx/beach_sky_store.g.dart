// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_sky_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachSkyStore on _BeachSkyStoreBase, Store {
  late final _$isFirstTimeCompletingAtom =
      Atom(name: '_BeachSkyStoreBase.isFirstTimeCompleting', context: context);

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

  late final _$currentGradAtom =
      Atom(name: '_BeachSkyStoreBase.currentGrad', context: context);

  @override
  List<Color> get currentGrad {
    _$currentGradAtom.reportRead();
    return super.currentGrad;
  }

  @override
  set currentGrad(List<Color> value) {
    _$currentGradAtom.reportWrite(value, super.currentGrad, () {
      super.currentGrad = value;
    });
  }

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

  late final _$_BeachSkyStoreBaseActionController =
      ActionController(name: '_BeachSkyStoreBase', context: context);

  @override
  dynamic setCurrentGrad(List<Color> newGrad) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.setCurrentGrad');
    try {
      return super.setCurrentGrad(newGrad);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAnimationComplete() {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.onAnimationComplete');
    try {
      return super.onAnimationComplete();
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic initTimeShift(
      {required DateTime pastTime, required DateTime newTime}) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.initTimeShift');
    try {
      return super.initTimeShift(pastTime: pastTime, newTime: newTime);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstTimeCompleting: ${isFirstTimeCompleting},
currentGrad: ${currentGrad},
movieIsLonger: ${movieIsLonger}
    ''';
  }
}

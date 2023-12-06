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

  late final _$queuedUpMovieAtom =
      Atom(name: '_SunAndMoonStoreBase.queuedUpMovie', context: context);

  @override
  QueuedUpMovie get queuedUpMovie {
    _$queuedUpMovieAtom.reportRead();
    return super.queuedUpMovie;
  }

  @override
  set queuedUpMovie(QueuedUpMovie value) {
    _$queuedUpMovieAtom.reportWrite(value, super.queuedUpMovie, () {
      super.queuedUpMovie = value;
    });
  }

  late final _$_SunAndMoonStoreBaseActionController =
      ActionController(name: '_SunAndMoonStoreBase', context: context);

  @override
  dynamic setStartingGrad(List<Color> newColors) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.setStartingGrad');
    try {
      return super.setStartingGrad(newColors);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndingGrad(List<Color> newColors) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.setEndingGrad');
    try {
      return super.setEndingGrad(newColors);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQueuedMovie(QueuedUpMovie newMovie) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.setQueuedMovie');
    try {
      return super.setQueuedMovie(newMovie);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGradient(DateTime date, {required bool isStart}) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.setGradient');
    try {
      return super.setGradient(date, isStart: isStart);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isADuskTime(IsATimeMobxParams param) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.isADuskTime');
    try {
      return super.isADuskTime(param);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAMorningTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.isAMorningTime');
    try {
      return super.isAMorningTime(params);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isADayTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.isADayTime');
    try {
      return super.isADayTime(params);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAEveningTime(IsATimeMobxParams params) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.isAEveningTime');
    try {
      return super.isAEveningTime(params);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initTimeShift(
      {required DateTime pastTime, required DateTime newTime}) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initTimeShift');
    try {
      return super.initTimeShift(pastTime: pastTime, newTime: newTime);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void initDuskCallback(int hours) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback(hours);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback(int hours) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback(hours);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback(int hours) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initDayCallback');
    try {
      return super.initDayCallback(hours);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback(int hours) {
    final _$actionInfo = _$_SunAndMoonStoreBaseActionController.startAction(
        name: '_SunAndMoonStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback(hours);
    } finally {
      _$_SunAndMoonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTheMoon: ${isTheMoon},
queuedUpMovie: ${queuedUpMovie}
    ''';
  }
}

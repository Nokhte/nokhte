// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_scheduling_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseSchedulingWidgetStore<T>
    on _BaseSchedulingWidgetStoreBase<T>, Store {
  late final _$startingGradAtom = Atom(
      name: '_BaseSchedulingWidgetStoreBase.startingGrad', context: context);

  @override
  List<T> get startingGrad {
    _$startingGradAtom.reportRead();
    return super.startingGrad;
  }

  @override
  set startingGrad(List<T> value) {
    _$startingGradAtom.reportWrite(value, super.startingGrad, () {
      super.startingGrad = value;
    });
  }

  late final _$endingGradAtom =
      Atom(name: '_BaseSchedulingWidgetStoreBase.endingGrad', context: context);

  @override
  List<T> get endingGrad {
    _$endingGradAtom.reportRead();
    return super.endingGrad;
  }

  @override
  set endingGrad(List<T> value) {
    _$endingGradAtom.reportWrite(value, super.endingGrad, () {
      super.endingGrad = value;
    });
  }

  late final _$_BaseSchedulingWidgetStoreBaseActionController =
      ActionController(
          name: '_BaseSchedulingWidgetStoreBase', context: context);

  @override
  void isADuskTime(bool isAStartingValue) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.isADuskTime');
    try {
      return super.isADuskTime(isAStartingValue);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAMorningTime(bool isAStartingValue) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.isAMorningTime');
    try {
      return super.isAMorningTime(isAStartingValue);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isADayTime(bool isAStartingValue) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.isADayTime');
    try {
      return super.isADayTime(isAStartingValue);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAEveningTime(bool isAStartingValue) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.isAEveningTime');
    try {
      return super.isAEveningTime(isAStartingValue);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDuskCallback() {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback();
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback() {
    final _$actionInfo =
        _$_BaseSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseSchedulingWidgetStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback();
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback() {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.initDayCallback');
    try {
      return super.initDayCallback();
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback() {
    final _$actionInfo =
        _$_BaseSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseSchedulingWidgetStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback();
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initForwardShift(DateTime pastTime, DateTime newTime) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.initForwardShift');
    try {
      return super.initForwardShift(pastTime, newTime);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initBackwardsShift(DateTime pastTime, DateTime newTime) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.initBackwardsShift');
    try {
      return super.initBackwardsShift(pastTime, newTime);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectTimeBasedMovie(DateTime date) {
    final _$actionInfo =
        _$_BaseSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseSchedulingWidgetStoreBase.selectTimeBasedMovie');
    try {
      return super.selectTimeBasedMovie(date);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startingGrad: ${startingGrad},
endingGrad: ${endingGrad}
    ''';
  }
}

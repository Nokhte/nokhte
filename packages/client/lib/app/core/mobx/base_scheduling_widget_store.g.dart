// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_scheduling_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseSchedulingWidgetStore<ArrayType, InitParams, IsATimeParams>
    on
        _BaseSchedulingWidgetStoreBase<ArrayType, InitParams, IsATimeParams>,
        Store {
  late final _$startingGradAtom = Atom(
      name: '_BaseSchedulingWidgetStoreBase.startingGrad', context: context);

  @override
  List<ArrayType> get startingGrad {
    _$startingGradAtom.reportRead();
    return super.startingGrad;
  }

  @override
  set startingGrad(List<ArrayType> value) {
    _$startingGradAtom.reportWrite(value, super.startingGrad, () {
      super.startingGrad = value;
    });
  }

  late final _$endingGradAtom =
      Atom(name: '_BaseSchedulingWidgetStoreBase.endingGrad', context: context);

  @override
  List<ArrayType> get endingGrad {
    _$endingGradAtom.reportRead();
    return super.endingGrad;
  }

  @override
  set endingGrad(List<ArrayType> value) {
    _$endingGradAtom.reportWrite(value, super.endingGrad, () {
      super.endingGrad = value;
    });
  }

  late final _$_BaseSchedulingWidgetStoreBaseActionController =
      ActionController(
          name: '_BaseSchedulingWidgetStoreBase', context: context);

  @override
  void isADuskTime(IsATimeParams params) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.isADuskTime');
    try {
      return super.isADuskTime(params);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAMorningTime(IsATimeParams params) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.isAMorningTime');
    try {
      return super.isAMorningTime(params);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isADayTime(IsATimeParams params) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.isADayTime');
    try {
      return super.isADayTime(params);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAEveningTime(IsATimeParams params) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.isAEveningTime');
    try {
      return super.isAEveningTime(params);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDuskCallback(InitParams params) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback(params);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback(InitParams params) {
    final _$actionInfo =
        _$_BaseSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseSchedulingWidgetStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback(params);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback(InitParams params) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.initDayCallback');
    try {
      return super.initDayCallback(params);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback(InitParams params) {
    final _$actionInfo =
        _$_BaseSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseSchedulingWidgetStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback(params);
    } finally {
      _$_BaseSchedulingWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initTimeShift(
      {required DateTime pastTime, required DateTime newTime}) {
    final _$actionInfo = _$_BaseSchedulingWidgetStoreBaseActionController
        .startAction(name: '_BaseSchedulingWidgetStoreBase.initTimeShift');
    try {
      return super.initTimeShift(pastTime: pastTime, newTime: newTime);
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

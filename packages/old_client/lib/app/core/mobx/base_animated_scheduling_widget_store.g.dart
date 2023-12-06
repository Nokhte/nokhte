// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_animated_scheduling_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseAnimatedSchedulingWidgetStore<ArrayType, InitParams, IsATimeParams>
    on
        _BaseAnimatedSchedulingWidgetStoreBase<ArrayType, InitParams,
            IsATimeParams>,
        Store {
  late final _$startingGradAtom = Atom(
      name: '_BaseAnimatedSchedulingWidgetStoreBase.startingGrad',
      context: context);

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

  late final _$endingGradAtom = Atom(
      name: '_BaseAnimatedSchedulingWidgetStoreBase.endingGrad',
      context: context);

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

  late final _$_BaseAnimatedSchedulingWidgetStoreBaseActionController =
      ActionController(
          name: '_BaseAnimatedSchedulingWidgetStoreBase', context: context);

  @override
  void isADuskTime(IsATimeParams params) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.isADuskTime');
    try {
      return super.isADuskTime(params);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isAMorningTime(IsATimeParams params) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.isAMorningTime');
    try {
      return super.isAMorningTime(params);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isADayTime(IsATimeParams params) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.isADayTime');
    try {
      return super.isADayTime(params);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void isAEveningTime(IsATimeParams params) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.isAEveningTime');
    try {
      return super.isAEveningTime(params);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initDuskCallback(InitParams params) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.initDuskCallback');
    try {
      return super.initDuskCallback(params);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initMorningCallback(InitParams params) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.initMorningCallback');
    try {
      return super.initMorningCallback(params);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initDayCallback(InitParams params) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.initDayCallback');
    try {
      return super.initDayCallback(params);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initEveningCallback(InitParams params) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.initEveningCallback');
    try {
      return super.initEveningCallback(params);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initTimeShift(
      {required DateTime pastTime, required DateTime newTime}) {
    final _$actionInfo =
        _$_BaseAnimatedSchedulingWidgetStoreBaseActionController.startAction(
            name: '_BaseAnimatedSchedulingWidgetStoreBase.initTimeShift');
    try {
      return super.initTimeShift(pastTime: pastTime, newTime: newTime);
    } finally {
      _$_BaseAnimatedSchedulingWidgetStoreBaseActionController
          .endAction(_$actionInfo);
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

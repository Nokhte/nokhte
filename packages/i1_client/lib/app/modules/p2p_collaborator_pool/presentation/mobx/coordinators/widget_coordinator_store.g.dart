// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WidgetCoordinatorStore on _WidgetCoordinatorStoreBase, Store {
  late final _$isFirstTimeAtom =
      Atom(name: '_WidgetCoordinatorStoreBase.isFirstTime', context: context);

  @override
  bool get isFirstTime {
    _$isFirstTimeAtom.reportRead();
    return super.isFirstTime;
  }

  @override
  set isFirstTime(bool value) {
    _$isFirstTimeAtom.reportWrite(value, super.isFirstTime, () {
      super.isFirstTime = value;
    });
  }

  late final _$_WidgetCoordinatorStoreBaseActionController =
      ActionController(name: '_WidgetCoordinatorStoreBase', context: context);

  @override
  dynamic toggleIsFirstTime() {
    final _$actionInfo = _$_WidgetCoordinatorStoreBaseActionController
        .startAction(name: '_WidgetCoordinatorStoreBase.toggleIsFirstTime');
    try {
      return super.toggleIsFirstTime();
    } finally {
      _$_WidgetCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic widgetConstructor() {
    final _$actionInfo = _$_WidgetCoordinatorStoreBaseActionController
        .startAction(name: '_WidgetCoordinatorStoreBase.widgetConstructor');
    try {
      return super.widgetConstructor();
    } finally {
      _$_WidgetCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fadeOutExplanationTextIfNecessary() {
    final _$actionInfo =
        _$_WidgetCoordinatorStoreBaseActionController.startAction(
            name:
                '_WidgetCoordinatorStoreBase.fadeOutExplanationTextIfNecessary');
    try {
      return super.fadeOutExplanationTextIfNecessary();
    } finally {
      _$_WidgetCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backToShoreWidgetChanges() {
    final _$actionInfo =
        _$_WidgetCoordinatorStoreBaseActionController.startAction(
            name: '_WidgetCoordinatorStoreBase.backToShoreWidgetChanges');
    try {
      return super.backToShoreWidgetChanges();
    } finally {
      _$_WidgetCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic transitionToTimesUp() {
    final _$actionInfo = _$_WidgetCoordinatorStoreBaseActionController
        .startAction(name: '_WidgetCoordinatorStoreBase.transitionToTimesUp');
    try {
      return super.transitionToTimesUp();
    } finally {
      _$_WidgetCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstTime: ${isFirstTime}
    ''';
  }
}

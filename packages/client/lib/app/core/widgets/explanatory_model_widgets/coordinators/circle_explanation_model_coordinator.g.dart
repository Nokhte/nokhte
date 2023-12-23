// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_explanation_model_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CircleExplanationModelCoordinator
    on _CircleExplanationModelCoordinatorBase, Store {
  late final _$hasCompletedExplanationAtom = Atom(
      name: '_CircleExplanationModelCoordinatorBase.hasCompletedExplanation',
      context: context);

  @override
  bool get hasCompletedExplanation {
    _$hasCompletedExplanationAtom.reportRead();
    return super.hasCompletedExplanation;
  }

  @override
  set hasCompletedExplanation(bool value) {
    _$hasCompletedExplanationAtom
        .reportWrite(value, super.hasCompletedExplanation, () {
      super.hasCompletedExplanation = value;
    });
  }

  late final _$_CircleExplanationModelCoordinatorBaseActionController =
      ActionController(
          name: '_CircleExplanationModelCoordinatorBase', context: context);

  @override
  dynamic toggleAllWidgetVisibilities() {
    final _$actionInfo =
        _$_CircleExplanationModelCoordinatorBaseActionController.startAction(
            name:
                '_CircleExplanationModelCoordinatorBase.toggleAllWidgetVisibilities');
    try {
      return super.toggleAllWidgetVisibilities();
    } finally {
      _$_CircleExplanationModelCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic constructor() {
    final _$actionInfo =
        _$_CircleExplanationModelCoordinatorBaseActionController.startAction(
            name: '_CircleExplanationModelCoordinatorBase.constructor');
    try {
      return super.constructor();
    } finally {
      _$_CircleExplanationModelCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleHasCompletedExplanation() {
    final _$actionInfo =
        _$_CircleExplanationModelCoordinatorBaseActionController.startAction(
            name:
                '_CircleExplanationModelCoordinatorBase.toggleHasCompletedExplanation');
    try {
      return super.toggleHasCompletedExplanation();
    } finally {
      _$_CircleExplanationModelCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initExplanation() {
    final _$actionInfo =
        _$_CircleExplanationModelCoordinatorBaseActionController.startAction(
            name: '_CircleExplanationModelCoordinatorBase.initExplanation');
    try {
      return super.initExplanation();
    } finally {
      _$_CircleExplanationModelCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic showUserCircle() {
    final _$actionInfo =
        _$_CircleExplanationModelCoordinatorBaseActionController.startAction(
            name: '_CircleExplanationModelCoordinatorBase.showUserCircle');
    try {
      return super.showUserCircle();
    } finally {
      _$_CircleExplanationModelCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initReactors() {
    final _$actionInfo =
        _$_CircleExplanationModelCoordinatorBaseActionController.startAction(
            name: '_CircleExplanationModelCoordinatorBase.initReactors');
    try {
      return super.initReactors();
    } finally {
      _$_CircleExplanationModelCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasCompletedExplanation: ${hasCompletedExplanation}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesh_circle_button_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MeshCircleButtonStore on _MeshCircleButtonStoreBase, Store {
  late final _$meshGradientControllerAtom = Atom(
      name: '_MeshCircleButtonStoreBase.meshGradientController',
      context: context);

  @override
  AnimatedMeshGradientController get meshGradientController {
    _$meshGradientControllerAtom.reportRead();
    return super.meshGradientController;
  }

  @override
  set meshGradientController(AnimatedMeshGradientController value) {
    _$meshGradientControllerAtom
        .reportWrite(value, super.meshGradientController, () {
      super.meshGradientController = value;
    });
  }

  late final _$isAnimatingAtom =
      Atom(name: '_MeshCircleButtonStoreBase.isAnimating', context: context);

  @override
  bool get isAnimating {
    _$isAnimatingAtom.reportRead();
    return super.isAnimating;
  }

  @override
  set isAnimating(bool value) {
    _$isAnimatingAtom.reportWrite(value, super.isAnimating, () {
      super.isAnimating = value;
    });
  }

  late final _$showWidgetAtom =
      Atom(name: '_MeshCircleButtonStoreBase.showWidget', context: context);

  @override
  bool get showWidget {
    _$showWidgetAtom.reportRead();
    return super.showWidget;
  }

  @override
  set showWidget(bool value) {
    _$showWidgetAtom.reportWrite(value, super.showWidget, () {
      super.showWidget = value;
    });
  }

  late final _$controlAtom =
      Atom(name: '_MeshCircleButtonStoreBase.control', context: context);

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

  late final _$_MeshCircleButtonStoreBaseActionController =
      ActionController(name: '_MeshCircleButtonStoreBase', context: context);

  @override
  dynamic widgetConstructor() {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.widgetConstructor');
    try {
      return super.widgetConstructor();
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleWidgetVisibility() {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.toggleWidgetVisibility');
    try {
      return super.toggleWidgetVisibility();
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleColorAnimation() {
    final _$actionInfo = _$_MeshCircleButtonStoreBaseActionController
        .startAction(name: '_MeshCircleButtonStoreBase.toggleColorAnimation');
    try {
      return super.toggleColorAnimation();
    } finally {
      _$_MeshCircleButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
meshGradientController: ${meshGradientController},
isAnimating: ${isAnimating},
showWidget: ${showWidget},
control: ${control}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenWidgetsCoordinator
    on _LoginScreenWidgetsCoordinatorBase, Store {
  late final _$hasNotMadeTheDotAtom = Atom(
      name: '_LoginScreenWidgetsCoordinatorBase.hasNotMadeTheDot',
      context: context);

  @override
  bool get hasNotMadeTheDot {
    _$hasNotMadeTheDotAtom.reportRead();
    return super.hasNotMadeTheDot;
  }

  @override
  set hasNotMadeTheDot(bool value) {
    _$hasNotMadeTheDotAtom.reportWrite(value, super.hasNotMadeTheDot, () {
      super.hasNotMadeTheDot = value;
    });
  }

  late final _$centerScreenCoordinatesAtom = Atom(
      name: '_LoginScreenWidgetsCoordinatorBase.centerScreenCoordinates',
      context: context);

  @override
  Offset get centerScreenCoordinates {
    _$centerScreenCoordinatesAtom.reportRead();
    return super.centerScreenCoordinates;
  }

  @override
  set centerScreenCoordinates(Offset value) {
    _$centerScreenCoordinatesAtom
        .reportWrite(value, super.centerScreenCoordinates, () {
      super.centerScreenCoordinates = value;
    });
  }

  late final _$_LoginScreenWidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_LoginScreenWidgetsCoordinatorBase', context: context);

  @override
  dynamic toggleHasMadeTheDot() {
    final _$actionInfo =
        _$_LoginScreenWidgetsCoordinatorBaseActionController.startAction(
            name: '_LoginScreenWidgetsCoordinatorBase.toggleHasMadeTheDot');
    try {
      return super.toggleHasMadeTheDot();
    } finally {
      _$_LoginScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCenterScreenCoordinates(Offset newCoordinates) {
    final _$actionInfo =
        _$_LoginScreenWidgetsCoordinatorBaseActionController.startAction(
            name:
                '_LoginScreenWidgetsCoordinatorBase.setCenterScreenCoordinates');
    try {
      return super.setCenterScreenCoordinates(newCoordinates);
    } finally {
      _$_LoginScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onResumed() {
    final _$actionInfo = _$_LoginScreenWidgetsCoordinatorBaseActionController
        .startAction(name: '_LoginScreenWidgetsCoordinatorBase.onResumed');
    try {
      return super.onResumed();
    } finally {
      _$_LoginScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInactive() {
    final _$actionInfo = _$_LoginScreenWidgetsCoordinatorBaseActionController
        .startAction(name: '_LoginScreenWidgetsCoordinatorBase.onInactive');
    try {
      return super.onInactive();
    } finally {
      _$_LoginScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onTap(Offset currentTapPosition) {
    final _$actionInfo = _$_LoginScreenWidgetsCoordinatorBaseActionController
        .startAction(name: '_LoginScreenWidgetsCoordinatorBase.onTap');
    try {
      return super.onTap(currentTapPosition);
    } finally {
      _$_LoginScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSwipeUp() {
    final _$actionInfo = _$_LoginScreenWidgetsCoordinatorBaseActionController
        .startAction(name: '_LoginScreenWidgetsCoordinatorBase.onSwipeUp');
    try {
      return super.onSwipeUp();
    } finally {
      _$_LoginScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasNotMadeTheDot: ${hasNotMadeTheDot},
centerScreenCoordinates: ${centerScreenCoordinates}
    ''';
  }
}

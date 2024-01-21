// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_session_phase2_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurposeSessionPhase2WidgetsCoordinator
    on _PurposeSessionPhase2WidgetsCoordinatorBase, Store {
  late final _$isOverThreeWordsAtom = Atom(
      name: '_PurposeSessionPhase2WidgetsCoordinatorBase.isOverThreeWords',
      context: context);

  @override
  bool get isOverThreeWords {
    _$isOverThreeWordsAtom.reportRead();
    return super.isOverThreeWords;
  }

  @override
  set isOverThreeWords(bool value) {
    _$isOverThreeWordsAtom.reportWrite(value, super.isOverThreeWords, () {
      super.isOverThreeWords = value;
    });
  }

  late final _$isFirstTimeOverThreeWordsAtom = Atom(
      name:
          '_PurposeSessionPhase2WidgetsCoordinatorBase.isFirstTimeOverThreeWords',
      context: context);

  @override
  bool get isFirstTimeOverThreeWords {
    _$isFirstTimeOverThreeWordsAtom.reportRead();
    return super.isFirstTimeOverThreeWords;
  }

  @override
  set isFirstTimeOverThreeWords(bool value) {
    _$isFirstTimeOverThreeWordsAtom
        .reportWrite(value, super.isFirstTimeOverThreeWords, () {
      super.isFirstTimeOverThreeWords = value;
    });
  }

  late final _$hasCompletedIntroductionAtom = Atom(
      name:
          '_PurposeSessionPhase2WidgetsCoordinatorBase.hasCompletedIntroduction',
      context: context);

  @override
  bool get hasCompletedIntroduction {
    _$hasCompletedIntroductionAtom.reportRead();
    return super.hasCompletedIntroduction;
  }

  @override
  set hasCompletedIntroduction(bool value) {
    _$hasCompletedIntroductionAtom
        .reportWrite(value, super.hasCompletedIntroduction, () {
      super.hasCompletedIntroduction = value;
    });
  }

  late final _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_PurposeSessionPhase2WidgetsCoordinatorBase',
          context: context);

  @override
  dynamic constructor(
      {required Function onKeyboardUp, required Function onKeyboardDown}) {
    final _$actionInfo =
        _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_PurposeSessionPhase2WidgetsCoordinatorBase.constructor');
    try {
      return super.constructor(
          onKeyboardUp: onKeyboardUp, onKeyboardDown: onKeyboardDown);
    } finally {
      _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initReactors(
      {required Function onKeyboardUp, required Function onKeyboardDown}) {
    final _$actionInfo =
        _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_PurposeSessionPhase2WidgetsCoordinatorBase.initReactors');
    try {
      return super.initReactors(
          onKeyboardUp: onKeyboardUp, onKeyboardDown: onKeyboardDown);
    } finally {
      _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSwipeUp() {
    final _$actionInfo =
        _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController
            .startAction(
                name: '_PurposeSessionPhase2WidgetsCoordinatorBase.onSwipeUp');
    try {
      return super.onSwipeUp();
    } finally {
      _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSwipeDown() {
    final _$actionInfo =
        _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_PurposeSessionPhase2WidgetsCoordinatorBase.onSwipeDown');
    try {
      return super.onSwipeDown();
    } finally {
      _$_PurposeSessionPhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOverThreeWords: ${isOverThreeWords},
isFirstTimeOverThreeWords: ${isFirstTimeOverThreeWords},
hasCompletedIntroduction: ${hasCompletedIntroduction}
    ''';
  }
}

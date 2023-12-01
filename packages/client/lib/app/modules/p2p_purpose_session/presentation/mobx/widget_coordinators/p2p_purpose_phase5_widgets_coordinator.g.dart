// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase5_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase5WidgetsCoordinator
    on _P2PPurposePhase5WidgetsCoordinatorBase, Store {
  late final _$previousWordAtom = Atom(
      name: '_P2PPurposePhase5WidgetsCoordinatorBase.previousWord',
      context: context);

  @override
  String get previousWord {
    _$previousWordAtom.reportRead();
    return super.previousWord;
  }

  @override
  set previousWord(String value) {
    _$previousWordAtom.reportWrite(value, super.previousWord, () {
      super.previousWord = value;
    });
  }

  late final _$isInitialLoadAtom = Atom(
      name: '_P2PPurposePhase5WidgetsCoordinatorBase.isInitialLoad',
      context: context);

  @override
  bool get isInitialLoad {
    _$isInitialLoadAtom.reportRead();
    return super.isInitialLoad;
  }

  @override
  set isInitialLoad(bool value) {
    _$isInitialLoadAtom.reportWrite(value, super.isInitialLoad, () {
      super.isInitialLoad = value;
    });
  }

  late final _$_P2PPurposePhase5WidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_P2PPurposePhase5WidgetsCoordinatorBase', context: context);

  @override
  dynamic constructor() {
    final _$actionInfo =
        _$_P2PPurposePhase5WidgetsCoordinatorBaseActionController.startAction(
            name: '_P2PPurposePhase5WidgetsCoordinatorBase.constructor');
    try {
      return super.constructor();
    } finally {
      _$_P2PPurposePhase5WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsInitialLoad() {
    final _$actionInfo =
        _$_P2PPurposePhase5WidgetsCoordinatorBaseActionController.startAction(
            name:
                '_P2PPurposePhase5WidgetsCoordinatorBase.toggleIsInitialLoad');
    try {
      return super.toggleIsInitialLoad();
    } finally {
      _$_P2PPurposePhase5WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCommitStatusToAffirmative() {
    final _$actionInfo =
        _$_P2PPurposePhase5WidgetsCoordinatorBaseActionController.startAction(
            name:
                '_P2PPurposePhase5WidgetsCoordinatorBase.updateCommitStatusToAffirmative');
    try {
      return super.updateCommitStatusToAffirmative();
    } finally {
      _$_P2PPurposePhase5WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
previousWord: ${previousWord},
isInitialLoad: ${isInitialLoad}
    ''';
  }
}

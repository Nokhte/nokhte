// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collective_session_phase2_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollectiveSessionPhase2WidgetsCoordinator
    on _CollectiveSessionPhase2WidgetsCoordinatorBase, Store {
  late final _$isFirstTimeGoingThroughItAtom = Atom(
      name:
          '_CollectiveSessionPhase2WidgetsCoordinatorBase.isFirstTimeGoingThroughIt',
      context: context);

  @override
  bool get isFirstTimeGoingThroughIt {
    _$isFirstTimeGoingThroughItAtom.reportRead();
    return super.isFirstTimeGoingThroughIt;
  }

  @override
  set isFirstTimeGoingThroughIt(bool value) {
    _$isFirstTimeGoingThroughItAtom
        .reportWrite(value, super.isFirstTimeGoingThroughIt, () {
      super.isFirstTimeGoingThroughIt = value;
    });
  }

  late final _$_CollectiveSessionPhase2WidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_CollectiveSessionPhase2WidgetsCoordinatorBase',
          context: context);

  @override
  dynamic attuneTheWidgets() {
    final _$actionInfo =
        _$_CollectiveSessionPhase2WidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollectiveSessionPhase2WidgetsCoordinatorBase.attuneTheWidgets');
    try {
      return super.attuneTheWidgets();
    } finally {
      _$_CollectiveSessionPhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic goBackHome() {
    final _$actionInfo =
        _$_CollectiveSessionPhase2WidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_CollectiveSessionPhase2WidgetsCoordinatorBase.goBackHome');
    try {
      return super.goBackHome();
    } finally {
      _$_CollectiveSessionPhase2WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstTimeGoingThroughIt: ${isFirstTimeGoingThroughIt}
    ''';
  }
}

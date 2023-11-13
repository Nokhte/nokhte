// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collective_session_phase1_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollectiveSessionPhase1Coordinator
    on _CollectiveSessionPhase1CoordinatorBase, Store {
  Computed<String>? _$currentPerspectiveComputed;

  @override
  String get currentPerspective => (_$currentPerspectiveComputed ??=
          Computed<String>(() => super.currentPerspective,
              name:
                  '_CollectiveSessionPhase1CoordinatorBase.currentPerspective'))
      .value;

  late final _$screenTypeAtom = Atom(
      name: '_CollectiveSessionPhase1CoordinatorBase.screenType',
      context: context);

  @override
  CollectiveSessionPhase1ScreenTypes get screenType {
    _$screenTypeAtom.reportRead();
    return super.screenType;
  }

  @override
  set screenType(CollectiveSessionPhase1ScreenTypes value) {
    _$screenTypeAtom.reportWrite(value, super.screenType, () {
      super.screenType = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_CollectiveSessionPhase1CoordinatorBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$_CollectiveSessionPhase1CoordinatorBaseActionController =
      ActionController(
          name: '_CollectiveSessionPhase1CoordinatorBase', context: context);

  @override
  dynamic audioPlatformReset() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name: '_CollectiveSessionPhase1CoordinatorBase.audioPlatformReset');
    try {
      return super.audioPlatformReset();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic transitionToListeningMode() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.transitionToListeningMode');
    try {
      return super.transitionToListeningMode();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic transitionToPerspectivesMode() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.transitionToPerspectivesMode');
    try {
      return super.transitionToPerspectivesMode();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic audioPlatformIndexMarkup() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.audioPlatformIndexMarkup');
    try {
      return super.audioPlatformIndexMarkup();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic audioPlatformIndexMarkdown() {
    final _$actionInfo =
        _$_CollectiveSessionPhase1CoordinatorBaseActionController.startAction(
            name:
                '_CollectiveSessionPhase1CoordinatorBase.audioPlatformIndexMarkdown');
    try {
      return super.audioPlatformIndexMarkdown();
    } finally {
      _$_CollectiveSessionPhase1CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenType: ${screenType},
currentPerspective: ${currentPerspective}
    ''';
  }
}

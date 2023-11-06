// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_session_screen_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IndividualSessionScreenCoordinatorStore
    on _IndividualSessionScreenCoordinatorStoreBase, Store {
  Computed<String>? _$currentPerspectiveComputed;

  @override
  String get currentPerspective => (_$currentPerspectiveComputed ??= Computed<
              String>(() => super.currentPerspective,
          name:
              '_IndividualSessionScreenCoordinatorStoreBase.currentPerspective'))
      .value;

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_IndividualSessionScreenCoordinatorStoreBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$_IndividualSessionScreenCoordinatorStoreBaseActionController =
      ActionController(
          name: '_IndividualSessionScreenCoordinatorStoreBase',
          context: context);

  @override
  dynamic onSwipeUp() {
    final _$actionInfo =
        _$_IndividualSessionScreenCoordinatorStoreBaseActionController
            .startAction(
                name: '_IndividualSessionScreenCoordinatorStoreBase.onSwipeUp');
    try {
      return super.onSwipeUp();
    } finally {
      _$_IndividualSessionScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSwipeDown() {
    final _$actionInfo =
        _$_IndividualSessionScreenCoordinatorStoreBaseActionController
            .startAction(
                name:
                    '_IndividualSessionScreenCoordinatorStoreBase.onSwipeDown');
    try {
      return super.onSwipeDown();
    } finally {
      _$_IndividualSessionScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPerspective: ${currentPerspective}
    ''';
  }
}

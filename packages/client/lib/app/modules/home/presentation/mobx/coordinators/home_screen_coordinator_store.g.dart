// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenCoordinatorStore on _HomeScreenCoordinatorStoreBase, Store {
  late final _$thePlaceTheyAreGoingAtom = Atom(
      name: '_HomeScreenCoordinatorStoreBase.thePlaceTheyAreGoing',
      context: context);

  @override
  PlacesYouCanGo get thePlaceTheyAreGoing {
    _$thePlaceTheyAreGoingAtom.reportRead();
    return super.thePlaceTheyAreGoing;
  }

  @override
  set thePlaceTheyAreGoing(PlacesYouCanGo value) {
    _$thePlaceTheyAreGoingAtom.reportWrite(value, super.thePlaceTheyAreGoing,
        () {
      super.thePlaceTheyAreGoing = value;
    });
  }

  late final _$isNavigatingAtom = Atom(
      name: '_HomeScreenCoordinatorStoreBase.isNavigating', context: context);

  @override
  bool get isNavigating {
    _$isNavigatingAtom.reportRead();
    return super.isNavigating;
  }

  @override
  set isNavigating(bool value) {
    _$isNavigatingAtom.reportWrite(value, super.isNavigating, () {
      super.isNavigating = value;
    });
  }

  late final _$homeScreenConstructorCallbackAsyncAction = AsyncAction(
      '_HomeScreenCoordinatorStoreBase.homeScreenConstructorCallback',
      context: context);

  @override
  Future homeScreenConstructorCallback() {
    return _$homeScreenConstructorCallbackAsyncAction
        .run(() => super.homeScreenConstructorCallback());
  }

  late final _$_HomeScreenCoordinatorStoreBaseActionController =
      ActionController(
          name: '_HomeScreenCoordinatorStoreBase', context: context);

  @override
  dynamic portalAPIListener() {
    final _$actionInfo = _$_HomeScreenCoordinatorStoreBaseActionController
        .startAction(name: '_HomeScreenCoordinatorStoreBase.portalAPIListener');
    try {
      return super.portalAPIListener();
    } finally {
      _$_HomeScreenCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsNavigating() {
    final _$actionInfo =
        _$_HomeScreenCoordinatorStoreBaseActionController.startAction(
            name: '_HomeScreenCoordinatorStoreBase.toggleIsNavigating');
    try {
      return super.toggleIsNavigating();
    } finally {
      _$_HomeScreenCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic beachWavesListener() {
    final _$actionInfo =
        _$_HomeScreenCoordinatorStoreBaseActionController.startAction(
            name: '_HomeScreenCoordinatorStoreBase.beachWavesListener');
    try {
      return super.beachWavesListener();
    } finally {
      _$_HomeScreenCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic gestureListener() {
    final _$actionInfo = _$_HomeScreenCoordinatorStoreBaseActionController
        .startAction(name: '_HomeScreenCoordinatorStoreBase.gestureListener');
    try {
      return super.gestureListener();
    } finally {
      _$_HomeScreenCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic holdListener() {
    final _$actionInfo = _$_HomeScreenCoordinatorStoreBaseActionController
        .startAction(name: '_HomeScreenCoordinatorStoreBase.holdListener');
    try {
      return super.holdListener();
    } finally {
      _$_HomeScreenCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fadeTheTextOutAndWaterComesDown(
      PlacesYouCanGo thePlaceTheyAreGoingParam) {
    final _$actionInfo =
        _$_HomeScreenCoordinatorStoreBaseActionController.startAction(
            name:
                '_HomeScreenCoordinatorStoreBase.fadeTheTextOutAndWaterComesDown');
    try {
      return super.fadeTheTextOutAndWaterComesDown(thePlaceTheyAreGoingParam);
    } finally {
      _$_HomeScreenCoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
thePlaceTheyAreGoing: ${thePlaceTheyAreGoing},
isNavigating: ${isNavigating}
    ''';
  }
}

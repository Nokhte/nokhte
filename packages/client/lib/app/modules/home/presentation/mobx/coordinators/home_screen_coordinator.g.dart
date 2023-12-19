// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_coordinator.dart';

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

  late final _$homeScreenConstructorCallbackAsyncAction = AsyncAction(
      '_HomeScreenCoordinatorStoreBase.homeScreenConstructorCallback',
      context: context);

  @override
  Future homeScreenConstructorCallback() {
    return _$homeScreenConstructorCallbackAsyncAction
        .run(() => super.homeScreenConstructorCallback());
  }

  @override
  String toString() {
    return '''
thePlaceTheyAreGoing: ${thePlaceTheyAreGoing}
    ''';
  }
}

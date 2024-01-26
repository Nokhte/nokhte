// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_perspectives_widgets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BasePerspectivesWidgetsStore on _PerspectivesWidgetsStoreBase, Store {
  late final _$isFirstTimeGoingThroughItAtom = Atom(
      name: '_PerspectivesWidgetsStoreBase.isFirstTimeGoingThroughIt',
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

  late final _$beachWavesVisibilityAtom = Atom(
      name: '_PerspectivesWidgetsStoreBase.beachWavesVisibility',
      context: context);

  @override
  bool get beachWavesVisibility {
    _$beachWavesVisibilityAtom.reportRead();
    return super.beachWavesVisibility;
  }

  @override
  set beachWavesVisibility(bool value) {
    _$beachWavesVisibilityAtom.reportWrite(value, super.beachWavesVisibility,
        () {
      super.beachWavesVisibility = value;
    });
  }

  late final _$_PerspectivesWidgetsStoreBaseActionController =
      ActionController(name: '_PerspectivesWidgetsStoreBase', context: context);

  @override
  dynamic toggleBeachWavesVisibility() {
    final _$actionInfo =
        _$_PerspectivesWidgetsStoreBaseActionController.startAction(
            name: '_PerspectivesWidgetsStoreBase.toggleBeachWavesVisibility');
    try {
      return super.toggleBeachWavesVisibility();
    } finally {
      _$_PerspectivesWidgetsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstTimeGoingThroughIt: ${isFirstTimeGoingThroughIt},
beachWavesVisibility: ${beachWavesVisibility}
    ''';
  }
}

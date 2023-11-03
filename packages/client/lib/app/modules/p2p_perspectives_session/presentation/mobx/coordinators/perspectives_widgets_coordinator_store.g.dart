// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perspectives_widgets_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerspectivesWidgetsCoordinatorStore
    on _PerspectivesWidgetsCoordinatorStoreBase, Store {
  late final _$beachWavesVisibilityAtom = Atom(
      name: '_PerspectivesWidgetsCoordinatorStoreBase.beachWavesVisibility',
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

  late final _$_PerspectivesWidgetsCoordinatorStoreBaseActionController =
      ActionController(
          name: '_PerspectivesWidgetsCoordinatorStoreBase', context: context);

  @override
  dynamic toggleBeachWavesVisibility() {
    final _$actionInfo =
        _$_PerspectivesWidgetsCoordinatorStoreBaseActionController.startAction(
            name:
                '_PerspectivesWidgetsCoordinatorStoreBase.toggleBeachWavesVisibility');
    try {
      return super.toggleBeachWavesVisibility();
    } finally {
      _$_PerspectivesWidgetsCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
beachWavesVisibility: ${beachWavesVisibility}
    ''';
  }
}

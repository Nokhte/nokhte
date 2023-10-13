// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_horizon_water_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachHorizonWaterTrackerStore
    on _BeachHorizonWaterTrackerStoreBase, Store {
  late final _$movieAtom =
      Atom(name: '_BeachHorizonWaterTrackerStoreBase.movie', context: context);

  @override
  MovieTween get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(MovieTween value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$controlAtom = Atom(
      name: '_BeachHorizonWaterTrackerStoreBase.control', context: context);

  @override
  Control get control {
    _$controlAtom.reportRead();
    return super.control;
  }

  @override
  set control(Control value) {
    _$controlAtom.reportWrite(value, super.control, () {
      super.control = value;
    });
  }

  late final _$_BeachHorizonWaterTrackerStoreBaseActionController =
      ActionController(
          name: '_BeachHorizonWaterTrackerStoreBase', context: context);

  @override
  dynamic selectTimeBasedMovie(DateTime date) {
    final _$actionInfo =
        _$_BeachHorizonWaterTrackerStoreBaseActionController.startAction(
            name: '_BeachHorizonWaterTrackerStoreBase.selectTimeBasedMovie');
    try {
      return super.selectTimeBasedMovie(date);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setControl(Control newControl) {
    final _$actionInfo = _$_BeachHorizonWaterTrackerStoreBaseActionController
        .startAction(name: '_BeachHorizonWaterTrackerStoreBase.setControl');
    try {
      return super.setControl(newControl);
    } finally {
      _$_BeachHorizonWaterTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
control: ${control}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nokhte_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NokhteStore on _NokhteStoreBase, Store {
  Computed<bool>? _$isAboutToApparateComputed;

  @override
  bool get isAboutToApparate => (_$isAboutToApparateComputed ??= Computed<bool>(
          () => super.isAboutToApparate,
          name: '_NokhteStoreBase.isAboutToApparate'))
      .value;

  late final _$centerCoordinatesAtom =
      Atom(name: '_NokhteStoreBase.centerCoordinates', context: context);

  @override
  Offset get centerCoordinates {
    _$centerCoordinatesAtom.reportRead();
    return super.centerCoordinates;
  }

  @override
  set centerCoordinates(Offset value) {
    _$centerCoordinatesAtom.reportWrite(value, super.centerCoordinates, () {
      super.centerCoordinates = value;
    });
  }

  late final _$movieModeAtom =
      Atom(name: '_NokhteStoreBase.movieMode', context: context);

  @override
  NokhteMovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(NokhteMovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
    });
  }

  late final _$_NokhteStoreBaseActionController =
      ActionController(name: '_NokhteStoreBase', context: context);

  @override
  dynamic setMovieModes(NokhteMovieModes newMovieMode) {
    final _$actionInfo = _$_NokhteStoreBaseActionController.startAction(
        name: '_NokhteStoreBase.setMovieModes');
    try {
      return super.setMovieModes(newMovieMode);
    } finally {
      _$_NokhteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCenterCoordinates(Offset newCenter) {
    final _$actionInfo = _$_NokhteStoreBaseActionController.startAction(
        name: '_NokhteStoreBase.setCenterCoordinates');
    try {
      return super.setCenterCoordinates(newCenter);
    } finally {
      _$_NokhteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_NokhteStoreBaseActionController.startAction(
        name: '_NokhteStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_NokhteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initMoveUpAndApparateMovie() {
    final _$actionInfo = _$_NokhteStoreBaseActionController.startAction(
        name: '_NokhteStoreBase.initMoveUpAndApparateMovie');
    try {
      return super.initMoveUpAndApparateMovie();
    } finally {
      _$_NokhteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initPositionMovie(Offset touchPoint, Offset centerPoint) {
    final _$actionInfo = _$_NokhteStoreBaseActionController.startAction(
        name: '_NokhteStoreBase.initPositionMovie');
    try {
      return super.initPositionMovie(touchPoint, centerPoint);
    } finally {
      _$_NokhteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
centerCoordinates: ${centerCoordinates},
movieMode: ${movieMode},
isAboutToApparate: ${isAboutToApparate}
    ''';
  }
}

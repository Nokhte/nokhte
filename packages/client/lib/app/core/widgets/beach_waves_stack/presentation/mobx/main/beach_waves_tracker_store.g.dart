// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_waves_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachWavesTrackerStore on _BeachWavesTrackerStoreBase, Store {
  late final _$movieAtom =
      Atom(name: '_BeachWavesTrackerStoreBase.movie', context: context);

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

  late final _$isReadyToTransitionAtom = Atom(
      name: '_BeachWavesTrackerStoreBase.isReadyToTransition',
      context: context);

  @override
  bool get isReadyToTransition {
    _$isReadyToTransitionAtom.reportRead();
    return super.isReadyToTransition;
  }

  @override
  set isReadyToTransition(bool value) {
    _$isReadyToTransitionAtom.reportWrite(value, super.isReadyToTransition, () {
      super.isReadyToTransition = value;
    });
  }

  late final _$passingParamAtom =
      Atom(name: '_BeachWavesTrackerStoreBase.passingParam', context: context);

  @override
  double get passingParam {
    _$passingParamAtom.reportRead();
    return super.passingParam;
  }

  @override
  set passingParam(double value) {
    _$passingParamAtom.reportWrite(value, super.passingParam, () {
      super.passingParam = value;
    });
  }

  late final _$movieModeAtom =
      Atom(name: '_BeachWavesTrackerStoreBase.movieMode', context: context);

  @override
  MovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(MovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
    });
  }

  late final _$controlAtom =
      Atom(name: '_BeachWavesTrackerStoreBase.control', context: context);

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

  late final _$_BeachWavesTrackerStoreBaseActionController =
      ActionController(name: '_BeachWavesTrackerStoreBase', context: context);

  @override
  dynamic gestureFunctionRouter() {
    final _$actionInfo = _$_BeachWavesTrackerStoreBaseActionController
        .startAction(name: '_BeachWavesTrackerStoreBase.gestureFunctionRouter');
    try {
      return super.gestureFunctionRouter();
    } finally {
      _$_BeachWavesTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic teeOceanDiveMovieUp({required double startingWaterMovement}) {
    final _$actionInfo = _$_BeachWavesTrackerStoreBaseActionController
        .startAction(name: '_BeachWavesTrackerStoreBase.teeOceanDiveMovieUp');
    try {
      return super
          .teeOceanDiveMovieUp(startingWaterMovement: startingWaterMovement);
    } finally {
      _$_BeachWavesTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic makeNavigationChange({required double startingWaterMovement}) {
    final _$actionInfo = _$_BeachWavesTrackerStoreBaseActionController
        .startAction(name: '_BeachWavesTrackerStoreBase.makeNavigationChange');
    try {
      return super
          .makeNavigationChange(startingWaterMovement: startingWaterMovement);
    } finally {
      _$_BeachWavesTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initiateOceanDive() {
    final _$actionInfo = _$_BeachWavesTrackerStoreBaseActionController
        .startAction(name: '_BeachWavesTrackerStoreBase.initiateOceanDive');
    try {
      return super.initiateOceanDive();
    } finally {
      _$_BeachWavesTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic navigateProperly() {
    final _$actionInfo = _$_BeachWavesTrackerStoreBaseActionController
        .startAction(name: '_BeachWavesTrackerStoreBase.navigateProperly');
    try {
      return super.navigateProperly();
    } finally {
      _$_BeachWavesTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
isReadyToTransition: ${isReadyToTransition},
passingParam: ${passingParam},
movieMode: ${movieMode},
control: ${control}
    ''';
  }
}

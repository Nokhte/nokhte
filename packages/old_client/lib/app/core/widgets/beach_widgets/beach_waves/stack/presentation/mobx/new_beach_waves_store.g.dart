// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_beach_waves_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewBeachWavesStore on _NewBeachWavesStoreBase, Store {
  Computed<BaseCustomAnimatedWidgetStore<dynamic>>? _$currentStoreComputed;

  @override
  BaseCustomAnimatedWidgetStore<dynamic> get currentStore =>
      (_$currentStoreComputed ??=
              Computed<BaseCustomAnimatedWidgetStore<dynamic>>(
                  () => super.currentStore,
                  name: '_NewBeachWavesStoreBase.currentStore'))
          .value;
  Computed<Control>? _$currentControlComputed;

  @override
  Control get currentControl => (_$currentControlComputed ??= Computed<Control>(
          () => super.currentControl,
          name: '_NewBeachWavesStoreBase.currentControl'))
      .value;
  Computed<MovieStatus>? _$currentMovieStatusComputed;

  @override
  MovieStatus get currentMovieStatus => (_$currentMovieStatusComputed ??=
          Computed<MovieStatus>(() => super.currentMovieStatus,
              name: '_NewBeachWavesStoreBase.currentMovieStatus'))
      .value;
  Computed<MovieTween>? _$currentMovieComputed;

  @override
  MovieTween get currentMovie =>
      (_$currentMovieComputed ??= Computed<MovieTween>(() => super.currentMovie,
              name: '_NewBeachWavesStoreBase.currentMovie'))
          .value;

  late final _$finishedCountAtom =
      Atom(name: '_NewBeachWavesStoreBase.finishedCount', context: context);

  @override
  int get finishedCount {
    _$finishedCountAtom.reportRead();
    return super.finishedCount;
  }

  @override
  set finishedCount(int value) {
    _$finishedCountAtom.reportWrite(value, super.finishedCount, () {
      super.finishedCount = value;
    });
  }

  late final _$pivotColorsAtom =
      Atom(name: '_NewBeachWavesStoreBase.pivotColors', context: context);

  @override
  ObservableList<ColorAndStop> get pivotColors {
    _$pivotColorsAtom.reportRead();
    return super.pivotColors;
  }

  @override
  set pivotColors(ObservableList<ColorAndStop> value) {
    _$pivotColorsAtom.reportWrite(value, super.pivotColors, () {
      super.pivotColors = value;
    });
  }

  late final _$movieStatusAtom =
      Atom(name: '_NewBeachWavesStoreBase.movieStatus', context: context);

  @override
  MovieStatus get movieStatus {
    _$movieStatusAtom.reportRead();
    return super.movieStatus;
  }

  @override
  set movieStatus(MovieStatus value) {
    _$movieStatusAtom.reportWrite(value, super.movieStatus, () {
      super.movieStatus = value;
    });
  }

  late final _$movieModeAtom =
      Atom(name: '_NewBeachWavesStoreBase.movieMode', context: context);

  @override
  BeachWaveMovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(BeachWaveMovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
    });
  }

  late final _$_NewBeachWavesStoreBaseActionController =
      ActionController(name: '_NewBeachWavesStoreBase', context: context);

  @override
  dynamic onCompleted() {
    final _$actionInfo = _$_NewBeachWavesStoreBaseActionController.startAction(
        name: '_NewBeachWavesStoreBase.onCompleted');
    try {
      return super.onCompleted();
    } finally {
      _$_NewBeachWavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPivotColors(List<dynamic> currentAnimationValues) {
    final _$actionInfo = _$_NewBeachWavesStoreBaseActionController.startAction(
        name: '_NewBeachWavesStoreBase.setPivotColors');
    try {
      return super.setPivotColors(currentAnimationValues);
    } finally {
      _$_NewBeachWavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMovieMode(BeachWaveMovieModes newMovieMode) {
    final _$actionInfo = _$_NewBeachWavesStoreBaseActionController.startAction(
        name: '_NewBeachWavesStoreBase.setMovieMode');
    try {
      return super.setMovieMode(newMovieMode);
    } finally {
      _$_NewBeachWavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
finishedCount: ${finishedCount},
pivotColors: ${pivotColors},
movieStatus: ${movieStatus},
movieMode: ${movieMode},
currentStore: ${currentStore},
currentControl: ${currentControl},
currentMovieStatus: ${currentMovieStatus},
currentMovie: ${currentMovie}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_beach_waves_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewBeachWavesStore on _NewBeachWavesStoreBase, Store {
  Computed<Control>? _$currentControlComputed;

  @override
  Control get currentControl => (_$currentControlComputed ??= Computed<Control>(
          () => super.currentControl,
          name: '_NewBeachWavesStoreBase.currentControl'))
      .value;
  Computed<MovieTween>? _$currentMovieComputed;

  @override
  MovieTween get currentMovie =>
      (_$currentMovieComputed ??= Computed<MovieTween>(() => super.currentMovie,
              name: '_NewBeachWavesStoreBase.currentMovie'))
          .value;

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
movieMode: ${movieMode},
currentControl: ${currentControl},
currentMovie: ${currentMovie}
    ''';
  }
}

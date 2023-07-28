// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breathing_pentagons_state_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BreathingPentagonsStateTrackerStore
    on _BreathingPentagonsStateTrackerStoreBase, Store {
  late final _$movieAtom = Atom(
      name: '_BreathingPentagonsStateTrackerStoreBase.movie', context: context);

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

  late final _$movieCountAtom = Atom(
      name: '_BreathingPentagonsStateTrackerStoreBase.movieCount',
      context: context);

  @override
  int get movieCount {
    _$movieCountAtom.reportRead();
    return super.movieCount;
  }

  @override
  set movieCount(int value) {
    _$movieCountAtom.reportWrite(value, super.movieCount, () {
      super.movieCount = value;
    });
  }

  late final _$currentMovieAtom = Atom(
      name: '_BreathingPentagonsStateTrackerStoreBase.currentMovie',
      context: context);

  @override
  String get currentMovie {
    _$currentMovieAtom.reportRead();
    return super.currentMovie;
  }

  @override
  set currentMovie(String value) {
    _$currentMovieAtom.reportWrite(value, super.currentMovie, () {
      super.currentMovie = value;
    });
  }

  late final _$controlTypeAtom = Atom(
      name: '_BreathingPentagonsStateTrackerStoreBase.controlType',
      context: context);

  @override
  Control get controlType {
    _$controlTypeAtom.reportRead();
    return super.controlType;
  }

  @override
  set controlType(Control value) {
    _$controlTypeAtom.reportWrite(value, super.controlType, () {
      super.controlType = value;
    });
  }

  late final _$isExpansionDoneAtom = Atom(
      name: '_BreathingPentagonsStateTrackerStoreBase.isExpansionDone',
      context: context);

  @override
  bool get isExpansionDone {
    _$isExpansionDoneAtom.reportRead();
    return super.isExpansionDone;
  }

  @override
  set isExpansionDone(bool value) {
    _$isExpansionDoneAtom.reportWrite(value, super.isExpansionDone, () {
      super.isExpansionDone = value;
    });
  }

  late final _$areColorChangesDoneAtom = Atom(
      name: '_BreathingPentagonsStateTrackerStoreBase.areColorChangesDone',
      context: context);

  @override
  bool get areColorChangesDone {
    _$areColorChangesDoneAtom.reportRead();
    return super.areColorChangesDone;
  }

  @override
  set areColorChangesDone(bool value) {
    _$areColorChangesDoneAtom.reportWrite(value, super.areColorChangesDone, () {
      super.areColorChangesDone = value;
    });
  }

  late final _$_BreathingPentagonsStateTrackerStoreBaseActionController =
      ActionController(
          name: '_BreathingPentagonsStateTrackerStoreBase', context: context);

  @override
  void expansionIsDone() {
    final _$actionInfo =
        _$_BreathingPentagonsStateTrackerStoreBaseActionController.startAction(
            name: '_BreathingPentagonsStateTrackerStoreBase.expansionIsDone');
    try {
      return super.expansionIsDone();
    } finally {
      _$_BreathingPentagonsStateTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
movieCount: ${movieCount},
currentMovie: ${currentMovie},
controlType: ${controlType},
isExpansionDone: ${isExpansionDone},
areColorChangesDone: ${areColorChangesDone}
    ''';
  }
}

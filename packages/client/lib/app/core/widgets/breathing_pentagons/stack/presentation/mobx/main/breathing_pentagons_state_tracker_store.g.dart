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

  late final _$modeAtom = Atom(
      name: '_BreathingPentagonsStateTrackerStoreBase.mode', context: context);

  @override
  MovieModes get mode {
    _$modeAtom.reportRead();
    return super.mode;
  }

  @override
  set mode(MovieModes value) {
    _$modeAtom.reportWrite(value, super.mode, () {
      super.mode = value;
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

  late final _$_BreathingPentagonsStateTrackerStoreBaseActionController =
      ActionController(
          name: '_BreathingPentagonsStateTrackerStoreBase', context: context);

  @override
  dynamic teeReverseMovieUp(
      {required double angle,
      required double scale,
      required Color firstPentagonFirstGradient,
      required Color firstPentagonSecondGradient,
      required Color secondPentagonFirstGradient,
      required Color secondPentagonSecondGradient,
      required Color thirdPentagonFirstGradient,
      required Color thirdPentagonSecondGradient}) {
    final _$actionInfo =
        _$_BreathingPentagonsStateTrackerStoreBaseActionController.startAction(
            name: '_BreathingPentagonsStateTrackerStoreBase.teeReverseMovieUp');
    try {
      return super.teeReverseMovieUp(
          angle: angle,
          scale: scale,
          firstPentagonFirstGradient: firstPentagonFirstGradient,
          firstPentagonSecondGradient: firstPentagonSecondGradient,
          secondPentagonFirstGradient: secondPentagonFirstGradient,
          secondPentagonSecondGradient: secondPentagonSecondGradient,
          thirdPentagonFirstGradient: thirdPentagonFirstGradient,
          thirdPentagonSecondGradient: thirdPentagonSecondGradient);
    } finally {
      _$_BreathingPentagonsStateTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic gestureFunctionRouter() {
    final _$actionInfo =
        _$_BreathingPentagonsStateTrackerStoreBaseActionController.startAction(
            name:
                '_BreathingPentagonsStateTrackerStoreBase.gestureFunctionRouter');
    try {
      return super.gestureFunctionRouter();
    } finally {
      _$_BreathingPentagonsStateTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCompletedAnimationCallback() {
    final _$actionInfo =
        _$_BreathingPentagonsStateTrackerStoreBaseActionController.startAction(
            name:
                '_BreathingPentagonsStateTrackerStoreBase.onCompletedAnimationCallback');
    try {
      return super.onCompletedAnimationCallback();
    } finally {
      _$_BreathingPentagonsStateTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initiateReverseMovie() {
    final _$actionInfo =
        _$_BreathingPentagonsStateTrackerStoreBaseActionController.startAction(
            name:
                '_BreathingPentagonsStateTrackerStoreBase.initiateReverseMovie');
    try {
      return super.initiateReverseMovie();
    } finally {
      _$_BreathingPentagonsStateTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initiateAggressiveExpansion() {
    final _$actionInfo =
        _$_BreathingPentagonsStateTrackerStoreBaseActionController.startAction(
            name:
                '_BreathingPentagonsStateTrackerStoreBase.initiateAggressiveExpansion');
    try {
      return super.initiateAggressiveExpansion();
    } finally {
      _$_BreathingPentagonsStateTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void initiateInfiniteRotation() {
    final _$actionInfo =
        _$_BreathingPentagonsStateTrackerStoreBaseActionController.startAction(
            name:
                '_BreathingPentagonsStateTrackerStoreBase.initiateInfiniteRotation');
    try {
      return super.initiateInfiniteRotation();
    } finally {
      _$_BreathingPentagonsStateTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
mode: ${mode},
controlType: ${controlType}
    ''';
  }
}

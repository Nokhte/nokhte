// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'preset_diagram_store.g.dart';

class PresetDiagramStore = _PresetDiagramStoreBase with _$PresetDiagramStore;

abstract class _PresetDiagramStoreBase
    extends BaseWidgetStore<PresetDiagramMovieModes> with Store {
  _PresetDiagramStoreBase() {
    final movies = PresetDiagramMovies();
    setMovie(movies.appear);
  }

  @observable
  PresetDiagramMovieModes movieMode = PresetDiagramMovieModes.appear;

  @observable
  bool isASocraticSession = false;

  @action
  setIsASocraticSession(bool value) => isASocraticSession = value;

  @action
  setMovieMode(PresetDiagramMovieModes movieMode) => this.movieMode = movieMode;

  @override
  initMovie(PresetDiagramMovieModes param) {
    setMovie(getCurrentMovie(param));
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
    Timer(Seconds.get(0, milli: 0), () {
      setMovieMode(param);
    });
  }

  @computed
  int get numOfCircles {
    if (isAOneCircleMovie) {
      return 1;
    } else if (isATwoCircleMovie) {
      return 2;
    } else if (isAThreeCircleMovie) {
      return 3;
    } else if (isAFourCircleMovie) {
      return 4;
    } else {
      return 0;
    }
  }

  MovieTween getCurrentMovie(PresetDiagramMovieModes movieMode) {
    final movies = PresetDiagramMovies();
    switch (movieMode) {
      case PresetDiagramMovieModes.appear:
        return movies.appear;
      case PresetDiagramMovieModes.showSecondCircle:
        return movies.showSecondCircle;
      case PresetDiagramMovieModes.showLeftLine:
        return movies.showLeftTalkingPhone;
      case PresetDiagramMovieModes.showRightLine:
        return movies.showRightNotesPhone;
      case PresetDiagramMovieModes.showBothLines:
        return movies.showBothTalkingPhones;
      case PresetDiagramMovieModes.consolidateThePair:
        return movies.consolidateThePair;
      case PresetDiagramMovieModes.trioExpansion:
        return movies.trioExpansion;
      case PresetDiagramMovieModes.trioConsolidation:
        return movies.trioConsolidation;
      case PresetDiagramMovieModes.fourWayExpansion:
        return movies.fourWayExpansion;
      case PresetDiagramMovieModes.fourWayConsolidation:
        return movies.fourWayConsolidation;
      case PresetDiagramMovieModes.whiteToHalfAndHalfCircle:
        return movies.whiteToHalfAndHalfCircle;
      case PresetDiagramMovieModes.hideSingleCircle:
        return movies.hideSingleCircle;
    }
  }

  @computed
  List<List<Alignment>> get lineGradAlignments {
    if (isAZeroLineMovie) {
      return List.empty();
    } else if (isAOneLineMovie || isATwoLineMovie) {
      return PresetDiagamConstants.twoLineAlignment;
    } else if (isAThreeLineMovie) {
      return PresetDiagamConstants.threeLineAlignment;
    } else if (isAFourLineMovie) {
      return PresetDiagamConstants.fourLineAlignment;
    } else {
      return List.empty();
    }
  }

  @computed
  int get numOfLines {
    if (isAZeroLineMovie) {
      return 0;
    } else if (isAOneLineMovie) {
      return 1;
    } else if (isATwoLineMovie) {
      return 2;
    } else if (isAThreeLineMovie) {
      return 3;
    } else if (isAFourCircleMovie) {
      return 4;
    } else {
      return 0;
    }
  }

  @computed
  List<LineGradientTypes> get lineGrads {
    if (!isASocraticSession) {
      return PresetDiagamConstants.alternatingGrads;
    } else {
      return PresetDiagamConstants.talkingGrads;
    }
  }

  @computed
  bool get isAOneCircleMovie =>
      movieMode == PresetDiagramMovieModes.appear ||
      movieMode == PresetDiagramMovieModes.hideSingleCircle ||
      movieMode == PresetDiagramMovieModes.whiteToHalfAndHalfCircle;

  @computed
  bool get isATwoCircleMovie =>
      movieMode == PresetDiagramMovieModes.showSecondCircle ||
      movieMode == PresetDiagramMovieModes.showLeftLine ||
      movieMode == PresetDiagramMovieModes.showRightLine ||
      movieMode == PresetDiagramMovieModes.showRightLine ||
      movieMode == PresetDiagramMovieModes.consolidateThePair ||
      movieMode == PresetDiagramMovieModes.showBothLines;

  @computed
  bool get isAThreeCircleMovie =>
      movieMode == PresetDiagramMovieModes.trioExpansion ||
      movieMode == PresetDiagramMovieModes.trioConsolidation;

  @computed
  bool get isAFourCircleMovie =>
      movieMode == PresetDiagramMovieModes.fourWayExpansion ||
      movieMode == PresetDiagramMovieModes.fourWayConsolidation;

  @computed
  bool get isAZeroLineMovie =>
      movieMode == PresetDiagramMovieModes.appear ||
      movieMode == PresetDiagramMovieModes.hideSingleCircle ||
      movieMode == PresetDiagramMovieModes.showSecondCircle ||
      movieMode == PresetDiagramMovieModes.whiteToHalfAndHalfCircle;

  @computed
  bool get isAOneLineMovie => movieMode == PresetDiagramMovieModes.showLeftLine;

  @computed
  bool get isATwoLineMovie =>
      movieMode == PresetDiagramMovieModes.showRightLine ||
      movieMode == PresetDiagramMovieModes.consolidateThePair ||
      movieMode == PresetDiagramMovieModes.showBothLines;

  @computed
  bool get isAThreeLineMovie =>
      movieMode == PresetDiagramMovieModes.trioExpansion ||
      movieMode == PresetDiagramMovieModes.trioConsolidation;

  @computed
  bool get isAFourLineMovie =>
      movieMode == PresetDiagramMovieModes.fourWayExpansion ||
      movieMode == PresetDiagramMovieModes.fourWayConsolidation;
}

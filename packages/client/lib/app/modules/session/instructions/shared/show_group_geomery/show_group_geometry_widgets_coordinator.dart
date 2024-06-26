// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
part 'show_group_geometry_widgets_coordinator.g.dart';

class ShowGroupGeometryWidgetsCoordinator = _ShowGroupGeometryWidgetsCoordinatorBase
    with _$ShowGroupGeometryWidgetsCoordinator;

abstract class _ShowGroupGeometryWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final PresetDiagramStore presetDiagram;
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final TouchRippleStore touchRipple;
  _ShowGroupGeometryWidgetsCoordinatorBase({
    required super.wifiDisconnectOverlay,
    required this.presetDiagram,
    required this.beachWaves,
    required this.smartText,
    required this.touchRipple,
  });

  @observable
  bool canTap = false;

  @observable
  bool isASocraticSession = false;

  @action
  constructor({required bool isASocraticSession}) {
    this.isASocraticSession = isASocraticSession;
    beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToBorealis);
    smartText.setMessagesData(SessionLists.showGroupGeometry);
    smartText.setStaticAltMovie(SessionConstants.blue);
    presetDiagram.setIsASocraticSession(true);
    presetDiagram.initMovie(PresetDiagramMovieModes.appear);
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(presetDiagramsMovieStatusReactor());
  }

  @action
  onTap(Offset tapPosition) {
    if (gestureIsAllowed) {
      canTap = false;
      presetDiagram.setWidgetVisibility(false);
      beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToSky);
      beachWaves.currentStore.initMovie(NoParams());
    }
  }

  presetDiagramsMovieStatusReactor() =>
      reaction((p0) => presetDiagram.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (presetDiagram.movieMode == PresetDiagramMovieModes.appear) {
            Timer(Seconds.get(0, milli: 500), () {
              presetDiagram.initMovie(PresetDiagramMovieModes.showSecondCircle);
            });
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.showSecondCircle) {
            smartText.startRotatingText();
            Timer(Seconds.get(0, milli: 500), () {
              presetDiagram.initMovie(PresetDiagramMovieModes.showBothLines);
            });
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.showBothLines) {
            Timer(Seconds.get(1), () {
              presetDiagram
                  .initMovie(PresetDiagramMovieModes.consolidateThePair);
              smartText.startRotatingText(isResuming: true);
            });
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.consolidateThePair) {
            smartText.startRotatingText(isResuming: true);
            presetDiagram.initMovie(PresetDiagramMovieModes.trioExpansion);
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.trioExpansion) {
            Timer(Seconds.get(1), () {
              smartText.startRotatingText(isResuming: true);
              presetDiagram
                  .initMovie(PresetDiagramMovieModes.trioConsolidation);
            });
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.trioConsolidation) {
            presetDiagram.initMovie(PresetDiagramMovieModes.fourWayExpansion);
            smartText.startRotatingText(isResuming: true);
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.fourWayExpansion) {
            Timer(Seconds.get(1), () {
              smartText.startRotatingText(isResuming: true);
              presetDiagram
                  .initMovie(PresetDiagramMovieModes.fourWayConsolidation);
            });
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.fourWayConsolidation) {
            presetDiagram.initMovie(PresetDiagramMovieModes.hideSingleCircle);
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.hideSingleCircle) {
            Modular.to.navigate(SessionConstants.lobby, arguments: {});
          }
        }
      });

  @computed
  bool get gestureIsAllowed =>
      presetDiagram.movieStatus != MovieStatus.inProgress && canTap;
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_preview_widgets_coordinator.g.dart';

class SessionPreviewWidgetsCoordinator = _SessionPreviewWidgetsCoordinatorBase
    with _$SessionPreviewWidgetsCoordinator;

abstract class _SessionPreviewWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final TouchRippleStore touchRipple;
  final ExpandedPresetCardsStore presetCard;

  _SessionPreviewWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.presetCard,
    required this.touchRipple,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(
      BeachWaveMovieModes.deepSeaToSky,
    );
    primarySmartText.setMessagesData(SessionLists.previewHeader);
  }

  onSessionTypeReceived({
    required String sessionName,
    required List tags,
  }) {
    presetCard.setExpandedCard(name: sessionName, tags: tags);
    primarySmartText.startRotatingText();
  }

  @observable
  bool isNavigatingAway = false;

  @action
  hidePrimarySmartText() => primarySmartText.setWidgetVisibility(false);

  @observable
  bool isFirstTap = true;

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @action
  onTap(Offset tapPosition) async {
    if (isFirstTap) {
      touchRipple.onTap(tapPosition);
      presetCard.setWidgetVisibility(false);
      isNavigatingAway = true;
      primarySmartText.startRotatingText(isResuming: true);
      isFirstTap = false;
    }
  }

  @action
  onCollaboratorLeft() {
    primarySmartText.setWidgetVisibility(false);
    presetCard.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    primarySmartText.setWidgetVisibility(primarySmartText.pastShowWidget);
    presetCard.setWidgetVisibility(presetCard.pastShowWidget);
  }
}

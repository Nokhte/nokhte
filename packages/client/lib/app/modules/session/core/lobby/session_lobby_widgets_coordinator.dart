// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_lobby_widgets_coordinator.g.dart';

class SessionLobbyWidgetsCoordinator = _SessionLobbyWidgetsCoordinatorBase
    with _$SessionLobbyWidgetsCoordinator;

abstract class _SessionLobbyWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final NokhteQrCodeStore qrCode;
  final TouchRippleStore touchRipple;
  final PresetIconsStore presetIcons;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionLobbyWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.presetIcons,
    required this.primarySmartText,
    required this.wifiDisconnectOverlay,
    required this.qrCode,
    required this.touchRipple,
  }) {
    initBaseWidgetsCoordinatorActions();
    presetIcons.setContainerSize(.2);
    presetIcons.setIsHorizontal(true);
  }

  @observable
  bool constructorHasBeenCalled = false;

  @action
  constructor() {
    beachWaves.setMovieMode(
      BeachWaveMovieModes.deepSeaToSky,
    );
    if (isTheLeader) {
      qrCode.setQrCodeData(Modular.args.data["qrCodeData"]);
      primarySmartText.setMessagesData(SharedLists.emptyList);
    } else {
      primarySmartText.setMessagesData(SharedLists.emptyList);
      qrCode.setWidgetVisibility(false);
    }
    primarySmartText.startRotatingText();

    presetIcons.setWidgetVisibility(false);
    constructorHasBeenCalled = true;
    disposers.add(smartTextIndexReactor());
  }

  @action
  invisiblizePrimarySmartText() => primarySmartText.setWidgetVisibility(false);

  @observable
  bool isFirstTap = true;

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @action
  onTap(
    Offset tapPosition, {
    required Function onTap,
  }) async {
    if (isFirstTap) {
      touchRipple.onTap(tapPosition);
      isFirstTap = false;
      primarySmartText.startRotatingText(isResuming: true);
    }
    await onTap();
  }

  @action
  onQrCodeReady(String data) {
    if (!isTheLeader && constructorHasBeenCalled) {
      // primarySmartText.setMessagesData(SessionLists.followerLobby);
      // primarySmartText.startRotatingText();
      Timer.periodic(Seconds.get(0, milli: 100), (timer) {
        if (constructorHasBeenCalled) {
          qrCode.setWidgetVisibility(true);
          qrCode.setQrCodeData(data);
          timer.cancel();
        }
      });
    }
  }

  @observable
  bool presetInfoRecieved = false;

  @action
  onPresetInfoRecieved({
    required String presetName,
    required List presetTags,
  }) {
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (constructorHasBeenCalled) {
        primarySmartText.setMessagesData(SessionLists.lobby(presetName));
        presetInfoRecieved = true;
        primarySmartText.startRotatingText(isResuming: true);
        presetIcons.setTags(tags: presetTags);
        presetIcons.setWidgetVisibility(true);
        timer.cancel();
      }
    });
  }

  @action
  onCanStartTheSession() {
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (primarySmartText.currentIndex == 1 && presetInfoRecieved) {
        presetIcons.setWidgetVisibility(false);
        primarySmartText.startRotatingText(isResuming: true);
        timer.cancel();
      }
    });
  }

  @action
  onRevertCanStartSession() {
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (primarySmartText.currentIndex == 2) {
        primarySmartText.startRotatingText(isResuming: true);
        timer.cancel();
      }
    });
  }

  @action
  onCollaboratorLeft() {
    if (presetIcons.showWidget) {
      presetIcons.setWidgetVisibility(false);
    }
    primarySmartText.setWidgetVisibility(false);
    qrCode.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    presetIcons.setWidgetVisibility(presetIcons.pastShowWidget);
    primarySmartText.setWidgetVisibility(primarySmartText.pastShowWidget);
    qrCode.setWidgetVisibility(qrCode.pastShowWidget);
  }

  @action
  enterSession(bool isAValidSession) {
    if (isAValidSession) {
      beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToSky);
      beachWaves.currentStore.initMovie(NoParams());
    } else {
      beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToBorealis);
      beachWaves.currentStore.initMovie(NoParams());
    }
    presetIcons.setWidgetVisibility(false);
    qrCode.setWidgetVisibility(false);
    primarySmartText.setWidgetVisibility(false);
  }

  beachWavesMovieStatusReactor(Function onCompleted) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == beachWaves.movieStatus) onCompleted();
      });

  smartTextIndexReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (isFirstTap) {
          if (p0 == 3) {
            primarySmartText.reset();
            primarySmartText.startRotatingText();
            presetIcons.setWidgetVisibility(true);
          }
        }
      });

  @computed
  bool get isTheLeader => Modular.args.data["qrCodeData"] != null;
}

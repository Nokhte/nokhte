// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_lobby_widgets_coordinator.g.dart';

class SessionLobbyWidgetsCoordinator = _SessionLobbyWidgetsCoordinatorBase
    with _$SessionLobbyWidgetsCoordinator;

abstract class _SessionLobbyWidgetsCoordinatorBase with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final NokhteQrCodeStore qrCode;
  final TouchRippleStore touchRipple;
  final BaseWidgetsCoordinator base;
  final PresetIconsStore presetIcons;

  _SessionLobbyWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.presetIcons,
    required this.primarySmartText,
    required WifiDisconnectOverlayStore wifiDisconnectOverlay,
    required this.qrCode,
    required this.touchRipple,
  }) : base = BaseWidgetsCoordinator(
            wifiDisconnectOverlay: wifiDisconnectOverlay) {
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
      primarySmartText.startRotatingText();
    } else {
      primarySmartText.setMessagesData(SharedLists.emptyList);
      qrCode.setWidgetVisibility(false);
    }
    presetIcons.setWidgetVisibility(false);
    constructorHasBeenCalled = true;
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
      primarySmartText.startRotatingText(isResuming: true);
      isFirstTap = false;
    }
    await onTap();
  }

  @action
  onQrCodeReady(String data) {
    if (!isTheLeader) {
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
    Timer(Seconds.get(0, milli: 10), () {
      primarySmartText.setMessagesData(SessionLists.leaderLobby(presetName));
      presetInfoRecieved = true;
      primarySmartText.startRotatingText();
      presetIcons.setTags(tags: presetTags);
      presetIcons.setWidgetVisibility(true);
    });
  }

  @action
  onCanStartTheSession() {
    presetIcons.setWidgetVisibility(false);
    primarySmartText.startRotatingText(isResuming: true);
  }

  @action
  onCollaboratorLeft() {
    primarySmartText.setWidgetVisibility(false);
    qrCode.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
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

  @computed
  bool get isTheLeader => Modular.args.data["qrCodeData"] != null;
}

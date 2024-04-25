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
part 'irl_nokhte_session_lobby_widgets_coordinator.g.dart';

class IrlNokhteSessionLobbyWidgetsCoordinator = _IrlNokhteSessionLobbyWidgetsCoordinatorBase
    with _$IrlNokhteSessionLobbyWidgetsCoordinator;

abstract class _IrlNokhteSessionLobbyWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final NokhteQrCodeStore qrCode;
  final TouchRippleStore touchRipple;

  _IrlNokhteSessionLobbyWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.qrCode,
    required this.touchRipple,
  });

  @observable
  bool constructorHasBeenCalled = false;

  @action
  constructor() {
    beachWaves.setMovieMode(
      BeachWaveMovieModes.deepSeaToVibrantBlueGrad,
    );
    if (Modular.args.data["qrCodeData"] != null) {
      qrCode.setQrCodeData(Modular.args.data["qrCodeData"]);
      primarySmartText.setMessagesData(
        MessagesData.irlNokhteSessionLeaderLobbyList,
      );
      primarySmartText.startRotatingText();
    } else {
      primarySmartText.setMessagesData(
        MessagesData.empty,
      );
      qrCode.setWidgetVisibility(false);
    }
    constructorHasBeenCalled = true;
    beachWavesMovieStatusReactor();
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
      primarySmartText.setMessagesData(
        MessagesData.irlNokhteSessionFollowerLobbyList,
      );
      primarySmartText.startRotatingText();
      Timer.periodic(Seconds.get(0, milli: 100), (timer) {
        if (constructorHasBeenCalled) {
          qrCode.setWidgetVisibility(true);
          qrCode.setQrCodeData(data);
          timer.cancel();
        }
      });
    }
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
  enterSession() {
    beachWaves.currentStore.initMovie(NoParams());
    qrCode.setWidgetVisibility(false);
    primarySmartText.setWidgetVisibility(false);
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == beachWaves.movieStatus &&
            beachWaves.movieMode ==
                BeachWaveMovieModes.deepSeaToVibrantBlueGrad) {
          Modular.to.navigate("/irl_nokhte_session/greeter");
        }
      });

  @computed
  bool get isTheLeader => Modular.args.data["qrCodeData"] != null;
}

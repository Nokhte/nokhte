// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_information_widgets_coordinator.g.dart';

class SessionInformationWidgetsCoordinator = _SessionInformationWidgetsCoordinatorBase
    with _$SessionInformationWidgetsCoordinator;

abstract class _SessionInformationWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final TintStore tint;
  final TouchRippleStore touchRipple;
  // final ExpandedPresetCardsStore presetCard;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionInformationWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.primarySmartText,
    // required this.presetCard,
    required this.tint,
    required this.touchRipple,
    required this.wifiDisconnectOverlay,
  }) {
    initBaseWidgetsCoordinatorActions();
    tint.startAtEnd();
  }

  @action
  constructor({
    required String sessionName,
    required List tags,
    required SessionScreenTypes phoneType,
  }) {
    beachWaves.setMovieMode(getMovieMode(phoneType));
    primarySmartText.setMessagesData(SessionLists.previewHeader);
    primarySmartText.startRotatingText();
    // presetCard.setWidgetVisibility(false);
    Timer(Seconds.get(0, milli: 1), () {
      // presetCard.setExpandedCard(name: sessionName, tags: tags);
    });
  }

  BeachWaveMovieModes getMovieMode(SessionScreenTypes phoneType) {
    if (phoneType == SessionScreenTypes.soloHybrid ||
        phoneType == SessionScreenTypes.speaking) {
      return BeachWaveMovieModes.halfAndHalfToDrySand;
    } else if (phoneType == SessionScreenTypes.groupHybrid) {
      return BeachWaveMovieModes.invertedHalfAndHalfToDrySand;
    } else if (phoneType == SessionScreenTypes.notes) {
      return BeachWaveMovieModes.skyToDrySand;
    } else {
      return BeachWaveMovieModes.deepSeaToBorealis;
    }
  }

  @action
  onCollaboratorJoined() {
    // presetCard.setWidgetVisibility(true);
    primarySmartText.setWidgetVisibility(true);
  }

  @action
  onCollaboratorLeft() {
    // presetCard.setWidgetVisibility(false);
    primarySmartText.setWidgetVisibility(false);
  }

  @observable
  bool isNavigatingAway = false;

  @action
  hidePrimarySmartText() => primarySmartText.setWidgetVisibility(false);

  @observable
  bool isFirstTap = true;

  @action
  onTap(Offset tapPosition) async {
    if (isFirstTap) {
      touchRipple.onTap(tapPosition);
      // presetCard.setWidgetVisibility(false);
      isNavigatingAway = true;
      tint.initMovie(NoParams());
      primarySmartText.startRotatingText(isResuming: true);
      isFirstTap = false;
    }
  }
}

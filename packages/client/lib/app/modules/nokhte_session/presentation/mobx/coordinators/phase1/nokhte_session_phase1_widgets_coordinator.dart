// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/smart_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'nokhte_session_phase1_widgets_coordinator.g.dart';

class NokhteSessionPhase1WidgetsCoordinator = _NokhteSessionPhase1WidgetsCoordinatorBase
    with _$NokhteSessionPhase1WidgetsCoordinator;

abstract class _NokhteSessionPhase1WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final TextEditorStore textEditor;

  _NokhteSessionPhase1WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.borderGlow,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.wifiDisconnectOverlay,
    required this.textEditor,
  });

  @observable
  bool hasTheQuestion = false;

  @action
  setHasTheQuesion(bool newVal) => hasTheQuestion = newVal;

  @observable
  bool isInTheCall = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    primarySmartText.setMessagesData(MessagesData.empty);
    secondarySmartText.setMessagesData(MessagesData.empty);
    initReactors();
  }

  @action
  initReactors() {
    wifiDisconnectOverlay.initReactors(
      onQuickConnected: () {
        setIsDisconnected(false);
      },
      onLongReConnected: () {
        setIsDisconnected(false);
      },
      onDisconnected: () {
        setIsDisconnected(true);
      },
    );
  }

  @action
  onConnected() {
    setIsDisconnected(false);
  }

  @action
  onDisconnected() {
    setIsDisconnected(true);
  }

  @action
  onHold() {
    borderGlow.initMovie(NoParams());
  }

  @action
  onLetGo() {
    borderGlow.initGlowDown();
    // hideSecondaryText();
  }

  @action
  onInactive() {
    borderGlow.initGlowDown();
  }

  @action
  hasTheQuestionConstructor() {
    primarySmartText
        .setMessagesData(MessagesData.primaryPurposeSessionHasTheQuestion);
    showSecondaryText();
    primarySmartText.startRotatingText();
  }

  @action
  doesNotHaveTheQuestionConstructor() {
    primarySmartText.setMessagesData(
        MessagesData.primaryPurposeSessionDoesNotHaveTheQuestion);
    primarySmartText.startRotatingText();
  }

  @action
  showSecondaryText() {
    if (!secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }

    secondarySmartText.setMessagesData(
      MessagesData.secondaryPurposeSessionPhase1List,
    );
    secondarySmartText.startRotatingText();
  }

  @action
  hideSecondaryText() {
    if (secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }
  }

  wifiDisconnectOverlayReactor({required Function onConnectionFinished}) =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          setIsDisconnected(false);
        }
      });
}

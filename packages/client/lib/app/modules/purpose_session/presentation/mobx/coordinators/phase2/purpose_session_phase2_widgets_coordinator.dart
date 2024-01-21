// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/smart_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'purpose_session_phase2_widgets_coordinator.g.dart';

class PurposeSessionPhase2WidgetsCoordinator = _PurposeSessionPhase2WidgetsCoordinatorBase
    with _$PurposeSessionPhase2WidgetsCoordinator;

abstract class _PurposeSessionPhase2WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore unsubmittedGestureCross;
  final GestureCrossStore submittedGestureCross;
  final TextEditorStore textEditor;

  _PurposeSessionPhase2WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.primarySmartText,
    required this.wifiDisconnectOverlay,
    required this.submittedGestureCross,
    required this.unsubmittedGestureCross,
    required this.textEditor,
  });

  @action
  constructor({
    required Function onKeyboardUp,
    required Function onKeyboardDown,
  }) {
    beachWaves
        .setMovieMode(BeachWaveMovieModes.suspendedAtTheDepthsToTimesUpStart);
    unsubmittedGestureCross.setPhase2PurposeSession();
    submittedGestureCross.setPhase2PurposeSession();
    beachWaves.currentStore.initMovie(NoParams());
    primarySmartText.setMessagesData(MessagesData.purposeSessionPhase2List);
    primarySmartText.startRotatingText();
    textEditor.toggleWidgetVisibility();
    initReactors(
      onKeyboardDown: onKeyboardDown,
      onKeyboardUp: onKeyboardUp,
    );
  }

  @observable
  bool isOverThreeWords = false;

  @observable
  bool isFirstTimeOverThreeWords = true;

  @observable
  bool hasCompletedIntroduction = false;

  @action
  initReactors({
    required Function onKeyboardUp,
    required Function onKeyboardDown,
  }) {
    smartTextIndexReactor();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: () {},
      onDisconnected: () {},
    );
    textEditor.focusNode.addListener(() {
      if (!textEditor.focusNode.hasFocus) {
        if (textEditor.controller.text
            .split(' ')
            .length
            .isGreaterThanOrEqualTo(3)) {
          isOverThreeWords = true;
        } else {
          isOverThreeWords = false;
        }
        onKeyboardDown();
      } else {
        onKeyboardUp();
      }
    });
    threeWordsReactor();
    submittedGestureCrossReactor();
    unsubmittedGestureCrossReactor();
  }

  @action
  onSwipeUp() {
    textEditor.toggleWidgetVisibility();
    unsubmittedGestureCross.initMoveAndRegenerate(CircleOffsets.top);
    if (primarySmartText.currentIndex == 3) {
      primarySmartText.startRotatingText(isResuming: true);
    }
  }

  @action
  onSwipeDown() {
    submittedGestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
    if (primarySmartText.currentIndex == 4) {
      primarySmartText.startRotatingText(isResuming: true);
    }
  }

  submittedGestureCrossReactor() =>
      reaction((p0) => submittedGestureCross.centerCrossNokhte.movieStatus,
          (p0) {
        if (p0 == MovieStatus.finished) {
          unsubmittedGestureCross.toggleAll();
          textEditor.toggleWidgetVisibility();
          submittedGestureCross.toggleAll();
        }
      });

  unsubmittedGestureCrossReactor() =>
      reaction((p0) => unsubmittedGestureCross.centerCrossNokhte.movieStatus,
          (p0) {
        if (p0 == MovieStatus.finished) {
          unsubmittedGestureCross.toggleAll();
          submittedGestureCross.toggleAll();
        }
      });

  smartTextIndexReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 1) {
          textEditor.toggleWidgetVisibility();
        } else if (p0 == 3 && !hasCompletedIntroduction) {
          hasCompletedIntroduction = true;
          textEditor.toggleWidgetVisibility();
        } else if (p0 == 5) {
          primarySmartText.setCurrentIndex(3);
        }
      });

  threeWordsReactor() => reaction((p0) => isOverThreeWords, (p0) {
        if (p0) {
          if (isFirstTimeOverThreeWords) {
            textEditor.toggleWidgetVisibility();
            unsubmittedGestureCross.toggleAll();

            primarySmartText.startRotatingText(isResuming: true);
            isFirstTimeOverThreeWords = false;
          } else {
            unsubmittedGestureCross.toggleAll();
          }
        } else {
          unsubmittedGestureCross.toggleAll();
        }
      });
}

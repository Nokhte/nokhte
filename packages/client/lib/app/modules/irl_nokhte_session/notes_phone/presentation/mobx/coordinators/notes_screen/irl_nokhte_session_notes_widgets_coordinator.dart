// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_notes_widgets_coordinator.g.dart';

class IrlNokhteSessionNotesWidgetsCoordinator = _IrlNokhteSessionNotesWidgetsCoordinatorBase
    with _$IrlNokhteSessionNotesWidgetsCoordinator;

abstract class _IrlNokhteSessionNotesWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final TextEditorStore textEditor;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SmartTextStore smartText;
  _IrlNokhteSessionNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.textEditor,
    required this.smartText,
  });

  @observable
  bool showSubmitText = false;

  @action
  setShowSubmitText(bool newVal) => showSubmitText = newVal;

  @action
  constructor() {
    smartText.setMessagesData(MessagesData.notesSessionPrimaryList);
    smartText.setWidgetVisibility(false);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    textEditor.initFadeIn();
    textEditor.focusNode.addListener(() {
      if (!textEditor.focusNode.hasFocus) {
        if (textEditor.controller.text.length != (0)) {
          smartText.setWidgetVisibility(true);
        } else {
          smartText.setWidgetVisibility(false);
        }
      } else {
        smartText.setWidgetVisibility(false);
      }
    });
  }

  @action
  onSwipeUp(Function(String) onSwipeUp) async {
    await onSwipeUp(textEditor.controller.text);
    smartText.setWidgetVisibility(false);
    textEditor.setWidgetVisibility(false);
    Future.delayed(Seconds.get(1), () {
      textEditor.controller.clear();
      textEditor.setWidgetVisibility(true);
    });
  }
}

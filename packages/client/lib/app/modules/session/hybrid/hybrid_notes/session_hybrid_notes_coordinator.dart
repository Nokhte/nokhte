// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
part 'session_hybrid_notes_coordinator.g.dart';

class SessionHybridNotesCoordinator = _SessionHybridNotesCoordinatorBase
    with _$SessionHybridNotesCoordinator;

abstract class _SessionHybridNotesCoordinatorBase
    with Store, BaseCoordinator, Reactions, SessionPresence {
  final SessionHybridNotesWidgetsCoordinator widgets;
  final SessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;
  final TapDetector tap;

  @override
  final SessionPresenceCoordinator presence;
  @override
  final CaptureScreen captureScreen;

  _SessionHybridNotesCoordinatorBase({
    required this.widgets,
    required this.captureScreen,
    required this.tap,
    required this.presence,
    required this.swipe,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    setBlockPhoneTiltReactor(false);
    widgets.setIsACollaborativeSession(
      sessionMetadata.presetType == PresetTypes.collaborative,
    );
    await presence.updateCurrentPhase(2.0);
    await captureScreen(SessionConstants.hybridNotes);
  }

  @observable
  bool blockPhoneTiltReactor = false;

  @action
  setBlockPhoneTiltReactor(bool newValue) => blockPhoneTiltReactor = newValue;

  initReactors() {
    disposers.add(swipeReactor());
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined(() {
          setBlockPhoneTiltReactor(true);
        });
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    ));
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () => setDisableAllTouchFeedback(false),
      onDisconnected: () => setDisableAllTouchFeedback(true),
    ));
    disposers.add(touchFeedbackStatusReactor());
  }

  touchFeedbackStatusReactor() =>
      reaction((p0) => disableAllTouchFeedback, (p0) {
        if (p0) {
          widgets.textEditor.setIsReadOnly(true);
        } else {
          widgets.textEditor.setIsReadOnly(false);
        }
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeUp(onSwipeUp);
            });
          default:
            break;
        }
      });

  @action
  onSwipeUp(String param) async => await presence.addContent(param);

  deconstructor() {
    dispose();
    widgets.dispose();
  }
}

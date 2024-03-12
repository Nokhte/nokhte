// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_router_coordinator.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session.dart';
part 'irl_nokhte_session_phase3_coordinator.g.dart';

class IrlNokhteSessionPhase3Coordinator = _IrlNokhteSessionPhase3CoordinatorBase
    with _$IrlNokhteSessionPhase3Coordinator;

abstract class _IrlNokhteSessionPhase3CoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final IrlNokhteSessionPhase3WidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;
  final DecidePhoneRole decidePhoneRoleLogic;

  _IrlNokhteSessionPhase3CoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.presence,
    required super.getUserInfo,
    required this.decidePhoneRoleLogic,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await getUserInfo(NoParams());
  }

  @action
  onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
  }

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (presence.getSessionMetadataStore.collaboratorIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }

  @observable
  IrlNokhteSessionPhoneRole phoneRole = IrlNokhteSessionPhoneRole.initial;

  @action
  decidePhoneRole() async {
    final res = await decidePhoneRoleLogic(NoParams());
    res.fold((failure) => errorUpdater(failure),
        (assignedRole) => phoneRole = assignedRole);
  }

  @action
  initReactors() {
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    );
    presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
      },
      onCollaboratorLeft: () async {
        setDisableAllTouchFeedback(true);
      },
    );
    widgets.beachWavesMovieStatusReactor(
      onToHomeComplete: onAnimationComplete,
      onReturnToTalkingComplete: () =>
          Modular.to.navigate('/irl_nokhte_session/speaking'),
    );
    swipeReactor();
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeUp();
              setDisableAllTouchFeedback(true);
            });
          case GestureDirections.down:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeDown(phoneRole);
              setDisableAllTouchFeedback(true);
            });
          default:
            break;
        }
      });

  @computed
  String get pathIntoSession => phoneRole == IrlNokhteSessionPhoneRole.talking
      ? '/irl_nokhte_session/speaking'
      : '/irl_nokhte_session/notes';
}

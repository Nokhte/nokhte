// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'base_home_screen_widgets_coordinator.dart';
part 'base_home_screen_coordinator.g.dart';

class BaseHomeScreenCoordinator = _BaseHomeScreenCoordinatorBase
    with _$BaseHomeScreenCoordinator;

abstract class _BaseHomeScreenCoordinatorBase
    with Store, BaseCoordinator, BaseMobxLogic, Reactions {
  final BaseHomeScreenWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final SessionStartersLogicCoordinator sessionStarters;
  final DeepLinksCoordinator deepLinks;
  final TapDetector tap;
  @override
  final CaptureScreen captureScreen;

  _BaseHomeScreenCoordinatorBase({
    required this.captureScreen,
    required this.sessionStarters,
    required this.swipe,
    required this.tap,
    required this.widgets,
    required this.deepLinks,
  }) {
    initBaseCoordinatorActions();
    initBaseLogicActions();
  }

  @action
  constructor(Offset center) {}

  initReactors() {
    deepLinks.listen();
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        widgets.onLongReconnected();
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.onDisconnected();
      },
    ));
    disposers.add(openedDeepLinksReactor());
    disposers.add(collaboratorPoolEntryErrorReactor());
  }

  @observable
  bool isInErrorMode = false;

  @action
  setIsInErrorMode(bool value) => isInErrorMode = value;

  swipeReactor({
    required Function onSwipeUp,
    required Function onSwipeLeft,
  }) =>
      reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            onSwipeUp();
          case GestureDirections.left:
            onSwipeLeft();
          default:
            break;
        }
      });

  swipeCoordinatesReactor(Function(Offset) onSwipeUpCoordinatesChanged) =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        onSwipeUpCoordinatesChanged(p0);
      });

  collaboratorPoolEntryErrorReactor() =>
      reaction((p0) => sessionStarters.errorMessage, (p0) async {
        if (p0.isNotEmpty) {
          setDisableAllTouchFeedback(true);
          setIsInErrorMode(true);
          deepLinks.reset();
          sessionStarters.resetErrorMessage();
        }
      });

  openedDeepLinksReactor() =>
      reaction((p0) => deepLinks.listenForOpenedDeepLinkStore.path, (p0) async {
        if (deepLinks.listenForOpenedDeepLinkStore
                .additionalMetadata["isTheUsersInvitation"] !=
            null) {
          Timer.periodic(Seconds.get(0, milli: 200), (timer) async {
            if (widgets.beachWaves.movieMode !=
                    BeachWaveMovieModes.anyToOnShore &&
                widgets.beachWaves.movieStatus != MovieStatus.inProgress) {
              timer.cancel();
              if (!widgets.isInErrorMode) {
                setDisableAllTouchFeedback(true);
                final additionalMetadata =
                    deepLinks.listenForOpenedDeepLinkStore.additionalMetadata;
                await sessionStarters.join(additionalMetadata["deepLinkUID"]);
                deepLinks.reset();
                widgets.onDeepLinkOpened();
              } else {
                timer.cancel();
                setDisableAllTouchFeedback(true);
                final additionalMetadata =
                    deepLinks.listenForOpenedDeepLinkStore.additionalMetadata;
                await sessionStarters.join(additionalMetadata["deepLinkUID"]);
                Timer(Seconds.get(2), () {
                  Modular.to.navigate(SessionConstants.preview);
                });
              }
            }
          });
        }
      });

  deconstructor() {
    dispose();
    deepLinks.dispose();
    widgets.dispose();
  }
}

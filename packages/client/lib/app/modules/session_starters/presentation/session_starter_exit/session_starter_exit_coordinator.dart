// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'session_starter_exit_coordinator.g.dart';

class SessionStarterExitCoordinator = _SessionStarterExitCoordinatorBase
    with _$SessionStarterExitCoordinator;

abstract class _SessionStarterExitCoordinatorBase
    with
        Store,
        EnRoute,
        EnRouteRouter,
        HomeScreenRouter,
        BaseCoordinator,
        Reactions {
  final SessionStarterExitWidgetsCoordinator widgets;
  @override
  final GetUserInfoStore getUserInfo;
  @override
  final CaptureScreen captureScreen;

  _SessionStarterExitCoordinatorBase({
    required this.widgets,
    required this.getUserInfo,
    required this.captureScreen,
  }) {
    initEnRouteActions();
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    initReactors();
    widgets.constructor();
    await getUserInfo(NoParams());
  }

  initReactors() {
    disposers.add(widgets.beachWavesMovieStatusReactor(onAnimationComplete));
  }

  deconstructor() {
    dispose();
  }
}

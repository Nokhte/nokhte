// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'session_starter_exit_coordinator.g.dart';

class SessionStarterExitCoordinator = _SessionStarterExitCoordinatorBase
    with _$SessionStarterExitCoordinator;

abstract class _SessionStarterExitCoordinatorBase
    with Store, HomeRouter, BaseCoordinator, Disposer {
  final SessionStarterExitWidgetsCoordinator widgets;
  final GetUserInfoStore getUserInfo;
  final CaptureScreen captureScreen;

  _SessionStarterExitCoordinatorBase({
    required this.widgets,
    required this.getUserInfo,
    required this.captureScreen,
  });

  @action
  constructor() async {
    initReactors();
    widgets.constructor();
    await getUserInfo(NoParams());
  }

  initReactors() {
    disposers.add(widgets.beachWavesMovieStatusReactor(onAnimationComplete));
  }
}

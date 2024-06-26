// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_starter_entry_coordinator.g.dart';

class SessionStarterEntryCoordinator = _SessionStarterEntryCoordinatorBase
    with _$SessionStarterEntryCoordinator;

abstract class _SessionStarterEntryCoordinatorBase with Store {
  final SessionStarterEntryWidgetsCoordinator widgets;
  final GetUserInfoStore getUserInfo;
  final BaseCoordinator base;

  _SessionStarterEntryCoordinatorBase({
    required this.widgets,
    required this.getUserInfo,
    required CaptureScreen captureScreen,
  }) : base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await getUserInfo(NoParams());
  }

  initReactors() {
    base.disposers.add(widgets.beachWavesMovieStatusReactor(
        onFinished: () => Modular.to.navigate(route)));
  }

  @computed
  String get route => getUserInfo.hasAccessedQrCode
      ? SessionStarterConstants.sessionStarter
      : SessionStarterConstants.sessionStarterInstructions;

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }
}

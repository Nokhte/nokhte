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

abstract class _SessionStarterEntryCoordinatorBase
    with Store, BaseCoordinator {
  final SessionStarterEntryWidgetsCoordinator widgets;
  final GetUserInfoStore getUserInfo;
  @override
  final CaptureScreen captureScreen;

  _SessionStarterEntryCoordinatorBase({
    required this.widgets,
    required this.getUserInfo,
    required this.captureScreen,
  }) {
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await getUserInfo(NoParams());
  }

  initReactors() {
    disposers.add(widgets.beachWavesMovieStatusReactor(
        onFinished: () => Modular.to.navigate(route)));
  }

  @computed
  String get route => getUserInfo.hasAccessedQrCode
      ? SessionStarterConstants.sessionStarter
      : SessionStarterConstants.sessionStarterInstructions;

  deconstructor() {
    dispose();
    widgets.base.deconstructor();
  }
}

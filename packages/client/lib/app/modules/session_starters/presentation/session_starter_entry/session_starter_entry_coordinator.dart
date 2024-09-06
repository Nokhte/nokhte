// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_starter_entry_coordinator.g.dart';

class SessionStarterEntryCoordinator = _SessionStarterEntryCoordinatorBase
    with _$SessionStarterEntryCoordinator;

abstract class _SessionStarterEntryCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SessionStarterEntryWidgetsCoordinator widgets;
  @override
  final CaptureScreen captureScreen;

  _SessionStarterEntryCoordinatorBase({
    required this.widgets,
    required this.captureScreen,
  }) {
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
  }

  initReactors() {
    disposers.add(
      widgets.beachWavesMovieStatusReactor(
        onFinished: () => Modular.to.navigate(
          SessionStarterConstants.sessionStarter,
        ),
      ),
    );
  }

  deconstructor() {
    dispose();
  }
}

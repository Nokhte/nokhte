// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_speaking_root_router_coordinator.g.dart';

class SessionSpeakingRootRouterCoordinator = _SessionSpeakingRootRouterCoordinatorBase
    with _$SessionSpeakingRootRouterCoordinator;

abstract class _SessionSpeakingRootRouterCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionSpeakingRootRouterWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;

  _SessionSpeakingRootRouterCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.presence,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    widgets.beachWavesMovieStatusReactor(onComplete);
  }

  @action
  onComplete() => Modular.to.navigate(speakingPath);

  @computed
  String get speakingPath {
    if (sessionMetadata.everyoneShouldSkipInstructions) {
      return SessionConstants.speaking;
    } else {
      if (!sessionMetadata.neighborShouldSkipInstructions) {
        return SessionConstants.speakingFullInstructions;
      } else if (sessionMetadata.userShouldSkipInstructions &&
          sessionMetadata.neighborShouldSkipInstructions) {
        return SessionConstants.speakingWaiting;
      } else {
        return SessionConstants.speakingHalfInstructions;
      }
    }
  }
}

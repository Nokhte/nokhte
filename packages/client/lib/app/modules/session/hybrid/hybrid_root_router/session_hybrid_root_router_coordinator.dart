// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_hybrid_root_router_coordinator.g.dart';

class SessionHybridRootRouterCoordinator = _SessionHybridRootRouterCoordinatorBase
    with _$SessionHybridRootRouterCoordinator;

abstract class _SessionHybridRootRouterCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionHybridRootRouterWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  _SessionHybridRootRouterCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.presence,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() {
    widgets.constructor();
    widgets.beachWavesMovieStatusReactor(onComplete);
  }

  @action
  onComplete() => Modular.to.navigate(hybridPath);

  @computed
  String get hybridPath {
    if (sessionMetadata.everyoneShouldSkipInstructions) {
      return SessionConstants.hybrid;
    } else {
      if (!sessionMetadata.neighborShouldSkipInstructions) {
        return SessionConstants.hybridSpeakingInstructions;
      } else {
        return SessionConstants.hybridWaiting;
      }
    }
  }
}

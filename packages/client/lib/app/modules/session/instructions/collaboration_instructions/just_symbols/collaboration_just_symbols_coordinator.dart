// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'collaboration_just_symbols_coordinator.g.dart';

class CollaborationJustSymbolsCoordinator = _CollaborationJustSymbolsCoordinatorBase
    with _$CollaborationJustSymbolsCoordinator;

abstract class _CollaborationJustSymbolsCoordinatorBase with Store {
  final CollaborationJustSymbolsWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final TapDetector tap;

  final BaseCoordinator base;

  _CollaborationJustSymbolsCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.widgets,
    required this.presence,
    required this.tap,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() {
    widgets.constructor();
    initReactors();
  }

  @action
  initReactors() {
    base.disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        base.setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        base.setDisableAllTouchFeedback(true);
      },
    ));
    base.disposers.add(rippleCompletionStatusReactor());
    base.disposers.add(tapReactor());
  }

  rippleCompletionStatusReactor() =>
      reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && widgets.isAllowedToTap) {
          // Modular.to.navigate(SessionConstants.showGroupGeometry);
        }
      });

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        base.ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }
}

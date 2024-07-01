// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'consultation_just_symbols_coordinator.g.dart';

class ConsultationJustSymbolsCoordinator = _ConsultationJustSymbolsCoordinatorBase
    with _$ConsultationJustSymbolsCoordinator;

abstract class _ConsultationJustSymbolsCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final ConsultationJustSymbolsWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final TapDetector tap;
  @override
  final CaptureScreen captureScreen;

  _ConsultationJustSymbolsCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.presence,
    required this.tap,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
  }

  @action
  constructor() {
    widgets.constructor();
    initReactors();
  }

  @action
  initReactors() {
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    ));
    disposers.add(tapReactor());
  }

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });

  deconstructor() {
    dispose();
  }
}

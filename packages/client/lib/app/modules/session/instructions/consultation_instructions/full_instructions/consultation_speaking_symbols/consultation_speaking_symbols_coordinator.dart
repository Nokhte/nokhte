// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'consultation_speaking_symbols_coordinator.g.dart';

class ConsultationSpeakingSymbolsCoordinator = _ConsultationSpeakingSymbolsCoordinatorBase
    with _$ConsultationSpeakingSymbolsCoordinator;

abstract class _ConsultationSpeakingSymbolsCoordinatorBase
    with Store, BaseCoordinator, Disposer {
  final ConsultationSpeakingSymbolsWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final TapDetector tap;
  final CaptureScreen captureScreen;
  _ConsultationSpeakingSymbolsCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.presence,
    required this.tap,
  }) : sessionMetadata = presence.sessionMetadataStore;

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
}
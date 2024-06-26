// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';
part 'show_group_geometry_coordinator.g.dart';

class ShowGroupGeometryCoordinator = _ShowGroupGeometryCoordinatorBase
    with _$ShowGroupGeometryCoordinator;

abstract class _ShowGroupGeometryCoordinatorBase with Store {
  final ShowGroupGeometryWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final TapDetector tap;

  final BaseCoordinator base;

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }

  _ShowGroupGeometryCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.widgets,
    required this.presence,
    required this.tap,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() {
    widgets.constructor(
        isASocraticSession: sessionMetadata.presetType == PresetTypes.socratic);
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
  }
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'needs_update_coordinator.g.dart';

class NeedsUpdateCoordinator = _NeedsUpdateCoordinatorBase
    with _$NeedsUpdateCoordinator;

abstract class _NeedsUpdateCoordinatorBase with Store {
  final NeedsUpdateWidgetsCoordinator widgets;
  final BaseCoordinator base;

  _NeedsUpdateCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.widgets,
  }) : base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() {
    widgets.constructor();
  }

  @action
  deconstructor() {
    base.deconstructor();
    widgets.deconstructor();
  }
}

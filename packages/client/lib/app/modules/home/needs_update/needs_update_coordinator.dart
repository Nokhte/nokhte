// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'needs_update_coordinator.g.dart';

class NeedsUpdateCoordinator = _NeedsUpdateCoordinatorBase
    with _$NeedsUpdateCoordinator;

abstract class _NeedsUpdateCoordinatorBase extends BaseCoordinator with Store {
  final NeedsUpdateWidgetsCoordinator widgets;
  _NeedsUpdateCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
  });

  @action
  constructor() {
    widgets.constructor();
  }

  @override
  @action
  deconstructor() {
    widgets.deconstructor();
    super.deconstructor();
  }
}

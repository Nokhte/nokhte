// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_coordinator.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'phase2_home_screen_coordinator.g.dart';

class Phase2HomeScreenCoordinator = _Phase2HomeScreenCoordinatorBase
    with _$Phase2HomeScreenCoordinator;

abstract class _Phase2HomeScreenCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final Phase2HomeScreenWidgetsCoordinator widgets;
  _Phase2HomeScreenCoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required this.widgets,
    required super.deepLinks,
  }) : super(widgets: widgets);

  @action
  constructor() {
    widgets.constructor();
    initReactors();
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(widgets.onSwipeUp);
  }
}

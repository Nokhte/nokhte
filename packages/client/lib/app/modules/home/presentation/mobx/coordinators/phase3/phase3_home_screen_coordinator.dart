// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_coordinator.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'phase3_home_screen_coordinator.g.dart';

class Phase3HomeScreenCoordinator = _Phase3HomeScreenCoordinatorBase
    with _$Phase3HomeScreenCoordinator;

abstract class _Phase3HomeScreenCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final Phase3HomeScreenWidgetsCoordinator widgets;

  _Phase3HomeScreenCoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required super.deepLinks,
    required this.widgets,
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

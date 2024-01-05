// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'collaboration_home_widgets_coordinator.dart';
part 'collaboration_home_coordinator.g.dart';

class CollaborationHomeCoordinator = _CollaborationHomeCoordinatorBase
    with _$CollaborationHomeCoordinator;

abstract class _CollaborationHomeCoordinatorBase extends BaseCoordinator
    with Store {
  final CollaborationHomeWidgetsCoordinator widgets;

  _CollaborationHomeCoordinatorBase({
    required this.widgets,
  });

  @action
  constructor() {
    widgets.constructor();
  }

  @override
  List<Object> get props => [];
}

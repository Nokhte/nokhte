// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'collaboration_home_widgets_coordinator.dart';
part 'collaboration_home_coordinator.g.dart';

class CollaborationHomeCoordinator = _CollaborationHomeCoordinatorBase
    with _$CollaborationHomeCoordinator;

abstract class _CollaborationHomeCoordinatorBase extends Equatable with Store {
  final CollaborationHomeWidgetsCoordinator widgets;

  _CollaborationHomeCoordinatorBase({
    required this.widgets,
  });
  @override
  List<Object> get props => [];
}

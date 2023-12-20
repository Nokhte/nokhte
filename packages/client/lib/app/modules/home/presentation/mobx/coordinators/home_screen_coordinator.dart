// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/main/main.dart';
import 'home_screen_widgets_coordinator.dart';

part 'home_screen_coordinator.g.dart';

class HomeScreenCoordinator = _HomeScreenCoordinatorBase
    with _$HomeScreenCoordinator;

abstract class _HomeScreenCoordinatorBase extends BaseCoordinator with Store {
  final HomeScreenWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final GetExistingCollaborationsInfoStore getExistingCollaborationInfo;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  _HomeScreenCoordinatorBase({
    required this.widgets,
    required this.getExistingCollaborationInfo,
    required this.swipe,
    required this.hold,
    required this.addNameToDatabaseStore,
    required this.getCollaboratorPhraseStore,
  });

  @action
  constructor() async {
    widgets.constructor();
    await getExistingCollaborationInfo(NoParams());
    await addNameToDatabaseStore(NoParams());
    await getCollaboratorPhraseStore(NoParams());
  }

  @override
  List<Object> get props => [];
}

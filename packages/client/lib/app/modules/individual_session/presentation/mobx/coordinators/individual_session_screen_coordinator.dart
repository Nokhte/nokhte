// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'individual_session_screen_coordinator.g.dart';

class IndividualSessionScreenCoordinatorStore = _IndividualSessionScreenCoordinatorStoreBase
    with _$IndividualSessionScreenCoordinatorStore;

abstract class _IndividualSessionScreenCoordinatorStoreBase
    extends BaseQuadrantAPIReceiver with Store {
  final GetCurrentPerspectivesStore getCurrentPerspectives;
  final IndividualSessionScreenWidgetsCoordinator widgets;

  _IndividualSessionScreenCoordinatorStoreBase({
    required super.quadrantAPI,
    required this.getCurrentPerspectives,
    required this.widgets,
  });

  @action
  screenConstructor() async {
    widgets.attuneTheWidgets(DateTime.now());
    await getCurrentPerspectives(NoParams());
    quadrantAPIListener();
  }

  quadrantAPIListener() => reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
        if (p0 >= 0) {
          valueTrackingSetup(p0);
          // print("quad api listener $localPerspectives");
          // perspectivesController();
        }
      });

  @action
  onSwipeUp() {
    //
  }

  @action
  onSwipeDown() {
    //
  }

  @override
  List<Object> get props => [];
}

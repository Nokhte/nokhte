// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_perspectives_widgets_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'perspectives_widgets_coordinator_store.g.dart';

class PerspectivesWidgetsCoordinatorStore = _PerspectivesWidgetsCoordinatorStoreBase
    with _$PerspectivesWidgetsCoordinatorStore;

abstract class _PerspectivesWidgetsCoordinatorStoreBase
    extends BasePerspectivesWidgetsStore with Store {
  _PerspectivesWidgetsCoordinatorStoreBase({
    required super.beachHorizonWater,
    required super.beachSky,
    required super.perspectivesMap,
    required super.collaborativeTextEditor,
    required super.beachWaves,
  });

  changeToInProgressColor(int chosenIndex) => perspectivesMap.setMovie(
        PerspectivesMapColorAndVertOffsetChange.getMovie(
          startingCircleColors:
              PerspectivesMapAnimationData.getWhiteArr(chosenIndex),
          endingCircleColors:
              PerspectivesMapAnimationData.getCommitInProgressArr(chosenIndex),
          startingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
          endingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
        ),
      );

  inProgressToDoneTransition(int chosenIndex) => perspectivesMap.setMovie(
        PerspectivesMapColorAndVertOffsetChange.getMovie(
          startingCircleColors:
              PerspectivesMapAnimationData.getCommitInProgressArr(chosenIndex),
          endingCircleColors:
              PerspectivesMapAnimationData.getCommittedArr(chosenIndex),
          startingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
          endingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
        ),
      );

  inProgressColorReversion(int chosenIndex) => perspectivesMap.setMovie(
        PerspectivesMapColorAndVertOffsetChange.getMovie(
          startingCircleColors:
              PerspectivesMapAnimationData.getCommitInProgressArr(chosenIndex),
          endingCircleColors:
              PerspectivesMapAnimationData.getWhiteArr(chosenIndex),
          startingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
          endingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
        ),
      );
}

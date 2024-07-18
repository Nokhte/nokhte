import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

mixin BaseExitWidgetsCoordinator {
  ExitStatusIndicatorStore get exitStatusIndicator;
  SmartTextStore get primarySmartText;
  SmartTextStore get secondarySmartText;

  initStartingMovie({
    required int totalNumberOfCollaborators,
    required int totalAffirmative,
  }) {
    exitStatusIndicator.initStartingMovie(
      numberOfAffirmative: totalAffirmative,
      total: totalNumberOfCollaborators,
    );
  }

  onNumOfAffirmativeChanged({
    required int totalNumberOfCollaborators,
    required int totalAffirmative,
  }) {
    setTotalNumberOfCollaborators(totalNumberOfCollaborators);
    Timer.periodic(Seconds.get(0, milli: 500), (timer) async {
      if (exitStatusIndicator.movieStatus != MovieStatus.inProgress) {
        if (totalAffirmative == totalNumberOfCollaborators) {
          exitStatusIndicator.initComplete();
          timer.cancel();
        } else {
          exitStatusIndicator.initAdjust(totalAffirmative);
          timer.cancel();
        }
      }
    });
  }

  onCollaboratorLeft() {
    exitStatusIndicator.setWidgetVisibility(false);
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
  }

  onCollaboratorJoined() {
    exitStatusIndicator.setWidgetVisibility(
      exitStatusIndicator.pastShowWidget,
    );
    primarySmartText.setWidgetVisibility(
      primarySmartText.pastShowWidget,
    );
    secondarySmartText.setWidgetVisibility(
      secondarySmartText.pastShowWidget,
    );
  }

  final _totalNumberOfCollaborators = Observable(0);
  int get totalNumberOfCollaborators => _totalNumberOfCollaborators.value;
  _setTotalNumberOfCollaborators(int value) =>
      _totalNumberOfCollaborators.value = value;
  Action actionSetTotalNumberOfCollaborators = Action(() {});

  setTotalNumberOfCollaborators(int value) {
    actionSetTotalNumberOfCollaborators([value]);
  }

  initBaseExitWidgetsCoordinatorActions() {
    actionSetTotalNumberOfCollaborators =
        Action(_setTotalNumberOfCollaborators);
  }
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'circle_explanation_model_coordinator.g.dart';

class CircleExplanationModelCoordinator = _CircleExplanationModelCoordinatorBase
    with _$CircleExplanationModelCoordinator;

abstract class _CircleExplanationModelCoordinatorBase extends Equatable
    with Store {
  final DumbGradientCircleStore userCircle;
  final DumbGradientCircleStore collaboratorCircle;
  final AccompanyingTextStore userAccompanyingText;
  final AccompanyingTextStore collaboratorAccompanyingText;

  _CircleExplanationModelCoordinatorBase({
    required this.collaboratorCircle,
    required this.collaboratorAccompanyingText,
    required this.userCircle,
    required this.userAccompanyingText,
  });

  @action
  toggleAllWidgetVisibilities() {
    collaboratorAccompanyingText.toggleWidgetVisibility();
    collaboratorCircle.toggleWidgetVisibility();
    userCircle.toggleWidgetVisibility();
    userAccompanyingText.toggleWidgetVisibility();
  }

  @action
  constructor() {
    toggleAllWidgetVisibilities();
    initReactors();
  }

  @observable
  bool hasCompletedExplanation = false;

  @action
  toggleHasCompletedExplanation() =>
      hasCompletedExplanation = !hasCompletedExplanation;

  @action
  initExplanation() => userAccompanyingText.toggleWidgetVisibility();

  @action
  showUserCircle() => userCircle.toggleWidgetVisibility();

  @action
  initReactors() {
    userAccompanyingTextReactor();
    userCircleReactor();
    collaboratorAccompanyingTextReactor();
    collaboratorCircleReactor();
  }

  userAccompanyingTextReactor() =>
      reaction((p0) => userAccompanyingText.hasFadedIn, (p0) {
        if (p0) {
          userCircle.toggleWidgetVisibility();
        }
      });

  userCircleReactor() => reaction((p0) => userCircle.hasFadedIn, (p0) {
        if (p0) {
          collaboratorAccompanyingText.toggleWidgetVisibility();
        }
      });
  collaboratorAccompanyingTextReactor() =>
      reaction((p0) => collaboratorAccompanyingText.hasFadedIn, (p0) {
        if (p0) {
          collaboratorCircle.toggleWidgetVisibility();
        }
      });

  collaboratorCircleReactor() =>
      reaction((p0) => collaboratorCircle.hasFadedIn, (p0) {
        if (p0) {
          Future.delayed(Seconds.get(2), () {
            toggleAllWidgetVisibilities();
            toggleHasCompletedExplanation();
          });
        }
      });

  @override
  List<Object> get props => [];
}

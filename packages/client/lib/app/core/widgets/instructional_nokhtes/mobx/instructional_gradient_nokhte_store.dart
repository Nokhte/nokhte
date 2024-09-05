// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/instructional_nokhtes/instructional_nokhtes.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'instructional_gradient_nokhte_store.g.dart';

class InstructionalGradientNokhteStore = _InstructionalGradientNokhteStoreBase
    with _$InstructionalGradientNokhteStore;

abstract class _InstructionalGradientNokhteStoreBase
    extends BaseWidgetStore<InstructionalGradientDirections> with Store {
  _InstructionalGradientNokhteStoreBase() {
    setWidgetVisibility(false);
    setMovie(
      InstructionalGradientNokhteMovie.getMovie(
        screenSize,
        position: position,
        colorway: colorway,
        direction: InstructionalGradientDirections.enlarge,
      ),
    );
  }

  @observable
  Size screenSize = Size.zero;

  @observable
  InstructionalNokhtePositions position = InstructionalNokhtePositions.bottom;
  @observable
  GradientNokhteColorways colorway = GradientNokhteColorways.beachWave;

  @action
  setScreenSize(Size value) => screenSize = value;

  setAndFadeIn(
    InstructionalNokhtePositions position,
    GradientNokhteColorways colorway,
  ) {
    this.position = position;
    this.colorway = colorway;
    setWidgetVisibility(false);
    setMovie(
      InstructionalGradientNokhteMovie.getMovie(
        screenSize,
        position: position,
        colorway: colorway,
        direction: InstructionalGradientDirections.enlarge,
      ),
    );
    Timer(Seconds.get(0, milli: 1), () {
      setWidgetVisibility(true);
    });
  }

  @override
  @action
  initMovie(params) {
    setMovie(
      InstructionalGradientNokhteMovie.getMovie(
        screenSize,
        position: position,
        colorway: colorway,
        direction: params,
      ),
    );
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  @computed
  bool get textShouldBeOnTop => position != InstructionalNokhtePositions.bottom;

  @computed
  String get text {
    switch (colorway) {
      case GradientNokhteColorways.beachWave:
        return "Home";
      case GradientNokhteColorways.invertedBeachWave:
        return "Start";
      case GradientNokhteColorways.vibrantBlue:
        return "Notes";
      case GradientNokhteColorways.deeperBlue:
        return "Presets";
      case GradientNokhteColorways.orangeSand:
        return "Join";
    }
  }
}

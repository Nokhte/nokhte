// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'instructional_gradient_nokhte_store.g.dart';

class InstructionalGradientNokhteStore = _InstructionalGradientNokhteStoreBase
    with _$InstructionalGradientNokhteStore;

abstract class _InstructionalGradientNokhteStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _InstructionalGradientNokhteStoreBase() {
    setWidgetVisibility(false);
    setMovie(
      VirginInstructionalToInvertedBeachWavesMovie.getMovie(Offset.zero),
    );
  }

  @observable
  Offset center = Offset.zero;

  @action
  setPosition(Offset position) {
    center = position;
    setMovie(
      VirginInstructionalToInvertedBeachWavesMovie.getMovie(position),
    );
  }

  @action
  initTransformation() {
    setControl(Control.playFromStart);
  }

  @action
  moveBack() {
    setMovie(MoveInvertedBeachWavesToCross.getMovie(center));
    setControl(Control.playFromStart);
  }
}

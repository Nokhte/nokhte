// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/instructional_nokhtes/instructional_nokhtes.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'instructional_gradient_nokhte_store.g.dart';

class InstructionalGradientNokhteStore = _InstructionalGradientNokhteStoreBase
    with _$InstructionalGradientNokhteStore;

abstract class _InstructionalGradientNokhteStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _InstructionalGradientNokhteStoreBase() {
    setWidgetVisibility(false);
    setMovie(
      YellowDiamondToInvertedBeachWavesMovie.getMovie(Offset.zero),
    );
  }

  @observable
  Offset center = Offset.zero;

  @action
  prepareYellowDiamond(Offset position) {
    setMovieStatus(MovieStatus.inProgress);
    center = position;
    setMovie(
      YellowDiamondToInvertedBeachWavesMovie.getMovie(position),
    );
  }

  @action
  prepareInvertedBeachWave(Offset position) {
    setMovieStatus(MovieStatus.inProgress);
    center = position;
    setMovie(InvertedBeachWavesToTopMovie.getMovie(position));
  }

  @override
  @action
  initMovie(params) {
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  @override
  @action
  reverseMovie(params) {
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playReverseFromEnd);
  }

  @action
  moveBack() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(MoveInvertedBeachWavesToCross.getMovie(center));
    setControl(Control.playFromStart);
  }
}

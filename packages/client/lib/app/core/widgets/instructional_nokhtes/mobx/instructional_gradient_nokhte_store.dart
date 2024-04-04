// ignore_for_file: must_be_immutable, library_private_types_in_public_api
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
    extends BaseCustomAnimatedWidgetStore<InstructionalGradientMovieParams>
    with Store {
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

  @override
  @action
  initMovie(params) {
    setMovie(
      InstructionalGradientNokhteMovie.getMovie(
        params.center,
        position: params.position,
        colorway: params.colorway,
        direction: params.direction,
      ),
    );
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'center_instructional_nokhte_store.g.dart';

class CenterInstructionalNokhteStore = _CenterInstructionalNokhteStoreBase
    with _$CenterInstructionalNokhteStore;

abstract class _CenterInstructionalNokhteStoreBase
    extends BaseWidgetStore<InstructionalNokhtePositions> with Store {
  _CenterInstructionalNokhteStoreBase() {
    setMovie(CenterInstructionalNokhteTransformationMovie.getMovie(screenSize));
  }

  @observable
  CenterInstructionalNokhteMovieModes movieMode =
      CenterInstructionalNokhteMovieModes.moveToCenter;

  @observable
  Size screenSize = Size.zero;

  @action
  setScreenSize(Size value) => screenSize = value;

  @action
  moveToCenter() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(CenterInstructionalNokhteTransformationMovie.getMovie(screenSize));
    setControl(Control.playFromStart);
    movieMode = CenterInstructionalNokhteMovieModes.moveToCenter;
  }

  @action
  moveBackToCross({
    required CenterNokhtePositions startingPosition,
  }) {
    setMovieStatus(MovieStatus.inProgress);
    movieMode = CenterInstructionalNokhteMovieModes.moveBack;
    setMovie(
      MoveCenterInstructionalNokhteBackToCrossMovie.getMovie(
        screenSize,
        startingPosition: startingPosition,
      ),
    );
    setControl(Control.playFromStart);
  }

  @action
  @override
  initMovie(param) {
    movieMode = CenterInstructionalNokhteMovieModes.moveAround;
    setMovie(
      MoveCenterInstructionalNokhte.getMovie(
        screenSize,
        position: param,
      ),
    );
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
    //
  }
}

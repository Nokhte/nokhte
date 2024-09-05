// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
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
    setMovie(CenterInstructionalNokhteMovies.scale(screenSize));
  }

  @observable
  CenterInstructionalNokhteMovieModes movieMode =
      CenterInstructionalNokhteMovieModes.moveToCenter;

  @observable
  InstructionalNokhtePositions position = InstructionalNokhtePositions.initial;

  @observable
  Size screenSize = Size.zero;

  @action
  setScreenSize(Size value) => screenSize = value;

  @action
  fadeIn() {
    setWidgetVisibility(false);
    Timer(Seconds.get(0, milli: 1), () {
      setWidgetVisibility(true);
    });
  }

  @action
  moveToCenter() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(CenterInstructionalNokhteMovies.scale(screenSize));
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
      CenterInstructionalNokhteMovies.moveBackToCross(
        screenSize,
        startingPosition: startingPosition,
      ),
    );
    setControl(Control.playFromStart);
  }

  @action
  @override
  initMovie(param) {
    position = param;
    movieMode = CenterInstructionalNokhteMovieModes.moveAround;
    setMovie(
      CenterInstructionalNokhteMovies.moveAround(
        screenSize,
        position: param,
      ),
    );
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
    //
  }
}

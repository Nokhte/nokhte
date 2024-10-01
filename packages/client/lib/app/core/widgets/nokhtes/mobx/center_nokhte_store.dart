// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'center_nokhte_store.g.dart';

class CenterNokhteStore = _CenterNokhteStoreBase with _$CenterNokhteStore;

abstract class _CenterNokhteStoreBase
    extends BaseWidgetStore<AuxiliaryNokhtePositions> with Store {
  _CenterNokhteStoreBase() {
    setMovie(CenterNokhteMovies.scale(screenSize));
  }

  @observable
  CenterNokhteMovieModes movieMode = CenterNokhteMovieModes.moveToCenter;

  @observable
  AuxiliaryNokhtePositions position = AuxiliaryNokhtePositions.initial;

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
    setMovie(CenterNokhteMovies.scale(screenSize));
    setControl(Control.playFromStart);
    movieMode = CenterNokhteMovieModes.moveToCenter;
  }

  @action
  moveBackToCross({
    required CenterNokhtePositions startingPosition,
  }) {
    setMovieStatus(MovieStatus.inProgress);
    movieMode = CenterNokhteMovieModes.moveBack;
    setMovie(
      CenterNokhteMovies.moveBackToCross(
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
    movieMode = CenterNokhteMovieModes.moveAround;
    setMovie(
      CenterNokhteMovies.moveAround(
        screenSize,
        position: param,
      ),
    );
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
    //
  }
}

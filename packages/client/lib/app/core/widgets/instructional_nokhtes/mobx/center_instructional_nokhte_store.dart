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
    extends BaseCustomAnimatedWidgetStore with Store {
  _CenterInstructionalNokhteStoreBase() {
    setMovie(
        CenterInstructionalNokhteTransformationMovie.getMovie(Offset.zero));
  }

  @observable
  CenterInstructionalNokhteMovieModes movieMode =
      CenterInstructionalNokhteMovieModes.moveToCenter;

  @observable
  Offset center = Offset.zero;

  @action
  moveToCenter(Offset centerParam) {
    center = centerParam;
    setMovieStatus(MovieStatus.inProgress);
    setMovie(
        CenterInstructionalNokhteTransformationMovie.getMovie(centerParam));
    setControl(Control.playFromStart);
  }

  @action
  moveUp() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(MoveCenterInstructionalNokhteUpMovie.getMovie(center));
    setControl(Control.playFromStart);
    movieMode = CenterInstructionalNokhteMovieModes.moveUp;
  }

  @action
  moveBackFromTop() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(MoveCenterInstructionalNokhteBackToCrossMovie.getMovie(center));
    setControl(Control.playFromStart);
    movieMode = CenterInstructionalNokhteMovieModes.moveBack;
  }

  @action
  moveBackFromCenter() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(CenterInstructionalNokhteTransformationMovie.getMovie(
      center,
      reverse: true,
    ));
    setControl(Control.playFromStart);
  }

  @override
  @action
  reverseMovie(params) {
    setControl(Control.playReverseFromEnd);
  }
}

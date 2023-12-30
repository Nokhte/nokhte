// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'clock_face_store.g.dart';

class ClockFaceStore = _ClockFaceStoreBase with _$ClockFaceStore;

abstract class _ClockFaceStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _ClockFaceStoreBase() {
    setMovie(SetUpTheClockfaceMovie.movie);
  }

  @override
  initMovie(param) {
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  reverse() {
    setControl(Control.playReverseFromEnd);
    setMovieStatus(MovieStatus.inProgress);
  }
}

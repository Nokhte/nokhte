// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/nokhte_blur/stack/stack.dart';
import 'package:simple_animations/simple_animations.dart';
part 'nokhte_blur_store.g.dart';

class NokhteBlurStore = _NokhteBlurStoreBase with _$NokhteBlurStore;

abstract class _NokhteBlurStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _NokhteBlurStoreBase() {
    setMovie(BlurMovie.movie);
  }

  @observable
  bool hasBlurredIn = false;

  @action
  init() {
    hasBlurredIn = true;
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  @action
  reverse() {
    hasBlurredIn = false;
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playReverseFromEnd);
  }
}

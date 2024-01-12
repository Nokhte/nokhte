// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/waiting_text/stack/constants/movies/movies.dart';
import 'package:simple_animations/simple_animations.dart';
part 'waiting_text_store.g.dart';

class WaitingTextStore = _WaitingTextStoreBase with _$WaitingTextStore;

abstract class _WaitingTextStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _WaitingTextStoreBase() {
    setMovie(WaitingTextStoneSkipMovie.movie);
    setControl(Control.loop);
  }
}

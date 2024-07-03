// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'tint_store.g.dart';

class TintStore = _TintStoreBase with _$TintStore;

abstract class _TintStoreBase extends BaseWidgetStore<NoParams> with Store {
  _TintStoreBase() {
    setMovie(TintMovie.movie);
  }

  @override
  @action
  initMovie(params) {
    setControl(Control.play);
  }

  @override
  @action
  reverseMovie(params) {
    setControl(Control.playReverse);
  }
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/swipe_guide/swipe_guide.dart';
import 'package:simple_animations/simple_animations.dart';
part 'swipe_guide_store.g.dart';

class SwipeGuideStore = _SwipeGuideStoreBase with _$SwipeGuideStore;

abstract class _SwipeGuideStoreBase extends BaseWidgetStore with Store {
  _SwipeGuideStoreBase() {
    setWidgetVisibility(false);
    setMovie(SwipeGuideMovies.wave);
    setControl(Control.loop);
  }
  @action
  fadeIn() {
    Timer(Seconds.get(1), () {
      setWidgetVisibility(true);
    });
  }

  //
}

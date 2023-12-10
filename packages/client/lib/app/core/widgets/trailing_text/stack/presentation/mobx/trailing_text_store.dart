// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/trailing_text/stack/movies/reveal_text_movie.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'trailing_text_store.g.dart';

class TrailingTextStore = _TrailingTextStoreBase with _$TrailingTextStore;

abstract class _TrailingTextStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  @observable
  Size textSize = Size.zero;

  @action
  setTextSizeAndMovie({
    required Size newTextSize,
    required TextRevealDirection newTextRevealDirection,
  }) {
    textSize = newTextSize;
    setMovie(RevealTextMovie.getMovie(newTextRevealDirection, textSize.width));
  }

  @override
  initMovie(NoParams params) {
    setControl(Control.playFromStart);
  }
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_widget_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'cross_store.g.dart';

class CrossStore = _CrossStoreBase with _$CrossStore;

abstract class _CrossStoreBase extends BaseWidgetStore with Store {
  _CrossStoreBase() {
    setMovie(CrossExpansionAndContractionMovie.movie);
    setWidgetVisibility(false);
  }

  @observable
  ObservableList<CircleInformation> circleInformation =
      ObservableList.of(StartingCirclePresets.homeScreen);

  @action
  initOutlineFadeOut() {
    setMovie(FadeOutCrossOutlineMovie.movie);
    setControl(Control.playFromStart);
  }

  @action
  initOutlineFadeIn() {
    setMovie(FadeOutCrossOutlineMovie.movie);
    setControl(Control.playReverseFromEnd);
  }

  @action
  initStaticGlow({
    Color glowColor = const Color(0xFFFFFFFF),
  }) {
    this.glowColor = glowColor;
    setMovie(StaticGlowOutlineMovie.movie);
  }

  @observable
  Color glowColor = Color(0xFFFFFFFF);
}

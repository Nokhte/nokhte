// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'fade_in_and_change_color_text_store.g.dart';

class FadeInAndChangeColorTextStore = _FadeInAndChangeColorTextStoreBase
    with _$FadeInAndChangeColorTextStore;

abstract class _FadeInAndChangeColorTextStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  final FadeInMessageData messageData;
  _FadeInAndChangeColorTextStoreBase({
    required this.messageData,
    required MovieTween chosenMovie,
  }) {
    movie = chosenMovie;
    currentMessage = messageData.message;
    control = Control.playFromStart;
  }

  @observable
  String currentMessage = "";

  @action
  setCurrentMessage(String newMessage) {
    currentMessage = newMessage;
  }

  @observable
  FadeInTextMovieModes movieMode = FadeInTextMovieModes.timesUp;

  @observable
  Color currentColor = Colors.white;

  @action
  initiateFadeOut() {
    movie = FadeOutText.getMovie(currentTextColor: currentColor);
    control = Control.playFromStart;
    movieMode = FadeInTextMovieModes.fadeOut;
  }

  @action
  teeUpFadeOut() {
    movieMode = FadeInTextMovieModes.fadeOutSetup;
    initiateFadeOut();
  }

  @override
  List<Object> get props => [];
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/fade_in_and_change_color_text/stack/constants/movies/movies.dart';
import 'package:primala/app/core/widgets/fade_in_and_change_color_text/stack/constants/types/movie_modes.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'fade_in_and_change_color_text_store.g.dart';

class FadeInAndChangeColorTextStore = _FadeInAndChangeColorTextStoreBase
    with _$FadeInAndChangeColorTextStore;

abstract class _FadeInAndChangeColorTextStoreBase extends Equatable with Store {
  ///
  @observable
  MovieTween movie = TimesUpText.movie;

  @observable
  MovieModes movieMode = MovieModes.timesUp;

  @observable
  Control control = Control.playFromStart;

  @observable
  Color currentColor = Colors.white;

  @action
  initiateFadeOut() {
    movie = FadeOutText.getMovie(currentTextColor: currentColor);
    control = Control.playFromStart;
    movieMode = MovieModes.fadeOut;
  }

  @action
  teeUpFadeOut() {
    movieMode = MovieModes.fadeOutSetup;
    initiateFadeOut();
  }

  @override
  List<Object> get props => [
// some items
      ];
}

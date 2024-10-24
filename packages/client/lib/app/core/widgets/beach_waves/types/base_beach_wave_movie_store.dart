// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
part 'base_beach_wave_movie_store.g.dart';

class BaseBeachWaveMovieStore<T> = _BaseBeachWaveMovieStore<T>
    with _$BaseBeachWaveMovieStore<T>;

abstract class _BaseBeachWaveMovieStore<T> extends BaseWidgetStore<T>
    with Store {
  final bool shouldPaintSand;
  _BaseBeachWaveMovieStore({
    this.shouldPaintSand = true,
    super.callsOnCompleteTwice = false,
  });

  @action
  initStaticEnd() {
    setControl(Control.playReverseFromEnd);
    Timer(Duration.zero, () {
      setControl(Control.stop);
    });
  }
}

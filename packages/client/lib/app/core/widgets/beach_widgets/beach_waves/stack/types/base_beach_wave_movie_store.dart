// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'base_beach_wave_movie_store.g.dart';

class BaseBeachWaveMovieStore<T> = _BaseBeachWaveMovieStore<T>
    with _$BaseBeachWaveMovieStore<T>;

abstract class _BaseBeachWaveMovieStore<T>
    extends BaseCustomAnimatedWidgetStore<T> with Store {
  final bool shouldPaintSand;
  _BaseBeachWaveMovieStore({
    required this.shouldPaintSand,
  });
}

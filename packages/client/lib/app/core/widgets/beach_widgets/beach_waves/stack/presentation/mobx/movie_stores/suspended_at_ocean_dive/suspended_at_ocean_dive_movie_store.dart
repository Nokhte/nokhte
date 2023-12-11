// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'suspended_at_ocean_dive_movie_store.g.dart';

class SuspendedAtOceanDiveStore = _SuspendedAtOceanDiveStoreBase
    with _$SuspendedAtOceanDiveStore;

abstract class _SuspendedAtOceanDiveStoreBase extends BaseBeachWaveMovieStore
    with Store {
  _SuspendedAtOceanDiveStoreBase()
      : super(
          shouldPaintSand: SuspendedAtOceanDiveMovie.shouldPaintSand,
        ) {
    movie = SuspendedAtOceanDiveMovie.movie;
  }
}

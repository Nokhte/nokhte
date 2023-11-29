// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/presentation/mobx/movie_stores/suspended_at_ocean_dive/suspended_at_ocean_dive_movie.dart';
// * Mobx Codegen Inclusion
part 'suspended_at_ocean_dive_movie_store.g.dart';

class SuspendedAtOceanDiveStore = _SuspendedAtOceanDiveStoreBase
    with _$SuspendedAtOceanDiveStore;

abstract class _SuspendedAtOceanDiveStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _SuspendedAtOceanDiveStoreBase() {
    movie = SuspendedAtOceanDiveMovie.movie;
  }
}

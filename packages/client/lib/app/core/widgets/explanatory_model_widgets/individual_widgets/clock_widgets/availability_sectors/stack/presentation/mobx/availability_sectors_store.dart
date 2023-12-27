// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'availability_sectors_store.g.dart';

class AvailabilitySectorsStore = _AvailabilitySectorsStoreBase
    with _$AvailabilitySectorsStore;

abstract class _AvailabilitySectorsStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _AvailabilitySectorsStoreBase() {
    setMovie(SetupAvailabilitySectorsMovies.movie);
  }
}

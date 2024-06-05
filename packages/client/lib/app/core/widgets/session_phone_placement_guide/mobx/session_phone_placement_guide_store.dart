// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/session_phone_placement_guide/movies/phone_placement_arrows_movie.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_phone_placement_guide_store.g.dart';

class SessionPhonePlacementGuideStore = _SessionPhonePlacementGuideStoreBase
    with _$SessionPhonePlacementGuideStore;

abstract class _SessionPhonePlacementGuideStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _SessionPhonePlacementGuideStoreBase() {
    setMovie(PhonePlacementArrowsMovie.movie);
    setControl(Control.loop);
  }
  @observable
  ObservableList<int> values = ObservableList.of([1, 2]);

  @action
  setValues(List<int> values) => this.values = ObservableList.of(values);
}

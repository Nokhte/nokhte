// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/gesture_cross/individual_widgets/individual_cross_nokhte/gradient_cross_nokhte/stack/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
part 'gradient_cross_nokhte_store.g.dart';

class GradientCrossNokhteStore = _GradientCrossNokhteStoreBase
    with _$GradientCrossNokhteStore;

abstract class _GradientCrossNokhteStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _GradientCrossNokhteStoreBase() {
    setMovie(WaterGradientNokhteMovie.movie);
    setControl(Control.mirror);
  }
}

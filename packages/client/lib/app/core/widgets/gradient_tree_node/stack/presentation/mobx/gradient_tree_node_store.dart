// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'gradient_tree_node_store.g.dart';

class GradientTreeNodeStore = _GradientTreeNodeStoreBase
    with _$GradientTreeNodeStore;

abstract class _GradientTreeNodeStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _GradientTreeNodeStoreBase() {
    setMovie(ChangeColorAndMoveUpMovies.movie);
  }

  @override
  initMovie(param) {
    setControl(Control.playFromStart);
  }
}

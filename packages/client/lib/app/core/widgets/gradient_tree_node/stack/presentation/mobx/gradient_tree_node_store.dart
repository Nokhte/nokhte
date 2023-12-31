// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'gradient_tree_node_store.g.dart';

class GradientTreeNodeStore = _GradientTreeNodeStoreBase
    with _$GradientTreeNodeStore;

abstract class _GradientTreeNodeStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @observable
  int tapCount = 0;

  @action
  incrementTapCount() => tapCount++;
}

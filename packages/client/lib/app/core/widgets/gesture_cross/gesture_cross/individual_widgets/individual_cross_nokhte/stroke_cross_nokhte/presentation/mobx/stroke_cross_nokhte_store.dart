// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
part 'stroke_cross_nokhte_store.g.dart';

class StrokeCrossNokhteStore = _StrokeCrossNokhteStoreBase
    with _$StrokeCrossNokhteStore;

abstract class _StrokeCrossNokhteStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _StrokeCrossNokhteStoreBase() {
    toggleWidgetVisibility();
  }
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'preset_icons_store.g.dart';

class PresetIconsStore = _PresetIconsStoreBase with _$PresetIconsStore;

abstract class _PresetIconsStoreBase extends BaseWidgetStore with Store {
  @observable
  ObservableList tags = ObservableList();

  @observable
  bool isHorizontal = false;

  @observable
  double containerSize = 0.0;

  @action
  setContainerSize(double val) => containerSize = val;

  @action
  setIsHorizontal(bool val) => isHorizontal = val;

  @action
  setTags({
    required List tags,
  }) {
    this.tags = ObservableList.of(tags);
  }
}

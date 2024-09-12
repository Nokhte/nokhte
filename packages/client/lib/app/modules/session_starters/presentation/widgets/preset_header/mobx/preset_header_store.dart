// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'preset_header_store.g.dart';

class PresetHeaderStore = _PresetHeaderStoreBase with _$PresetHeaderStore;

abstract class _PresetHeaderStoreBase extends BaseWidgetStore with Store {
  final PresetIconsStore presetIcons;
  _PresetHeaderStoreBase({
    required this.presetIcons,
  }) {
    presetIcons.setContainerSize(.18);
    presetIcons.setIsHorizontal(true);
    presetIcons.setWidgetVisibility(false);
  }

  @observable
  String presetName = '';

  @action
  setHeader(
    String presetName2,
    List tags,
  ) {
    this.presetName = presetName;
    presetIcons.setTags(tags);
    presetIcons.setWidgetVisibility(true);
  }
}

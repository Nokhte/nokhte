// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'presets_cards_store.g.dart';

class PresetsCardsStore = _PresetsCardsStoreBase with _$PresetsCardsStore;

abstract class _PresetsCardsStoreBase extends BaseWidgetStore with Store {
  _PresetsCardsStoreBase() {
    setWidgetVisibility(false);
  }
  @observable
  ObservableList unifiedUIDs = ObservableList();

  @observable
  ObservableList tags = ObservableList();

  @observable
  ObservableList names = ObservableList();

  @action
  setPresets({
    required ObservableList unifiedUIDs,
    required ObservableList tags,
    required ObservableList names,
  }) {
    this.unifiedUIDs = unifiedUIDs;
    this.tags = tags;
    this.names = names;
    setWidgetVisibility(true);
  }
}

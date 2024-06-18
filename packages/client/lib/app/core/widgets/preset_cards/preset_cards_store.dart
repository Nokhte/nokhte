// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'preset_cards_store.g.dart';

class PresetCardsStore = _PresetCardsStoreBase with _$PresetCardsStore;

abstract class _PresetCardsStoreBase extends BaseWidgetStore with Store {
  final CondensedPresetCardsStore condensed;
  final ExpandedPresetCardsStore expanded;

  _PresetCardsStoreBase({
    required this.condensed,
    required this.expanded,
  });

  @observable
  ObservableList unifiedUIDs = ObservableList();

  @observable
  ObservableList tags = ObservableList();

  @observable
  ObservableList names = ObservableList();

  @observable
  String preferredPresetUID = "";

  @observable
  ActivePresetType activePresetType = ActivePresetType.condensed;

  @action
  setPreferredPresetUID(String uid) => preferredPresetUID = uid;

  @action
  setPresets({
    required ObservableList unifiedUIDs,
    required ObservableList tags,
    required ObservableList names,
    bool isInstructions = true,
  }) {
    this.unifiedUIDs = unifiedUIDs;
    this.tags = tags;
    this.names = names;
  }

  @action
  showAllCondensedPresets({
    required bool showTags,
    int preferredIndex = -1,
  }) {
    if (!showTags) {
      condensed.setShowTags(false);
    }
    if (preferredIndex == -1) {
      condensed.fadeEverythingIn(tags.length);
      condensed.setWidgetVisibility(true);
    }
  }

  @action
  activateSelectedPreset() {
    if (preferredPresetUID.isNotEmpty) {
      condensed.enableAllTouchFeedback();
      condensed.setCurrentHeldIndex(preferredPresetIndex);
      selectPreset(preferredPresetIndex);
    }
  }

  @action
  onChosenNameChanged() {
    if (activePresetType == ActivePresetType.condensed) {
      activePresetType = ActivePresetType.expanded;
      condensed.setWidgetVisibility(false);
      expanded.setWidgetVisibility(true);
    }
  }

  @action
  selectPreset(int index) {
    if (activePresetType == ActivePresetType.condensed) {
      condensed.initSelectionInProgress(index);
    }
  }

  @action
  dismissExpandedPresetCard({
    int resetIndex = -1,
  }) {
    if (activePresetType == ActivePresetType.expanded) {
      activePresetType = ActivePresetType.condensed;
      expanded.setWidgetVisibility(false);
      condensed.setWidgetVisibility(true);
      if (resetIndex != -1) {
        condensed.showOnly(0);
      }
    }
  }

  @computed
  String get currentExpandedPresetCardName => condensed.currentTappedIndex == -1
      ? ''
      : names[condensed.currentTappedIndex];

  @computed
  List get currentExpandedPresetTags => condensed.currentTappedIndex == -1
      ? []
      : tags[condensed.currentTappedIndex];

  @computed
  String get currentlySelectedSessionUID => condensed.currentHeldIndex == -1
      ? ''
      : unifiedUIDs[condensed.currentHeldIndex];

  @computed
  int get preferredPresetIndex =>
      unifiedUIDs.isEmpty || preferredPresetUID.isEmpty
          ? -1
          : unifiedUIDs.indexOf(preferredPresetUID);
}

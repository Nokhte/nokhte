// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'condensed_presets_cards_store.g.dart';

class CondensedPresetsCardsStore = _CondensedPresetsCardsStoreBase
    with _$CondensedPresetsCardsStore;

abstract class _CondensedPresetsCardsStoreBase extends BaseWidgetStore
    with Store {
  _CondensedPresetsCardsStoreBase() {
    setWidgetVisibility(false);
  }

  @observable
  ObservableList unifiedUIDs = ObservableList();

  @observable
  ObservableList tags = ObservableList();

  @observable
  ObservableList names = ObservableList();

  @observable
  ObservableList<Control> controls = ObservableList();

  @observable
  ObservableList<MovieTween> movies = ObservableList();

  @observable
  bool showTags = true;

  @action
  fadeEverythingExcept(int indexParam) {
    controls = ObservableList.of(
      List.generate(
        unifiedUIDs.length,
        (index) {
          if (index == indexParam) {
            return Control.stop;
          } else {
            return Control.play;
          }
        },
      ),
    );
    movies = ObservableList.of(
      List.filled(unifiedUIDs.length, FadeOutPresetCardMovie.movie),
    );
  }

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
    if (isInstructions) {
      showTags = false;
      fadeEverythingExcept(0);
    }
    setWidgetVisibility(true);
  }
}

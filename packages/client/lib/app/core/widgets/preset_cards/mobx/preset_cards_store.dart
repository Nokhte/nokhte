// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'preset_cards_store.g.dart';

class PresetCardsStore = _PresetCardsStoreBase with _$PresetCardsStore;

abstract class _PresetCardsStoreBase extends BaseWidgetStore with Store {
  @observable
  ObservableList<Control> controls = ObservableList();

  @observable
  ObservableList<MovieTween> movies = ObservableList();

  @observable
  ObservableList<bool> isEnabled = ObservableList();

  @observable
  ObservableList<MovieStatus> movieStatuses = ObservableList();

  @observable
  ObservableList<Color> selectedPresetColors = ObservableList.of([]);

  @observable
  ObservableList uids = ObservableList();

  @observable
  ObservableList tags = ObservableList();

  @observable
  ObservableList names = ObservableList();

  @observable
  String preferredPresetUID = "";

  List<String> taglines = [
    ArticleBodyInfo(presetType: PresetTypes.consultative).tagline,
    ArticleBodyInfo(presetType: PresetTypes.collaborative).tagline,
  ];

  @action
  setPreferredPresetUID(String uid) => preferredPresetUID = uid;

  @action
  setPresets({
    required ObservableList uids,
    required ObservableList tags,
    required ObservableList names,
    bool isInstructions = true,
  }) {
    this.uids = uids;
    this.tags = tags;
    this.names = names;
  }

  @action
  showAllCondensedPresets({
    required bool showTags,
    int preferredIndex = -1,
  }) {
    if (!showTags) {
      setShowTags(false);
    }
    if (preferredIndex == -1) {
      fadeEverythingIn(tags.length);
      setWidgetVisibility(true);
    }
  }

  @action
  activateSelectedPreset() {
    if (preferredPresetUID.isNotEmpty) {
      enableAllTouchFeedback();
      setCurrentHeldIndex(preferredPresetIndex);
      selectPreset(preferredPresetIndex);
    }
  }

  @action
  selectPreset(int index) {
    initSelectionInProgress(index);
  }

  @computed
  PresetTypes get currentExpandedPresetType {
    if (currentExpandedPresetCardName.contains('onsultat')) {
      return PresetTypes.consultative;
    } else {
      return PresetTypes.collaborative;
    }
  }

  @action
  setSelectedPresetColors(List<Color> colors) =>
      selectedPresetColors = ObservableList.of(colors);

  @observable
  ObservableList<CondensedPresetCardMovieModes> movieModes = ObservableList();

  @observable
  int length = -1;

  @observable
  bool showTags = true;
  @action
  setShowTags(bool val) => showTags = val;

  @observable
  int currentTappedIndex = -1;

  @action
  onTap(int i) {
    tapCount++;
    if (isEnabled[i]) {
      currentTappedIndex = i;
    }
  }

  @action
  initWindDown(int i) {
    movies[i] = PresetCardSelectionMovies.getWindDown(selectedPresetColors);
    controls[i] = Control.play;
    movieStatuses[i] = MovieStatus.idle;
    movieModes[i] = CondensedPresetCardMovieModes.selectionWindDown;
  }

  @observable
  int currentHeldIndex = -1;

  @observable
  int pastHeldIndex = -1;

  @action
  setCurrentHeldIndex(int i, {bool override = false}) {
    if (isEnabled[i] || override) {
      pastHeldIndex = currentHeldIndex;
      currentHeldIndex = i;
    }
  }

  @action
  initSelectionInProgress(int index) {
    Control pastHeldIndexControl = Control.stop;
    if (pastHeldIndex != -1) {
      pastHeldIndexControl = controls[pastHeldIndex];
    }
    controls = ObservableList.of(List.generate(length, (i) {
      if (i == index) {
        return Control.playFromStart;
      } else if (i == pastHeldIndex && pastHeldIndex != -1) {
        return pastHeldIndexControl;
      } else {
        return Control.stop;
      }
    }));
    movieModes[index] = CondensedPresetCardMovieModes.selectionInProgress;
    movies[index] = PresetCardSelectionMovies.inProgress;
    // resetMovieStatuses();
    movieStatuses[index] = MovieStatus.idle;
  }

  @action
  showEverythingExcept(int index) {
    for (int i = 0; i < length; i++) {
      if (i != index) {
        controls[i] = Control.playFromStart;
        movies[i] = FadePresetCardMovies.fadeIn;
      }
    }
  }

  @action
  showOnly(int index) {
    movieModes[index] = CondensedPresetCardMovieModes.fadeOut;
    movieStatuses[index] = MovieStatus.idle;
    controls[index] = Control.playReverse;
    // movies[index] = FadeOutPresetCardMovie.movie;
    movies[index] = FadePresetCardMovies.fadeOut;
  }

  @action
  initSelectionMovie(int index) {
    resetMovieStatuses();
    movieModes[index] = CondensedPresetCardMovieModes.activeSelection;
    movieStatuses[index] = MovieStatus.idle;
    controls = ObservableList.of(List.generate(length, (i) {
      if (i == index) {
        return Control.loop;
      } else {
        return Control.stop;
      }
    }));
    movies[index] = PresetCardSelectionMovies.active;
  }

  @action
  initHighlightMovie(int index) {
    movieModes[index] = CondensedPresetCardMovieModes.instructionHighlight;
    movieStatuses[index] = MovieStatus.inProgress;

    controls = ObservableList.of(List.generate(length, (i) {
      if (i == index) {
        return Control.loop;
      } else {
        return Control.stop;
      }
    }));
    isEnabled[index] = true;
    movies[index] = InstructionHighlightPresetCardMovie.movie;
    movieModes[index] = CondensedPresetCardMovieModes.instructionHighlight;
  }

  @action
  teeUpInstructions(int index) {
    resetMovieStatuses();
    movies = ObservableList.of(
      List.generate(
        length,
        (i) {
          if (i == index) {
            return InstructionHighlightPresetCardMovie.transition;
          } else {
            // return FadeOutPresetCardMovie.movie;
            return FadePresetCardMovies.fadeOut;
          }
        },
      ),
    );

    controls = ObservableList.of(List.filled(length, Control.playFromStart));

    movieModes = ObservableList.of(
      List.generate(
        length,
        (i) {
          if (i == index) {
            return CondensedPresetCardMovieModes.instructionHighlightTransition;
          } else {
            return CondensedPresetCardMovieModes.fadeOut;
          }
        },
      ),
    );
  }

  @action
  fadeEverythingIn(int length) {
    this.length = length;
    resetMovieStatuses();
    controls = ObservableList.of(List.filled(length, Control.playFromStart));
    movieModes = ObservableList.of(
        List.filled(length, CondensedPresetCardMovieModes.fadeIn));
    movies =
        ObservableList.of(List.filled(length, FadePresetCardMovies.fadeIn));
    isEnabled = ObservableList.of(List.filled(length, false));
  }

  @action
  disableAllTouchFeedback() =>
      isEnabled = ObservableList.of(List.filled(length, false));

  @action
  disableAllTouchFeedbackExcept(int index) =>
      isEnabled = ObservableList.of(List.generate(length, (i) {
        if (i == index) {
          return true;
        } else {
          return false;
        }
      }));

  @action
  enableAllTouchFeedback() =>
      isEnabled = ObservableList.of(List.filled(length, true));

  @action
  onAnimationCompleted(int i) => movieStatuses[i] = MovieStatus.finished;

  @action
  resetMovieStatuses() => movieStatuses =
      ObservableList.of(List.filled(length, MovieStatus.inProgress));

  @computed
  int get condensedTapCount => tapCount;

  @computed
  String get currentExpandedPresetCardName =>
      currentTappedIndex == -1 ? '' : names[currentTappedIndex];

  @computed
  List get currentExpandedPresetTags =>
      currentTappedIndex == -1 ? [] : tags[currentTappedIndex];

  @computed
  String get currentlySelectedSessionUID =>
      currentHeldIndex == -1 ? '' : uids[currentHeldIndex];

  @computed
  int get preferredPresetIndex => uids.isEmpty || preferredPresetUID.isEmpty
      ? -1
      : uids.indexOf(preferredPresetUID);
}

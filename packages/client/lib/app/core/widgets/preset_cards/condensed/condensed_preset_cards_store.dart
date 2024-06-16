// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'condensed_preset_cards_store.g.dart';

class CondensedPresetCardsStore = _CondensedPresetCardsStoreBase
    with _$CondensedPresetCardsStore;

abstract class _CondensedPresetCardsStoreBase extends BaseWidgetStore
    with Store {
  @observable
  ObservableList<Control> controls = ObservableList();

  @observable
  ObservableList<MovieTween> movies = ObservableList();

  @observable
  ObservableList<bool> isEnabled = ObservableList();

  @observable
  ObservableList<MovieStatus> movieStatuses = ObservableList();

  @observable
  ObservableList<CondensedPresetCardMovieModes> movieModes = ObservableList();

  @observable
  int length = -1;

  @observable
  bool showTags = true;

  @action
  setShowTags(bool val) => showTags = val;

  @observable
  int lastTappedIndex = -1;

  @action
  setLastTappedIndex(int i) {
    if (isEnabled[i]) {
      lastTappedIndex = i;
    }
  }

  @observable
  int lastHeldIndex = -1;

  @action
  setLastHeldIndex(int i) {
    if (isEnabled[i]) {
      lastHeldIndex = i;
    }
  }

  @action
  initSelection(int index) {
    controls[index] = Control.play;
    movieStatuses[index] = MovieStatus.idle;
    movieModes[index] = CondensedPresetCardMovieModes.selectionInProgress;
    // movies[index] = PresetSelectionInProgressMovie.movie;
    movies[index] = PresetCardSelectionMovies.inProgress;
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
    controls[index] = Control.loop;
    // movies[index] = ActiveSelectedPresetCardMovie.movie;
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
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
// * Mobx Codegen Inclusion
part 'smart_fading_animated_text_tracker_store.g.dart';

class SmartFadingAnimatedTextTrackerStore = _SmartFadingAnimatedTextTrackerStoreBase
    with _$SmartFadingAnimatedTextTrackerStore;

abstract class _SmartFadingAnimatedTextTrackerStoreBase extends Equatable
    with Store {
  @observable
  bool showText = false;

  @observable
  bool isPaused = false;

  @observable
  bool hasJustBeenUnPaused = false;

  @observable
  bool inProgress = false;

  @observable
  FadingTextStatus status = FadingTextStatus.fadingOut;

  oneSecondDelay(Function body) async {
    await Future.delayed(const Duration(seconds: 1), () => body());
  }

  addADelay(Duration duration) async {
    await Future.delayed(duration);
  }

  fadeTheTextOut() {
    showText = false;
  }

  fadeTheTextIn() {
    showText = true;
  }

  decideToPauseOrFadeOut() async {
    if (shouldPauseHere) {
      togglePause(gestureType: Gestures.none);
      showText = true;
    } else {
      showText = false;
      await oneSecondDelay(() => moveToNextMessage());
    }
  }

  decideToSkipOrMoveToNextMessage() {
    if (hasJustBeenUnPaused) {
      hasJustBeenUnPaused = !hasJustBeenUnPaused;
      return;
    }
    if (shouldPauseHere) return;
    moveToNextMessage();
  }

  @action
  startRotatingText() async {
    while (!isPaused) {
      if (hasJustBeenUnPaused) {
        await oneSecondDelay(() => fadeTheTextOut());
        await oneSecondDelay(() => moveToNextMessage());
        hasJustBeenUnPaused = false;
      } else {
        await oneSecondDelay(() => fadeTheTextIn());
        await addADelay(currentExtraDelayTime);
        await oneSecondDelay(() => decideToPauseOrFadeOut());
      }
    }
  }

  @action
  togglePause({required Gestures gestureType}) {
    if (gestureType == currentUnlockGesture || gestureType == Gestures.none) {
      isPaused = !isPaused;
      if (isPaused == false) {
        hasJustBeenUnPaused = true;
        startRotatingText();
      }
      // print("paused $isPaused");
    }
  }

  @observable
  int currentIndex = 0;

  @action
  void moveToNextMessage() {
    // print("$currentIndex before");
    currentIndex = (currentIndex + 1) % MessagesData.list.length;
    // print("$currentIndex after");
  }

  @computed
  bool get shouldPauseHere => MessagesData.list[currentIndex]['pauseHere'];

  @computed
  Duration get currentExtraDelayTime =>
      MessagesData.list[currentIndex]["extraDelayTime"];

  @computed
  Gestures get currentUnlockGesture =>
      MessagesData.list[currentIndex]["unlockGesture"];

  @computed
  String get currentMainText => MessagesData.list[currentIndex]["mainMessage"];

  @computed
  String get currentSubText => MessagesData.list[currentIndex]["subMessage"];

  @override
  List<Object> get props => [
        currentIndex,
      ];
}

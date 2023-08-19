// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:clipboard/clipboard.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/types/rotating_text_data.dart';
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
  copyToClipboard() async {
    await FlutterClipboard.copy(messagesData[2].mainMessage);
    changeCurrrentSubMessage(message: "copied");
    // print("current sub text $currentSubText");
  }

  @action
  changeCurrrentSubMessage({required String message}) {
    // print(currentIndex);
    currentSubText = message;
    // print("DID IT CHANGE? ${currentSubText}");
  }

  @action
  resetPastSubMessage({required String message}) {}

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

  /// Ok so the text doesn't change but it does copy, figure this out when you
  /// get back and home screen will be done

  @action
  togglePause({required Gestures gestureType}) async {
    if (gestureType == currentUnlockGesture || gestureType == Gestures.none) {
      isPaused = !isPaused;
      if (isPaused == false) {
        hasJustBeenUnPaused = true;
        startRotatingText();
      }
      if (gestureType == Gestures.tap) {
        await copyToClipboard();
        changeCurrrentSubMessage(message: "\n copied");
      }
    }
  }

  @observable
  ObservableList<RotatingTextData> messagesData = ObservableList.of([
    RotatingTextData(
      mainMessage: "Schedule A Time With Your Collaborator",
      subMessage: "",
      pauseHere: false,
      unlockGesture: Gestures.none,
      extraDelayTime: const Duration(seconds: 2),
    ),
    RotatingTextData(
      mainMessage: "Double Tap",
      subMessage: "",
      pauseHere: true,
      unlockGesture: Gestures.doubleTap,
      extraDelayTime: const Duration(seconds: 0),
    ),
    RotatingTextData(
      mainMessage: "",
      subMessage: "\n tap to copy",
      pauseHere: true,
      unlockGesture: Gestures.tap,
      extraDelayTime: const Duration(seconds: 0),
    ),
    RotatingTextData(
      mainMessage: "Share Your Word With Your Collaborator",
      subMessage: "",
      pauseHere: false,
      unlockGesture: Gestures.none,
      extraDelayTime: const Duration(seconds: 1, milliseconds: 500),
    ),
    RotatingTextData(
      mainMessage: "Swipe Up When You Are Both Ready",
      subMessage: "",
      pauseHere: false,
      unlockGesture: Gestures.none,
      extraDelayTime: const Duration(seconds: 1),
    ),
  ]);

  @action
  setCollaboratorPhrase({required String thePhrase}) {
    messagesData[2].mainMessage = thePhrase;
  }

  @observable
  int currentIndex = 0;

  @action
  void moveToNextMessage() {
    // print("$currentIndex before");
    currentIndex = (currentIndex + 1) % messagesData.length;
    currentSubText = messagesData[currentIndex].subMessage;
  }

  @computed
  bool get shouldPauseHere => messagesData[currentIndex].pauseHere;

  @computed
  Duration get currentExtraDelayTime =>
      messagesData[currentIndex].extraDelayTime;

  @computed
  Gestures get currentUnlockGesture => messagesData[currentIndex].unlockGesture;

  @computed
  String get currentMainText => messagesData[currentIndex].mainMessage;

  @observable
  String currentSubText = "";

  @override
  List<Object> get props => [
        currentIndex,
        currentSubText,
      ];
}

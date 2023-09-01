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
  List<RotatingTextData> messagesData = [];

  _SmartFadingAnimatedTextTrackerStoreBase(
      {required this.messagesData, required this.isInfinite})
      : currentMainText = messagesData[0].mainMessage,
        currentSubText = messagesData[0].subMessage,
        firstTime = false;

  @observable
  bool firstTime = true;

  @observable
  bool isInfinite = false;

  @observable
  bool showText = false;

  @observable
  bool isPaused = false;

  @observable
  bool hasJustBeenUnPaused = false;

  @observable
  bool inProgress = false;

  @observable
  int currentIndex = 0;

  @observable
  String currentSubText = "";

  @observable
  String currentMainText = "";

  @observable
  FadingTextStatus status = FadingTextStatus.fadingOut;

  @action
  resetToDefault() async {
    currentMainText = messagesData[currentIndex].mainMessage;
    currentSubText = messagesData[currentIndex].subMessage;
    await oneSecondDelay(() => fadeTheTextIn());
    showText = true;
  }

  oneSecondDelay(Function body) async {
    await Future.delayed(const Duration(seconds: 1), () => body());
  }

  addADelay(Duration duration) async {
    await Future.delayed(duration);
  }

  @action
  fadeTheTextOut() {
    showText = false;
  }

  @action
  fadeTheTextIn() {
    showText = true;
  }

  decideToSkipOrMoveToNextMessage() {
    if (hasJustBeenUnPaused) {
      hasJustBeenUnPaused = !hasJustBeenUnPaused;
      return;
    }
    if (shouldPauseHere) return;
    moveToNextMessage();
  }

  addNewMessage({
    required String mainMessage,
    double mainMessageFontSize = 50.0,
    double subMessageFontSize = 25.0,
    String subMessage = "",
    bool pauseHere = true,
    Gestures unlockGesture = Gestures.none,
    Duration extraDelayTime = const Duration(seconds: 0),
  }) {
    messagesData.add(
      RotatingTextData(
        mainMessage: mainMessage,
        subMessage: subMessage,
        pauseHere: pauseHere,
        unlockGesture: unlockGesture,
        extraDelayTime: extraDelayTime,
        mainMessageFontSize: mainMessageFontSize,
        subMessageFontSize: subMessageFontSize,
      ),
    );
  }

  addNewMessageInSecondToLastIndex({
    required String mainMessage,
    required double mainMessageFontSize,
    required double subMessageFontSize,
    String subMessage = "",
    bool pauseHere = true,
    Gestures unlockGesture = Gestures.none,
    Duration extraDelayTime = const Duration(seconds: 0),
  }) {
    messagesData.insert(
      messagesData.length - 1,
      RotatingTextData(
        mainMessage: mainMessage,
        subMessage: subMessage,
        pauseHere: pauseHere,
        unlockGesture: unlockGesture,
        extraDelayTime: extraDelayTime,
        mainMessageFontSize: mainMessageFontSize,
        subMessageFontSize: subMessageFontSize,
      ),
    );
  }

  @action
  copyToClipboard() async {
    await FlutterClipboard.copy(messagesData[2].mainMessage);
    changeCurrrentSubMessage(message: "copied");
  }

  decideToPauseOrFadeOut() async {
    if (shouldPauseHere) {
      togglePause(gestureType: Gestures.none);
      showText = true;
    } else {
      showText = false;
      // if (currentIndex == messagesData.length - 1 && !isInfinite) return;
      await oneSecondDelay(() => moveToNextMessage());
    }
  }

  @action
  changeCurrrentSubMessage({required String message}) {
    currentSubText = message;
  }

  @action
  changeFutureSubMessage(
      {required int amountOfMessagesForward, required String message}) {
    messagesData[currentIndex + amountOfMessagesForward].subMessage = message;
  }

  @action
  changeFutureMainMessage(
      {required int amountOfMessagesForward, required String message}) {
    messagesData[currentIndex + amountOfMessagesForward].mainMessage = message;
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

  @action
  setMainMessage({required int index, required String thePhrase}) {
    messagesData[index].mainMessage = thePhrase;
  }

  @action
  void moveToNextMessage() {
    if (isInfinite) {
      currentIndex = (currentIndex + 1) % messagesData.length;
    } else if (currentIndex < messagesData.length - 1 && !isInfinite) {
      currentIndex = currentIndex + 1;
    }
    currentMainText = messagesData[currentIndex].mainMessage;
    currentSubText = messagesData[currentIndex].subMessage;
  }

  @computed
  bool get shouldPauseHere => messagesData[currentIndex].pauseHere;

  @computed
  double get currentMainMessageFont =>
      messagesData[currentIndex].mainMessageFontSize;

  @computed
  double get currentSubMessageFont =>
      messagesData[currentIndex].subMessageFontSize;

  @computed
  Duration get currentExtraDelayTime =>
      messagesData[currentIndex].extraDelayTime;

  @computed
  Gestures get currentUnlockGesture => messagesData[currentIndex].unlockGesture;

  @override
  List<Object> get props => [
        currentIndex,
        currentSubText,
      ];
}

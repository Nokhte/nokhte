// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:simple_animations/simple_animations.dart';
part 'smart_text_store.g.dart';

class SmartTextStore = _SmartTextStoreBase with _$SmartTextStore;

abstract class _SmartTextStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @observable
  ObservableList<RotatingTextData> messagesData = ObservableList.of([]);

  @observable
  int currentIndex = 0;

  @observable
  bool isPaused = false;

  @observable
  bool disablePausing = false;

  @action
  setDisablePausing(bool newDisablePausing) =>
      disablePausing = newDisablePausing;

  @action
  setCurrentIndex(newIndex) => currentIndex = newIndex;

  @action
  setMessagesData(List<RotatingTextData> newList) {
    currentIndex = 0;
    messagesData = ObservableList.of(newList);
  }

  @action
  reset() {
    currentIndex = 0;
    isPaused = false;
    setControl(Control.playFromStart);
    setControl(Control.stop);
  }

  @action
  startRotatingText({bool isResuming = false}) {
    Future.delayed(currentInitialFadeInDelay, () {
      if (isResuming) {
        setControl(Control.playReverse);
      } else {
        setControl(Control.play);
      }
    });
  }

  @action
  pause() {
    setControl(Control.stop);
  }

  @action
  resume() {
    startRotatingText(isResuming: true);
  }

  @action
  onOpacityTransitionComplete() {
    if (currentIndex < messagesData.length - 1) {
      if (control != Control.playReverse && !currentShouldPauseHere) {
        Future.delayed(currentOnScreenTime, () {
          if (disablePausing) {
            setControl(Control.playReverse);
          } else {
            if (!isPaused) {
              setControl(Control.playReverse);
            }
          }
        });
      } else if (control == Control.playReverse) {
        currentIndex++;
        Future.delayed(Seconds.get(0, milli: 100), () {
          if (disablePausing) {
            setControl(Control.playFromStart);
          } else {
            if (!isPaused) {
              setControl(Control.playFromStart);
            }
          }
        });
      }
    }
  }

  @computed
  String get currentSubText => messagesData[currentIndex].subMessage;

  @computed
  String get currentMainText => messagesData[currentIndex].mainMessage;

  @computed
  bool get currentShouldPauseHere => messagesData[currentIndex].pauseHere;

  @computed
  double get currentMainTextFontSize =>
      messagesData[currentIndex].mainMessageFontSize;

  @computed
  double get currentSubTextFontSize =>
      messagesData[currentIndex].subMessageFontSize;

  @computed
  Duration get currentInitialFadeInDelay =>
      messagesData[currentIndex].initialFadeInDelay;

  @computed
  Duration get currentOnScreenTime => messagesData[currentIndex].onScreenTime;

  @computed
  Gestures get currentUnlockGesture => messagesData[currentIndex].unlockGesture;
}

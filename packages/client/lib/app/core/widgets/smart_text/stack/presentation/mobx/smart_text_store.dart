// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
part 'smart_text_store.g.dart';

class SmartTextStore = _SmartTextStoreBase with _$SmartTextStore;

abstract class _SmartTextStoreBase extends Equatable with Store {
  @observable
  ObservableList<RotatingTextData> messagesData = ObservableList.of([]);

  @action
  setMessagesData(List<RotatingTextData> newList) {
    messagesData = ObservableList.of(newList);
  }

  @computed
  String get currentSubText => messagesData[currentIndex].mainMessage;

  @computed
  String get currentMainText => messagesData[currentIndex].subMessage;

  @computed
  bool get shouldPauseAtCurrent => messagesData[currentIndex].pauseHere;

  @observable
  int currentIndex = 0;

  @computed
  double get currentMainMessageFontSize =>
      messagesData[currentIndex].mainMessageFontSize;

  @computed
  double get currentSubMessageFontSize =>
      messagesData[currentIndex].subMessageFontSize;

  @computed
  Duration get currentInitialFadeInDelay =>
      messagesData[currentIndex].initialFadeInDelay;

  @computed
  Duration get currentOnScreenTime => messagesData[currentIndex].onScreenTime;

  @computed
  Gestures get currentUnlockGesture => messagesData[currentIndex].unlockGesture;

  @observable
  bool showWidget = false;

  @action
  toggleWidgetVisibility() => showWidget = !showWidget;

  @action
  startRotatingText() {
    Future.delayed(currentInitialFadeInDelay, () {
      toggleWidgetVisibility();
    });
  }

  @observable
  int opacityCounter = 0;

  @action
  onOpacityTransitionComplete(bool widgetIsVisible) {
    if (currentIndex < messagesData.length - 1) {
      if (widgetIsVisible && !shouldPauseAtCurrent) {
        Future.delayed(currentInitialFadeInDelay, () {
          toggleWidgetVisibility();
        });
      } else {
        if (opacityCounter == 0) {
          opacityCounter++;
        } else {
          Future.delayed(currentOnScreenTime, () {
            currentIndex++;
            toggleWidgetVisibility();
          });
        }
      }
    }
  }

  @override
  List<Object> get props => [];
}

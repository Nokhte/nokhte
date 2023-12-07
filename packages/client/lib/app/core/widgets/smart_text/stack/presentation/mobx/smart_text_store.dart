// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
part 'smart_text_store.g.dart';

class SmartTextStore = _SmartTextStoreBase with _$SmartTextStore;

abstract class _SmartTextStoreBase extends Equatable with Store {
  @observable
  ObservableList<RotatingTextData> messagesData = ObservableList.of([]);

  @observable
  bool showWidget = false;

  @observable
  int currentIndex = 0;

  @observable
  int opacityCounter = 0;

  @action
  setMessagesData(List<RotatingTextData> newList) {
    messagesData = ObservableList.of(newList);
  }

  @action
  toggleWidgetVisibility() => showWidget = !showWidget;

  @action
  startRotatingText() {
    Future.delayed(currentInitialFadeInDelay, () {
      toggleWidgetVisibility();
    });
  }

  @action
  onOpacityTransitionComplete() {
    if (currentIndex < messagesData.length - 1) {
      if (showWidget && !currentShouldPauseHere) {
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

  @override
  List<Object> get props => [];
}

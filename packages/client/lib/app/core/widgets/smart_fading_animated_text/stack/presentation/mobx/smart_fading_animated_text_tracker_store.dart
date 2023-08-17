// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
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

  @action
  startRotatingText(bool mounted) async {
    print("PAUSE STATUS $isPaused $mounted");
    while (!isPaused) {
      if (mounted) {
        await Future.delayed(const Duration(seconds: 1), () {
          moveToNextMessage();
        });
        await Future.delayed(const Duration(seconds: 1), () {
          showText = true;
        });
        await Future.delayed(const Duration(seconds: 1), () {
          showText = false;
        });
      }
    }
  }

  @action
  togglePause(bool mounted) {
    isPaused = !isPaused;
    if (isPaused == false) {
      startRotatingText(mounted);
    }
    print("PAUSE TOGGLED $isPaused");
  }

  final List<String> messagesList = [
    "Hi",
    "Hi There",
  ];
  @observable
  int currentIndex = 0;

  @action
  void moveToNextMessage() {
    currentIndex = (currentIndex + 1) % messagesList.length;
  }

  @computed
  String get currentText => messagesList[currentIndex];

  @override
  List<Object> get props => [
        currentIndex,
      ];
}

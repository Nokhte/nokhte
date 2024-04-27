// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/shared/constants/constants.dart';
part 'mirrored_text_store.g.dart';

class MirroredTextStore = _MirroredTextStoreBase with _$MirroredTextStore;

abstract class _MirroredTextStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  final SmartTextStore primaryRightSideUpText;
  final SmartTextStore secondaryRightSideUpText;
  final SmartTextStore primaryUpsideDownText;
  final SmartTextStore secondaryUpsideDownText;

  _MirroredTextStoreBase({
    required this.primaryRightSideUpText,
    required this.secondaryRightSideUpText,
    required this.primaryUpsideDownText,
    required this.secondaryUpsideDownText,
  });

  @action
  setMessagesData(
    MirroredTextContentOptions types, {
    bool shouldAdjustToFallbackExitProtocol = false,
  }) {
    switch (types) {
      case MirroredTextContentOptions.irlNokhteSessionSpeakingInstructions:
        prepForSplitScreen();
        setSecondaryMessagesData(SessionLists.speakingInstructionsSecondary);
        setPrimaryMessagesData(SessionLists.speakingInstructionsPrimary);
      case MirroredTextContentOptions.irlNokhteSessionSpeakingPhone:
        prepForSplitScreen();
        setPrimaryMessagesData(SharedLists.empty);
        setSecondaryMessagesData(SessionLists.speakingSecondary);
      case MirroredTextContentOptions.irlNokhteSessionNotesInstructions:
        primaryRightSideUpText.setMessagesData(
          SessionLists.getNotesInstructionsPrimary(
            MirroredTextOrientations.rightSideUp,
            shouldAdjustToFallbackExitProtocol:
                shouldAdjustToFallbackExitProtocol,
          ),
        );
        primaryUpsideDownText.setMessagesData(
          SessionLists.getNotesInstructionsPrimary(
            MirroredTextOrientations.upsideDown,
            shouldAdjustToFallbackExitProtocol:
                shouldAdjustToFallbackExitProtocol,
          ),
        );
        secondaryRightSideUpText.setMessagesData(
          SessionLists.getNotesInstructionsSecondary(
            MirroredTextOrientations.rightSideUp,
          ),
        );
        secondaryUpsideDownText.setMessagesData(
          SessionLists.getNotesInstructionsSecondary(
            MirroredTextOrientations.upsideDown,
          ),
        );
      case MirroredTextContentOptions.speakLessWriteMore:
        primaryRightSideUpText
            .setMessagesData(SessionLists.speakLessWriteMorePrimary);
        primaryUpsideDownText
            .setMessagesData(SessionLists.speakLessWriteMorePrimary);
        secondaryRightSideUpText
            .setMessagesData(SessionLists.speakLessWriteMoreSecondary);
        secondaryUpsideDownText
            .setMessagesData(SessionLists.speakLessWriteMoreSecondary);
        primaryRightSideUpText.setStaticAltMovie(Colors.black);
        secondaryRightSideUpText.setStaticAltMovie(Colors.black);
        primaryUpsideDownText.setStaticAltMovie(Colors.black);
        secondaryUpsideDownText.setStaticAltMovie(Colors.black);
      case MirroredTextContentOptions.irlNokhteSessionSpeakingWaiting:
        setPrimaryMessagesData(SessionLists.speakingWaiting);
        setSecondaryMessagesData(SharedLists.empty);
        prepForSplitScreen();

      default:
        break;
    }
  }

  @action
  prepForSplitScreen() {
    primaryRightSideUpText.setStaticAltMovie(NokhteSessionConstants.blue);
    secondaryRightSideUpText.setStaticAltMovie(NokhteSessionConstants.blue);
  }

  @action
  setPrimaryMessagesData(List<RotatingTextData> messagesData) {
    primaryRightSideUpText.setMessagesData(messagesData);
    primaryUpsideDownText.setMessagesData(messagesData);
  }

  @action
  setSecondaryMessagesData(List<RotatingTextData> messagesData) {
    secondaryRightSideUpText.setMessagesData(messagesData);
    secondaryUpsideDownText.setMessagesData(messagesData);
  }

  @action
  startRotatingRightSideUp({bool isResuming = false}) {
    primaryRightSideUpText.startRotatingText(isResuming: isResuming);
    secondaryRightSideUpText.startRotatingText(isResuming: isResuming);
  }

  @action
  startRotatingUpsideDown({bool isResuming = false}) {
    primaryUpsideDownText.startRotatingText(isResuming: isResuming);
    secondaryUpsideDownText.startRotatingText(isResuming: isResuming);
  }

  @action
  startBothRotatingText({
    bool isResuming = false,
  }) {
    startRotatingRightSideUp(isResuming: isResuming);
    startRotatingUpsideDown(isResuming: isResuming);
  }

  @override
  @action
  setWidgetVisibility(bool isVisible) {
    primaryRightSideUpText.setWidgetVisibility(isVisible);
    secondaryRightSideUpText.setWidgetVisibility(isVisible);
    primaryUpsideDownText.setWidgetVisibility(isVisible);
    secondaryUpsideDownText.setWidgetVisibility(isVisible);
  }

  @action
  setRightSideUpColor(Color color) {
    primaryRightSideUpText.setStaticAltMovie(color);
    secondaryRightSideUpText.setStaticAltMovie(color);
  }

  @action
  setRightsideUpVisibility(bool isVisible) {
    primaryRightSideUpText.setWidgetVisibility(isVisible);
    secondaryRightSideUpText.setWidgetVisibility(isVisible);
  }

  @action
  setUpsideDownVisibility(bool isVisible) {
    primaryUpsideDownText.setWidgetVisibility(isVisible);
    secondaryUpsideDownText.setWidgetVisibility(isVisible);
  }

  @action
  reset() {
    primaryRightSideUpText.reset();
    secondaryRightSideUpText.reset();
    primaryUpsideDownText.reset();
    secondaryUpsideDownText.reset();
  }

  @action
  setCurrentIndex(int newIndex) {
    primaryRightSideUpText.setCurrentIndex(newIndex);
    secondaryRightSideUpText.setCurrentIndex(newIndex);
    primaryUpsideDownText.setCurrentIndex(newIndex);
    secondaryUpsideDownText.setCurrentIndex(newIndex);
  }

  @action
  setRightsideUpCurrentIndex(int newIndex) {
    primaryRightSideUpText.setCurrentIndex(newIndex);
    secondaryRightSideUpText.setCurrentIndex(newIndex);
  }

  @action
  setUpsideDownCurrentIndex(int newIndex) {
    primaryUpsideDownText.setCurrentIndex(newIndex);
    secondaryUpsideDownText.setCurrentIndex(newIndex);
  }

  @action
  pauseRightsideUp() {
    primaryRightSideUpText.pause();
    secondaryRightSideUpText.pause();
  }

  @action
  resumeRightsideUp() {
    primaryRightSideUpText.resume();
    secondaryRightSideUpText.resume();
  }

  @action
  pauseUpsideDown() {
    primaryUpsideDownText.pause();
    secondaryUpsideDownText.pause();
  }

  @action
  resumeUpsideDown() {
    primaryUpsideDownText.resume();
    secondaryUpsideDownText.resume();
  }

  @observable
  double primaryRightSideUpTopPadding = .15;

  @observable
  double primaryRightSideUpBottomPadding = 0;

  @observable
  double secondaryRightSideUpTopPadding = .33;

  @observable
  double secondaryRightSideUpBottomPadding = 0;

  @observable
  double primaryUpsideDownTopPadding = .12;

  @observable
  double primaryUpsideDownBottomPadding = 0;

  @observable
  double secondaryUpsideDownTopPadding = .30;

  @observable
  double secondaryUpsideDownBottomPadding = 0;

  @action
  setPadding({
    double? primaryRightSideUpTopPadding,
    double? primaryRightSideUpBottomPadding,
    double? secondaryRightSideUpTopPadding,
    double? secondaryRightSideUpBottomPadding,
    double? primaryUpsideDownTopPadding,
    double? primaryUpsideDownBottomPadding,
    double? secondaryUpsideDownTopPadding,
    double? secondaryUpsideDownBottomPadding,
  }) {
    if (primaryRightSideUpTopPadding != null) {
      this.primaryRightSideUpTopPadding = primaryRightSideUpTopPadding;
    }
    if (primaryRightSideUpBottomPadding != null) {
      this.primaryRightSideUpBottomPadding = primaryRightSideUpBottomPadding;
    }
    if (secondaryRightSideUpTopPadding != null) {
      this.secondaryRightSideUpTopPadding = secondaryRightSideUpTopPadding;
    }
    if (secondaryRightSideUpBottomPadding != null) {
      this.secondaryRightSideUpBottomPadding =
          secondaryRightSideUpBottomPadding;
    }
    if (primaryUpsideDownTopPadding != null) {
      this.primaryUpsideDownTopPadding = primaryUpsideDownTopPadding;
    }
    if (primaryUpsideDownBottomPadding != null) {
      this.primaryUpsideDownBottomPadding = primaryUpsideDownBottomPadding;
    }
    if (secondaryUpsideDownTopPadding != null) {
      this.secondaryUpsideDownTopPadding = secondaryUpsideDownTopPadding;
    }
    if (secondaryUpsideDownBottomPadding != null) {
      this.secondaryUpsideDownBottomPadding = secondaryUpsideDownBottomPadding;
    }
  }

  @computed
  bool get isReadyToBeDismissed =>
      primaryRightSideUpText.currentIndex == 1 &&
      primaryUpsideDownText.currentIndex == 1;

  @computed
  String get primaryRightSideUpCurrentMessage =>
      primaryRightSideUpText.currentMainText;

  @computed
  String get primaryUpsideDownCurrentMessage =>
      primaryUpsideDownText.currentMainText;

  @computed
  bool get eitherOneIsFadedInAndOtherIsFadedOut =>
      ((primaryRightSideUpCurrentMessage.isEmpty &&
              primaryUpsideDownCurrentMessage.isNotEmpty) ||
          (primaryRightSideUpCurrentMessage.isNotEmpty &&
              primaryUpsideDownCurrentMessage.isEmpty));

  @computed
  bool get textIsDoneAnimating =>
      (primaryRightSideUpText.movieStatus != MovieStatus.inProgress &&
          eitherOneIsFadedInAndOtherIsFadedOut) &&
      (primaryUpsideDownText.movieStatus != MovieStatus.inProgress &&
          eitherOneIsFadedInAndOtherIsFadedOut);
}

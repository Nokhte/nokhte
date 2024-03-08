// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/constants/constants.dart';
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
  }) {
    primaryRightSideUpText.setStaticAltMovie(NokhteSessionConstants.blue);
    secondaryRightSideUpText.setStaticAltMovie(NokhteSessionConstants.blue);
  }

  @action
  setMessagesData(
    MirroredTextContentOptions types,
  ) {
    List<RotatingTextData> secondaryMessageData = [];
    switch (types) {
      case MirroredTextContentOptions.irlNokhteSessionSpeakingInstructions:
        secondaryMessageData = MessagesData
            .irlNokhteSessionSpeakingInstructionsSecondaryPhase0List;
        primaryRightSideUpText.setMessagesData(
          MessagesData.getIrlNokhteSessionSpeakingInstructionsPrimaryPhase0List(
              MirroredTextOrientations.rightSideUp),
        );
        primaryUpsideDownText.setMessagesData(
          MessagesData.getIrlNokhteSessionSpeakingInstructionsPrimaryPhase0List(
              MirroredTextOrientations.upsideDown),
        );
      case MirroredTextContentOptions.irlNokhteSessionSpeakingPhone:
        primaryRightSideUpText.setMessagesData(MessagesData.empty);
        primaryUpsideDownText.setMessagesData(MessagesData.empty);
        secondaryMessageData =
            MessagesData.irlNokhteSessionSpeakingPhoneSecondaryPhase0List;
      default:
        break;
    }
    secondaryRightSideUpText.setMessagesData(secondaryMessageData);
    secondaryUpsideDownText.setMessagesData(secondaryMessageData);
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

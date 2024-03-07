// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
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
    primaryRightSideUpText.setStaticAltMovie(MirroredTextColors.blue);
    secondaryRightSideUpText.setStaticAltMovie(MirroredTextColors.blue);
  }

  @action
  setMessagesData(
    MirroredTextContentOptions types,
  ) {
    List<RotatingTextData> primaryMessageData = [];
    List<RotatingTextData> secondaryMessageData = [];
    switch (types) {
      case MirroredTextContentOptions.irlNokhteSessionSpeakingPhone:
        primaryMessageData =
            MessagesData.irlNokhteSessionSpeakingPhonePrimaryPhase0List;
        secondaryMessageData =
            MessagesData.irlNokhteSessionSpeakingPhoneSecondaryPhase0List;
      default:
        break;
    }
    primaryRightSideUpText.setMessagesData(primaryMessageData);
    primaryUpsideDownText.setMessagesData(primaryMessageData);
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

  startRotatingText({
    required MirroredTextOrientations orientation,
    bool isResuming = false,
  }) {
    switch (orientation) {
      case MirroredTextOrientations.rightSideUp:
        startRotatingRightSideUp(isResuming: isResuming);
      case MirroredTextOrientations.upsideDown:
        startRotatingUpsideDown(isResuming: isResuming);
      case MirroredTextOrientations.both:
        startRotatingRightSideUp(isResuming: isResuming);
        startRotatingUpsideDown(isResuming: isResuming);
    }
  }
}

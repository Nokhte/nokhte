// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
part 'article_body_store.g.dart';

class ArticleBodyStore = _ArticleBodyStoreBase with _$ArticleBodyStore;

abstract class _ArticleBodyStoreBase extends BaseWidgetStore with Store {
  @observable
  int activeIndex = 0;

  @observable
  PresetTypes presetType = PresetTypes.collaborative;

  @action
  setPresetType(PresetTypes type) => presetType = type;

  @action
  setActiveIndex(int index) {
    setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      activeIndex = index;
      setWidgetVisibility(true);
    });
  }

  @observable
  double currentPosition = 0.0;

  @action
  setCurrentPosition(double position) => currentPosition = position;

  @action
  reset() {
    currentPosition = 0.0;
    activeIndex = 0;
  }

  @computed
  List<String> get currentInstruction {
    if (currentPosition.isLessThanOrEqualTo(.5)) {
      return bodyInfo.speakingInstructions;
    } else if (currentPosition.isGreaterThan(.5) &&
        currentPosition.isLessThanOrEqualTo(1.5)) {
      return bodyInfo.sittingInstructions;
    } else if (currentPosition.isGreaterThan(1.5)) {
      return bodyInfo.notesInstructions;
    } else {
      return [];
    }
  }

  @computed
  List<String> get currentJustification {
    if (currentPosition.isLessThanOrEqualTo(.5)) {
      return bodyInfo.speakingJustifications;
    } else if (currentPosition.isGreaterThan(.5) &&
        currentPosition.isLessThanOrEqualTo(1.5)) {
      return bodyInfo.sittingJustifications;
    } else if (currentPosition.isGreaterThan(1.5)) {
      return bodyInfo.notesJustifications;
    } else {
      return [];
    }
  }

  @computed
  String get name => presetType == PresetTypes.collaborative
      ? 'Collaboration'
      : 'Consultation';

  @computed
  PowerupInfo get powerUpInfo => PowerupInfo(
        presetType == PresetTypes.collaborative
            ? Powerups.rally
            : Powerups.letEmCook,
      );

  @computed
  List get tags => presetType == PresetTypes.collaborative
      ? ["tap_to_speak", "flexible_seating", "notes_during"]
      : ["hold_to_speak", "strict_seating", "notes_during"];

  @computed
  String get currentInstructionsHeader {
    if (currentPosition.isLessThanOrEqualTo(.5)) {
      return 'How to speak:';
    } else if (currentPosition.isGreaterThan(.5) &&
        currentPosition.isLessThanOrEqualTo(1.5)) {
      return 'Where to sit:';
    } else if (currentPosition.isGreaterThan(1.5)) {
      return 'How to take notes:';
    } else {
      return '';
    }
  }

  @computed
  ArticleBodyInfo get bodyInfo => ArticleBodyInfo(
        presetType: presetType,
      );
}

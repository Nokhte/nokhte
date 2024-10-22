// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
part 'article_body_store.g.dart';

class ArticleBodyStore = _ArticleBodyStoreBase with _$ArticleBodyStore;

abstract class _ArticleBodyStoreBase extends BaseWidgetStore with Store {
  @observable
  CompanyPresetsEntity preset = CompanyPresetsEntity.initial();

  @action
  setPreset(
    CompanyPresetsEntity entity,
    int indexToLookAt,
  ) {
    preset = entity;
    activeIndex = indexToLookAt;
  }

  @observable
  int activeIndex = 0;

  @observable
  double currentPosition = 0.0;

  @action
  setCurrentPosition(double position) => currentPosition = position;

  @action
  reset() {
    currentPosition = 0.0;
  }

  ArticleSection _getCurrentSection() {
    if (currentPosition.isLessThanOrEqualTo(.5)) {
      return article.articleSections[0];
    } else if (currentPosition.isGreaterThan(.5) &&
        currentPosition.isLessThanOrEqualTo(1.5)) {
      return article.articleSections[1];
    } else if (currentPosition.isGreaterThan(1.5)) {
      return article.articleSections[2];
    }
    return ArticleSection.initial();
  }

  @computed
  SessionTags get currentTag {
    final section = _getCurrentSection();
    return section.tag;
  }

  @computed
  List<String> get currentInstruction {
    final section = _getCurrentSection();
    return section.articleInstructions;
  }

  @computed
  List<String> get currentJustification {
    final section = _getCurrentSection();
    return section.articleJustifications;
  }

  @computed
  PowerupInfo get powerUpInfo {
    final section = _getCurrentSection();
    return section.powerup;
  }

  @computed
  String get currentInstructionsHeader {
    final section = _getCurrentSection();
    return section.sectionHeader;
  }

  @computed
  PresetArticleEntity get article => preset.articles[activeIndex];

  @computed
  List<SessionTags> get allTheSessionTags => preset.tags[activeIndex];
}

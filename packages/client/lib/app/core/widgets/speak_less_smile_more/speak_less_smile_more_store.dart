// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'speak_less_smile_more_store.g.dart';

class SpeakLessSmileMoreStore = _SpeakLessSmileMoreStoreBase
    with _$SpeakLessSmileMoreStore;

abstract class _SpeakLessSmileMoreStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  @observable
  bool showSpeakLess = false;

  @observable
  bool showSmileMore = false;

  @action
  setSpeakLess(bool newVal) => showSpeakLess = newVal;

  @action
  setSmileMore(bool newVal) => showSmileMore = newVal;

  @action
  hideBoth() {
    showSpeakLess = false;
    showSmileMore = false;
  }
}

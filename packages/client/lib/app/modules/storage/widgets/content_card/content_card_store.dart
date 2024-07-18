// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'content_card_store.g.dart';

class ContentCardStore = _ContentCardStoreBase with _$ContentCardStore;

abstract class _ContentCardStoreBase extends BaseWidgetStore
    with Store {

  @observable
  bool disableTouchInput = false;

  @action
  setDisableTouchInput(bool newVal) {
    disableTouchInput = newVal;
  }
}

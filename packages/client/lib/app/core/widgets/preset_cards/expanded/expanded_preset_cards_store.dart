// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'expanded_preset_cards_store.g.dart';

class ExpandedPresetCardsStore = _ExpandedPresetCardsStoreBase
    with _$ExpandedPresetCardsStore;

abstract class _ExpandedPresetCardsStoreBase extends BaseWidgetStore
    with Store {
  _ExpandedPresetCardsStoreBase() {
    setWidgetVisibility(false);
  }
  //
}

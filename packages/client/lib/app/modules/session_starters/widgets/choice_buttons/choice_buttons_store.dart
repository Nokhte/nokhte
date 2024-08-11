// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'choice_buttons_store.g.dart';

class ChoiceButtonsStore = _ChoiceButtonsStoreBase with _$ChoiceButtonsStore;

abstract class _ChoiceButtonsStoreBase extends BaseWidgetStore with Store {
  @observable
  ChoiceButtonType choiceButtonType = ChoiceButtonType.inital;

  @action
  onTap(ChoiceButtonType type) {
    if (showWidget) {
      choiceButtonType = type;
    }
  }

  @action
  fadeIn() {
    setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      setWidgetVisibility(true);
    });
  }
}

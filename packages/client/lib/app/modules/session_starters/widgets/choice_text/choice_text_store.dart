// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
part 'choice_text_store.g.dart';

class ChoiceTextStore = _ChoiceTextStoreBase with _$ChoiceTextStore;

abstract class _ChoiceTextStoreBase extends BaseWidgetStore with Store {
  @action
  fadeIn() {
    setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      setWidgetVisibility(true);
    });
  }
}

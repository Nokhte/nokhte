// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
part 'content_card_store.g.dart';

class ContentCardStore = _ContentCardStoreBase with _$ContentCardStore;

abstract class _ContentCardStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @action
  initFadeIn() {
    setWidgetVisibility(false);
    Timer(Seconds.get(0, milli: 1), () {
      setWidgetVisibility(true);
    });
  }
}

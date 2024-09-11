// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'session_scroller_store.g.dart';

class SessionScrollerStore = _SessionScrollerStoreBase
    with _$SessionScrollerStore;

abstract class _SessionScrollerStoreBase extends BaseWidgetStore with Store {
  @observable
  ScrollController scrollController = ScrollController();

  @observable
  bool canScroll = true;

  @action
  setCanScroll(bool newCanScroll) {
    canScroll = newCanScroll;
  }

  @action
  setScrollController(ScrollController newScrollController) {
    scrollController = newScrollController;
    scrollController.addListener(updateScrollPercentage);
  }

  @observable
  double scrollPercentage = 0.0;

  @action
  updateScrollPercentage() {
    if (scrollController.position.maxScrollExtent == 0) {
      scrollPercentage = 0.0;
    } else {
      scrollPercentage =
          scrollController.offset / scrollController.position.maxScrollExtent;
    }
  }
}

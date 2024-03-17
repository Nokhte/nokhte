// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
part 'session_card_store.g.dart';

class SessionCardStore = _SessionCardStoreBase with _$SessionCardStore;

abstract class _SessionCardStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @action
  initFadeIn() {
    setWidgetVisibility(false);
    Future.delayed(Seconds.get(0, milli: 1), () {
      setWidgetVisibility(true);
    });
  }

  @observable
  ObservableList<FocusNode> focusNodes = ObservableList();

  @observable
  ObservableList<bool> hasBeenInitiallySet = ObservableList.of(
    List.filled(100, false),
  );

  @observable
  ObservableList<TextEditingController> textEditingControllers =
      ObservableList();

  @observable
  bool isReadOnly = false;

  @action
  setIsReadOnly(bool newBool) => isReadOnly = newBool;

  @action
  onDoubleTap(int index) {
    focusNodes[index].requestFocus();
  }

  @action
  onEditingComplete() => setIsReadOnly(true);

  @observable
  int lastEditedId = -1;

  @observable
  String lastEditedTitle = '';

  @observable
  int lastTappedIndex = -1;

  @action
  onTap(int newIndex) {
    lastTappedIndex = newIndex;
    focusNodes[newIndex].unfocus();
  }

  @action
  onEdit(int id, String title, int index) {
    lastEditedId = id;
    lastEditedTitle = title;
    focusNodes[index].unfocus();
  }

  @action
  dispose() {
    for (var controller in textEditingControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
  }
}

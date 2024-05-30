// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

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
    Timer(Seconds.get(0, milli: 1), () {
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
  bool disableTouchInput = false;

  @action
  setDisableTouchInput(bool newVal) {
    isReadOnly = newVal;
    disableTouchInput = newVal;
  }

  @observable
  ObservableList<TextEditingController> textEditingControllers =
      ObservableList();

  @observable
  bool isReadOnly = false;

  @action
  setIsReadOnly(bool newBool) => isReadOnly = newBool;

  @action
  onDoubleTap(int index) {
    // if (!disableTouchInput) {
    //   focusNodes[index].requestFocus();
    //   setDisableTouchInput(true);
    // }
  }

  @action
  onEditingComplete() {
    // setIsReadOnly(true);
  }

  @observable
  String lastEditedId = '';

  @observable
  String lastEditedTitle = '';

  @observable
  int lastTappedIndex = -1;

  @action
  onTap(int newIndex) {
    if (!disableTouchInput) {
      lastTappedIndex = newIndex;
      focusNodes[newIndex].unfocus();
    }
  }

  @action
  onEdit(String sessionUID, String title, int index) {
    // setDisableTouchInput(false);
    lastEditedId = sessionUID;
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

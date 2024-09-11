// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
part 'session_card_store.g.dart';

class SessionCardStore = _SessionCardStoreBase with _$SessionCardStore;

abstract class _SessionCardStoreBase extends BaseWidgetStore with Store {
  _SessionCardStoreBase() {
    setWidgetVisibility(false);
  }
  @observable
  FocusNode focusNode = FocusNode();

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
  bool showTextBox = false;

  @observable
  bool showListBox = true;

  @observable
  bool isReadOnly = false;

  @observable
  int lastSelectedIndex = 0;

  @action
  setIsReadOnly(bool newBool) => isReadOnly = newBool;

  @action
  onDoubleTap(int index) {
    if (showListBox && !disableTouchInput) {
      lastSelectedIndex = index;
      showListBox = false;
      Timer(Seconds.get(1), () {
        disableTouchInput = true;
        showTextBox = true;
        focusNode.requestFocus();
      });
    }
  }

  @action
  onTapOutside(String sessionUID, String title) {
    if (showTextBox) {
      showTextBox = false;
      focusNode.unfocus();
      lastEditedId = sessionUID;
      lastEditedTitle = title;
      Timer(Seconds.get(1), () {
        showListBox = true;
        Timer(Seconds.get(1), () {
          disableTouchInput = false;
        });
      });
    }
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
      showTextBox = false;
    }
  }

  @action
  onEdit(String sessionUID, String title) {
    showTextBox = false;
    lastEditedId = sessionUID;
    lastEditedTitle = title;
    focusNode.unfocus();
    Timer(Seconds.get(1), () {
      disableTouchInput = false;
      showListBox = true;
    });
  }

  @action
  dispose() {
    for (var controller in textEditingControllers) {
      controller.dispose();
    }
    focusNode.dispose();
  }
}

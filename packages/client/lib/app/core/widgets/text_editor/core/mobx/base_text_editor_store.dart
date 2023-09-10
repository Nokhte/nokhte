// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'base_text_editor_store.g.dart';

class BaseTextEditorStore = _BaseTextEditorStoreBase with _$BaseTextEditorStore;

abstract class _BaseTextEditorStoreBase extends Equatable with Store {
  @observable
  TextEditingController controller = TextEditingController();

  @observable
  FocusNode focusNode = FocusNode();

  @action
  handleTap() {}

  @action
  addEventListeners() {}

  @action
  dispose() {
    controller.dispose();
    focusNode.dispose();
  }

  @override
  List<Object> get props => [
// some items
      ];
}

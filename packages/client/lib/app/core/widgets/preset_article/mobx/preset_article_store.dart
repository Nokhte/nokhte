// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
part 'preset_article_store.g.dart';

class PresetArticleStore = _PresetArticleStoreBase with _$PresetArticleStore;

abstract class _PresetArticleStoreBase extends BaseWidgetStore with Store {
  final NokhteBlurStore nokhteBlur;
  final ArticleBodyStore body;
  _PresetArticleStoreBase({
    required this.nokhteBlur,
    required this.body,
  }) {
    setWidgetVisibility(false);
  }
  late BuildContext buildContext;
  late AnimationController controller;

  @observable
  bool showPreview = false;

  @action
  setShowPreview(bool value) => showPreview = value;

  @action
  constructor(context, controller) {
    if (tapCount == 0) {
      buildContext = context;
      this.controller = controller;
      tapCount++;
    }
  }

  onTap() {
    if (showPreview) {
      tapCount++;
    }
  }

  @action
  showBottomSheet(
    PresetTypes presetType, {
    required Function onOpen,
    required Function onClose,
  }) async {
    body.setPresetType(presetType);
    if (!showWidget) {
      setWidgetVisibility(true);
      nokhteBlur.init(
        end: Seconds.get(0, milli: 500),
      );
      showModalBottomSheet(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36), // Adjust this value for more radius
          ),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.white.withOpacity(.2),
        context: buildContext,
        builder: (context) {
          return ModalBackdrop(
            store: body,
          );
        },
      ).whenComplete(() {
        body.reset();
        nokhteBlur.reverse();
        setWidgetVisibility(false);
        Timer(Seconds.get(0), () async {
          await onClose();
        });
      });
      await onOpen();
    }
  }
}

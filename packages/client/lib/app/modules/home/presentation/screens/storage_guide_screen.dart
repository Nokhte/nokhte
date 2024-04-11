// ignore_for_file: must_be_immutable, annotate_overrides, overridden_fields
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

class StorageGuideScreen extends BaseHomeScreen {
  StorageGuideScreen({
    super.key,
    required StorageGuideCoordinator coordinator,
  }) : super(
          coordinator: coordinator,
          gestureCrossConfig: coordinator.widgets.gestureCrossConfig,
          instructionalNokhtes: Stack(
            children: [
              CenterInstructionalNokhte(
                store: coordinator.widgets.centerInstructionalNokhte,
              ),
              InstructionalGradientNokhte(
                store: coordinator.widgets.primaryInstructionalGradientNokhte,
              ),
              InstructionalGradientNokhte(
                store: coordinator.widgets.secondaryInstructionalGradientNokhte,
              ),
            ],
          ),
        );
}

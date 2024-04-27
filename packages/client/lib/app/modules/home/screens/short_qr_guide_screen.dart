// ignore_for_file: must_be_immutable, annotate_overrides, overridden_fields
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';

class ShortQrGuideScreen extends BaseHomeScreen {
  ShortQrGuideScreen({
    super.key,
    required ShortQrGuideCoordinator coordinator,
  }) : super(
          coordinator: coordinator,
          gestureCrossConfig: GestureCrossConfiguration(
            right: Right(
              NokhteGradientConfig(
                gradientType: NokhteGradientTypes.vibrantBlue,
              ),
            ),
          ),
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

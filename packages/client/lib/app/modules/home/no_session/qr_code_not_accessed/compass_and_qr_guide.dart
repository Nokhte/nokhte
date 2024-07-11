export 'compass_and_qr_guide_coordinator.dart';
export 'compass_and_qr_guide_widgets_coordinator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';

class CompassAndQrGuideScreen extends BaseHomeScreen {
  CompassAndQrGuideScreen({
    super.key,
    required CompassAndQrGuideCoordinator coordinator,
    required,
  }) : super(
          coordinator: coordinator,
          gestureCrossConfig: GestureCrossConfiguration(
            top: Right(
              NokhteGradientConfig(
                gradientType: NokhteGradientTypes.sessionStarter,
              ),
            ),
          ),
          instructionalNokhtes: Stack(
            children: [
              CenterInstructionalNokhte(
                store: coordinator.widgets.centerInstructionalNokhte,
              ),
              InstructionalGradientNokhte(
                store: coordinator.widgets.focusInstructionalNokhte,
              ),
            ],
          ),
        );
}

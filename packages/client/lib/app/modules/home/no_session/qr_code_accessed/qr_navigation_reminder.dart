export 'qr_navigation_reminder_coordinator.dart';
export 'qr_navigation_reminder_widgets_coordinator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';

class QrNavigationReminderScreen extends BaseHomeScreen {
  QrNavigationReminderScreen({
    super.key,
    required QrNavigationReminderCoordinator coordinator,
  }) : super(
          coordinator: coordinator,
          gestureCrossConfig: GestureCrossConfiguration(
            top: Right(
              NokhteGradientConfig(
                gradientType: NokhteGradientTypes.invertedShore,
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
            ],
          ),
        );
}

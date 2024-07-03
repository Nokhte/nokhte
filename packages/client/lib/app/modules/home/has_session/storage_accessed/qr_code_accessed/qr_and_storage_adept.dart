export 'qr_and_storage_adept_coordinator.dart';
export 'qr_and_storage_adept_widgets_coordinator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';

class QrAndStorageAdeptScreen extends BaseHomeScreen {
  QrAndStorageAdeptScreen({
    super.key,
    required QrAndStorageAdeptCoordinator coordinator,
  }) : super(
          coordinator: coordinator,
          gestureCrossConfig: GestureCrossConfiguration(
            top: Right(
              NokhteGradientConfig(
                gradientType: NokhteGradientTypes.sessionStarter,
              ),
            ),
            right: Right(
              NokhteGradientConfig(
                gradientType: NokhteGradientTypes.storage,
              ),
            ),
          ),
          instructionalNokhtes: Stack(
            children: [
              CenterInstructionalNokhte(
                store: coordinator.widgets.centerInstructionalNokhte,
              ),
              InstructionalGradientNokhte(
                store: coordinator.widgets.sessionStarterInstructionalNokhte,
              ),
              InstructionalGradientNokhte(
                store: coordinator.widgets.storageInstructionalNokhte,
              ),
            ],
          ),
        );
}

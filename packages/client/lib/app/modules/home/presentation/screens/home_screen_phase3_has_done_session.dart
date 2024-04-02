// ignore_for_file: must_be_immutable, annotate_overrides, overridden_fields
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

class HomeScreenPhase3HasDoneSession extends BaseHomeScreen {
  HomeScreenPhase3HasDoneSession({
    super.key,
    required HomeScreenPhase3Coordinator coordinator,
  }) : super(
          coordinator: coordinator,
          gestureCrossConfig: GestureCrossConfiguration(
            top: Right(
              NokhteGradientConfig(
                gradientType: NokhteGradientTypes.oceanDive,
              ),
            ),
            right: Right(
              NokhteGradientConfig(
                gradientType: NokhteGradientTypes.vibrantBlue,
              ),
            ),
          ),
          instructionalNokhtes: Container(),
        );
}

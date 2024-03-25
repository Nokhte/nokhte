import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

class HomeScreenPhase1NoInvitationFlowNoSession extends BaseHomeScreen {
  HomeScreenPhase1NoInvitationFlowNoSession({
    super.key,
    required HomeScreenPhase1Coordinator coordinator,
    required,
  }) : super(
          coordinator: coordinator,
          gestureCrossConfig: GestureCrossConfiguration(
            top: Right(
              NokhteGradientConfig(
                gradientType: NokhteGradientTypes.oceanDive,
              ),
            ),
          ),
        );
}

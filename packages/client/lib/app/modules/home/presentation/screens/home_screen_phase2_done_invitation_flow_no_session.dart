import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

class HomeScreenPhase2DoneInvitationFlowNoSession extends BaseHomeScreen {
  HomeScreenPhase2DoneInvitationFlowNoSession({
    super.key,
    required HomeScreenPhase2Coordinator coordinator,
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

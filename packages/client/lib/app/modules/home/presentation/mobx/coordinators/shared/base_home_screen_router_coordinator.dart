// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'base_home_screen_router_coordinator.g.dart';

class BaseHomeScreenRouterCoordinator = _BaseHomeScreenRouterCoordinatorBase
    with _$BaseHomeScreenRouterCoordinator;

abstract class _BaseHomeScreenRouterCoordinatorBase extends BaseCoordinator
    with Store {
  final GetUserInfoStore getUserInfo;

  _BaseHomeScreenRouterCoordinatorBase({
    required this.getUserInfo,
    required super.captureScreen,
  });

  @observable
  ResumeOnShoreParams params = ResumeOnShoreParams.initial();

  @action
  decideAndRoute(Function setParams) async {
    await getUserInfo(NoParams());
    setParams();
    final args = {"resumeOnShoreParams": params};
    if (!getUserInfo.hasGoneThroughInvitationFlow) {
      Modular.to.navigate("/home/phase1", arguments: args);
    } else if (getUserInfo.hasGoneThroughInvitationFlow &&
        !getUserInfo.hasDoneASession) {
      Modular.to.navigate("/home/phase2", arguments: args);
    } else if (getUserInfo.hasDoneASession) {
      Modular.to.navigate("/home/phase3", arguments: args);
    }
  }

  @action
  onAnimationComplete() {
    final args = {"resumeOnShoreParams": params};
    if (!getUserInfo.hasGoneThroughInvitationFlow) {
      Modular.to.navigate("/home/phase1", arguments: args);
    } else if (getUserInfo.hasGoneThroughInvitationFlow &&
        !getUserInfo.hasDoneASession) {
      Modular.to.navigate("/home/phase2", arguments: args);
    } else if (getUserInfo.hasDoneASession) {
      Modular.to.navigate("/home/phase3", arguments: args);
    }
  }

  @override
  List<Object> get props => [];
}

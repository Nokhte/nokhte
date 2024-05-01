// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
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
  ResumeOnShoreParams params = const ResumeOnShoreParams();

  @action
  decideAndRoute(Function setParams) async {
    await getUserInfo(NoParams());
    setParams();
    onAnimationComplete();
  }

  @action
  onAnimationComplete() {
    final args = {"resumeOnShoreParams": params};
    if (!getUserInfo.hasDoneASession) {
      if (!getUserInfo.hasGoneThroughInvitationFlow) {
        Modular.to.navigate("/home/compass_and_qr_guide", arguments: args);
      } else {
        Modular.to.navigate("/home/qr_navigation_reminder", arguments: args);
      }
    } else if (getUserInfo.hasDoneASession) {
      if (!getUserInfo.hasEnteredStorage &&
          getUserInfo.hasGoneThroughInvitationFlow) {
        Modular.to.navigate("/home/storage_guide", arguments: args);
      } else if (!getUserInfo.hasEnteredStorage &&
          !getUserInfo.hasGoneThroughInvitationFlow) {
        Modular.to.navigate("/home/compass_and_storage_guide", arguments: args);
      } else if (getUserInfo.hasEnteredStorage &&
          !getUserInfo.hasGoneThroughInvitationFlow) {
        Modular.to.navigate("/home/short_qr_guide", arguments: args);
      } else {
        Modular.to.navigate("/home/qr_and_storage_adept", arguments: args);
      }
    }
  }
}

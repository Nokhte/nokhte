// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/modules/home/home.dart';

mixin HomeScreenRouter on EnRouteRouter {
  GetUserInfoStore get getUserInfo;

  @action
  decideAndRoute(Function setParams) async {
    await getUserInfo(NoParams());
    setParams();
    onAnimationComplete();
  }

  @action
  onAnimationComplete() {
    final args = getModularArgs(params);
    if (getUserInfo.isOnMostRecentVersion) {
      Modular.to.navigate(HomeConstants.home, arguments: args);
    } else {
      Modular.to.navigate(HomeConstants.needsToUpdate, arguments: args);
    }
  }
}

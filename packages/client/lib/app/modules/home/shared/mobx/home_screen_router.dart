// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';

mixin HomeScreenRouter on Store {
  GetUserInfoStore get getUserInfo;

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
    if (getUserInfo.isOnMostRecentVersion) {
      if (!getUserInfo.hasDoneASession) {
        if (!getUserInfo.hasAccessedQrCode) {
          Modular.to.navigate(HomeConstants.compassAndQrGuide, arguments: args);
        } else {
          Modular.to
              .navigate(HomeConstants.qrNavigationReminder, arguments: args);
        }
      } else if (getUserInfo.hasDoneASession) {
        if (!getUserInfo.hasEnteredStorage && getUserInfo.hasAccessedQrCode) {
          Modular.to.navigate(HomeConstants.storageGuide, arguments: args);
        } else if (!getUserInfo.hasEnteredStorage &&
            !getUserInfo.hasAccessedQrCode) {
          Modular.to
              .navigate(HomeConstants.compassAndStorageGuide, arguments: args);
        } else if (getUserInfo.hasEnteredStorage &&
            !getUserInfo.hasAccessedQrCode) {
          Modular.to.navigate(HomeConstants.shortQrGuide, arguments: args);
        } else {
          Modular.to.navigate(HomeConstants.qrAndStorageAdept, arguments: args);
        }
      }
    } else {
      Modular.to.navigate(HomeConstants.needsToUpdate, arguments: args);
    }
  }
}

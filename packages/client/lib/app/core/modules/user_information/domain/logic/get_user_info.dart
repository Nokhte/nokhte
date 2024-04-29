import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class GetUserInfo extends BaseGetUserInfo<UserInformationContract>
    implements AbstractFutureLogic<UserJourneyInfoEntity, NoParams> {
  GetUserInfo({required super.contract});

  @override
  call(params) async => await contract.getUserInfo(params);
}

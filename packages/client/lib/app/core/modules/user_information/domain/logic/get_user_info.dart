import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/shared/base_get_user_info.dart';

class GetUserInfo extends BaseGetUserInfo<UserInformationContract>
    implements AbstractFutureLogic<UserJourneyInfoEntity, NoParams> {
  GetUserInfo({required super.contract});

  @override
  call(params) async => await contract.getUserInfo(params);
}

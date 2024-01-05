import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

class GetUserInfo
    implements AbstractFutureLogic<UserJourneyInfoEntity, NoParams> {
  final UserInformationContract contract;

  GetUserInfo({required this.contract});

  @override
  call(params) async => await contract.getUserInfo(params);
}

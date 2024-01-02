import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';

class GetInvitationURL
    implements
        AbstractFutureLogic<CollaborationInvitationDataEntity, NoParams> {
  final HomeContract contract;

  GetInvitationURL({required this.contract});

  @override
  call(params) async => await contract.getInvitationURL(params);
}

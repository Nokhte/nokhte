import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app//modules/home/domain/domain.dart';

class UpdateHasSentAnInvitation
    implements
        AbstractFutureLogic<HasSentAnInvitationUpdateStatusEntity, bool> {
  final HomeContract contract;

  UpdateHasSentAnInvitation({required this.contract});

  @override
  call(params) async => await contract.updateHasSentAnInvitation(params);
}

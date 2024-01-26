import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';

class CreateIndividualSession
    implements AbstractFutureLogic<IndividualSessionCreationEntity, NoParams> {
  final IndividualSessionContract contract;

  CreateIndividualSession({required this.contract});

  @override
  call(params) async => await contract.createIndividualSession(params);
}

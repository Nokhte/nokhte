import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session_starters/domain/domain.dart';

class GetNokhteSessionSearchStatus
    implements AbstractFutureLogic<Stream<bool>, NoParams> {
  final SessionStartersContract contract;

  GetNokhteSessionSearchStatus({required this.contract});

  @override
  call(params) async => await contract.getNokhteSessionSearchStatus(params);
}

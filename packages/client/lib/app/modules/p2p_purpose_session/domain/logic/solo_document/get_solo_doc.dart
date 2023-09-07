import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class GetSoloDoc extends AbstractFutureLogic<SoloDocContentEntity, NoParams> {
  final P2PPurposeSessionSoloDocContract contract;

  GetSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.getSoloDocContent();
}

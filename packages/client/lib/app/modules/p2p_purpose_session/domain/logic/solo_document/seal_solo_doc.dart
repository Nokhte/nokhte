import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class SealSoloDoc
    extends AbstractFutureLogic<SoloDocSealingStatusEntity, NoParams> {
  final P2PPurposeSessionSoloDocContract contract;

  SealSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.sealSoloDoc();
}

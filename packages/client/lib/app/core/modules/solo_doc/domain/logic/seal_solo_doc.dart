import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class SealSoloDoc
    extends AbstractFutureLogic<SoloDocSealingStatusEntity, NoParams> {
  final P2PPurposeSessionSoloDocContract contract;

  SealSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.sealSoloDoc();
}

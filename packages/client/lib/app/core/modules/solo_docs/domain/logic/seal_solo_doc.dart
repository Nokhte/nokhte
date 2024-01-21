import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';

class SealSoloDoc extends AbstractFutureLogic<bool, NoParams> {
  final SoloDocsContract contract;

  SealSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.sealSoloDoc();
}

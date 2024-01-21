import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';

class ShareSoloDoc extends AbstractFutureLogic<bool, NoParams> {
  final SoloDocsContract contract;

  ShareSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.shareSoloDoc();
}

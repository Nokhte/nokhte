import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';

class SubmitSoloDoc extends AbstractFutureLogic<bool, String> {
  final SoloDocsContract contract;

  SubmitSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.submitDocContent(params);
}

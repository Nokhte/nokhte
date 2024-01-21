import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';

class CreateSoloDoc extends AbstractFutureLogic<bool, SoloDocTypes> {
  final SoloDocsContract contract;

  CreateSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.createSoloDoc(params);
}

enum SoloDocTypes {
  purpose,
  collective,
}

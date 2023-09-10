import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class CreateSoloDoc
    extends AbstractFutureLogic<SoloDocCreationStatusEntity, NoParams> {
  final P2PPurposeSessionSoloDocContract contract;

  CreateSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.createSoloDoc();
}

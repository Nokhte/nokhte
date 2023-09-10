import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class ShareSoloDoc
    extends AbstractFutureLogic<SoloDocSharingStatusEntity, NoParams> {
  final SoloDocContract contract;

  ShareSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.shareSoloDoc();
}

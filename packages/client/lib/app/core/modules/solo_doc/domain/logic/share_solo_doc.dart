import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class ShareSoloDoc
    extends AbstractFutureLogic<SoloDocSharingStatusEntity, NoParams> {
  final P2PPurposeSessionSoloDocContract contract;

  ShareSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.shareSoloDoc();
}

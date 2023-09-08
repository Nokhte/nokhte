import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class GetSoloDoc
    extends AbstractFutureLogic<SoloDocContentEntity, GetSoloDocParams> {
  final P2PPurposeSessionSoloDocContract contract;

  GetSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.getSoloDocContent(
      getCollaboratorsDoc: params.getCollaboratorsDoc);
}

class GetSoloDocParams extends Equatable {
  final bool getCollaboratorsDoc;

  const GetSoloDocParams({required this.getCollaboratorsDoc});

  @override
  List<Object> get props => [getCollaboratorsDoc];
}

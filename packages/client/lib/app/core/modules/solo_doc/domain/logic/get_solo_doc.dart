import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class GetSoloDoc
    extends AbstractFutureLogic<SoloDocContentEntity, GetSoloDocParams> {
  final SoloDocContract contract;

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

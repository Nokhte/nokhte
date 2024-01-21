import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class GetSoloDoc extends AbstractFutureLogic<String, GetSoloDocParams> {
  final SoloDocContract contract;

  GetSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.getSoloDocContent(params);
}

class GetSoloDocParams extends Equatable {
  final bool getCollaboratorsDoc;

  const GetSoloDocParams({required this.getCollaboratorsDoc});

  @override
  List<Object> get props => [getCollaboratorsDoc];
}

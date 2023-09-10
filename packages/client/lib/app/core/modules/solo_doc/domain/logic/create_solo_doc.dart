import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class CreateSoloDoc extends AbstractFutureLogic<SoloDocCreationStatusEntity,
    CreateSoloDocParams> {
  final SoloDocContract contract;

  CreateSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.createSoloDoc(docType: params.docType);
}

class CreateSoloDocParams extends Equatable {
  final String docType;

  const CreateSoloDocParams({required this.docType});

  @override
  List<Object> get props => [docType];
}

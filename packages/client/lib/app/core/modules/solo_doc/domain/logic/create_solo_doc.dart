import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class CreateSoloDoc extends AbstractFutureLogic<bool, CreateSoloDocParams> {
  final SoloDocContract contract;

  CreateSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.createSoloDoc(params);
}

class CreateSoloDocParams extends Equatable {
  final String docType;

  const CreateSoloDocParams({required this.docType});

  @override
  List<Object> get props => [docType];
}

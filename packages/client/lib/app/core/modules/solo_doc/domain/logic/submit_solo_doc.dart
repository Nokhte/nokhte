import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class SubmitSoloDoc extends AbstractFutureLogic<SoloDocSubmissionStatusEntity,
    SubmitSoloDocParams> {
  final SoloDocContract contract;

  SubmitSoloDoc({
    required this.contract,
  });

  @override
  call(params) async => await contract.submitDocContent(
        newContent: params.content,
      );
}

class SubmitSoloDocParams extends Equatable {
  final String content;

  const SubmitSoloDocParams({
    required this.content,
  });

  @override
  List get props => [content];
}

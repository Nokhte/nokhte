import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class SubmitSoloDoc extends AbstractFutureLogic<SoloDocSubmissionStatusEntity,
    SubmitSoloDocParams> {
  final P2PPurposeSessionSoloDocContract contract;

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

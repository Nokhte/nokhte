import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class SubmitSoloDocContent extends AbstractFutureLogic<
    SoloDocSubmissionStatusEntity, SubmitSoloDocContentParams> {
  final P2PPurposeSessionSoloDocContract contract;

  SubmitSoloDocContent({
    required this.contract,
  });

  @override
  call(params) async => await contract.submitDocContent(
        newContent: params.content,
      );
}

class SubmitSoloDocContentParams extends Equatable {
  final String content;

  const SubmitSoloDocContentParams({
    required this.content,
  });

  @override
  List get props => [content];
}

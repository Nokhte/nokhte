import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/types/types.dart';

class UpdateSessionMetadata
    implements
        AbstractFutureLogic<IndividualSessionMetadataUpdateStatusEntity,
            UpdateSessionMetadataParams> {
  final IndividualSessionContract contract;

  UpdateSessionMetadata({required this.contract});

  @override
  call(params) async => await contract.updateSessionMetadata(params);
}

class UpdateSessionMetadataParams extends Equatable {
  final SessionMetadata sessionMetadata;
  const UpdateSessionMetadataParams({
    required this.sessionMetadata,
  });

  @override
  List<Object> get props => [sessionMetadata];
}

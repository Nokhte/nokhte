import 'package:nokhte/app/modules/home/domain/domain.dart';

class HasGoneThroughInvitationFlowUpdateStatusModel
    extends HasGoneThroughInvitationFlowUpdateStatusEntity {
  const HasGoneThroughInvitationFlowUpdateStatusModel({
    required super.isUpdated,
  });

  factory HasGoneThroughInvitationFlowUpdateStatusModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const HasGoneThroughInvitationFlowUpdateStatusModel(
        isUpdated: false,
      );
    } else {
      return const HasGoneThroughInvitationFlowUpdateStatusModel(
        isUpdated: true,
      );
    }
  }
}

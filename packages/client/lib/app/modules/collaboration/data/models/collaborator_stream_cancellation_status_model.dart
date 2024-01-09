import 'package:nokhte/app/modules/collaboration/domain/domain.dart';

class CollaboratorStreamCancellationStatusModel
    extends CollaboratorStreamCancellationStatusEntity {
  const CollaboratorStreamCancellationStatusModel({
    required super.isCancelled,
  });

  factory CollaboratorStreamCancellationStatusModel.fromSupabase(
          bool listeningStatus) =>
      CollaboratorStreamCancellationStatusModel(
        isCancelled: !listeningStatus,
      );
}

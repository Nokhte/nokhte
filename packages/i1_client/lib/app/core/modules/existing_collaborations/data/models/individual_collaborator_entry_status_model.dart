import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';

class IndividualCollaboratorEntryStatusModel
    extends IndividualCollaboratorEntryStatusEntity {
  const IndividualCollaboratorEntryStatusModel({required super.hasEntered});

  static IndividualCollaboratorEntryStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const IndividualCollaboratorEntryStatusModel(hasEntered: false);
    } else {
      return const IndividualCollaboratorEntryStatusModel(hasEntered: true);
    }
  }
}

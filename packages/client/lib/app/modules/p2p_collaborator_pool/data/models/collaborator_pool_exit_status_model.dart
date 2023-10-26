import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaboratorPoolExitStatusModel extends CollaboratorPoolExitStatusEntity {
  const CollaboratorPoolExitStatusModel({required bool hasLeft})
      : super(hasLeft: hasLeft);

  static CollaboratorPoolExitStatusModel fromSupabase(
      {required FunctionResponse funcRes}) {
    if (funcRes.status == 200) {
      return const CollaboratorPoolExitStatusModel(hasLeft: true);
    } else {
      return const CollaboratorPoolExitStatusModel(hasLeft: false);
    }
  }
}

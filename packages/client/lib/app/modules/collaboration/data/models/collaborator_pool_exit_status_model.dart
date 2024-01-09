import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaboratorPoolExitStatusModel extends CollaboratorPoolExitStatusEntity {
  const CollaboratorPoolExitStatusModel({required bool super.hasLeft});

  factory CollaboratorPoolExitStatusModel.fromSupabase(
    FunctionResponse funcRes,
  ) {
    if (funcRes.status == 200) {
      return const CollaboratorPoolExitStatusModel(hasLeft: true);
    } else {
      return const CollaboratorPoolExitStatusModel(hasLeft: false);
    }
  }
}

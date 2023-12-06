// ignore_for_file: use_super_parameters

import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaboratorPoolEntryStatusModel
    extends CollaboratorPoolEntryStatusEntity {
  const CollaboratorPoolEntryStatusModel({required bool hasEntered})
      : super(hasEntered: hasEntered);
  static CollaboratorPoolEntryStatusModel fromSupabase(
      {required FunctionResponse funcRes}) {
    if (funcRes.status == 200) {
      return const CollaboratorPoolEntryStatusModel(hasEntered: true);
    } else {
      return const CollaboratorPoolEntryStatusModel(hasEntered: false);
    }
  }
}

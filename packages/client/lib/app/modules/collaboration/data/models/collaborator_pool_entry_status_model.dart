// ignore_for_file: use_super_parameters

import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaboratorPoolEntryStatusModel
    extends CollaboratorPoolEntryStatusEntity {
  const CollaboratorPoolEntryStatusModel({required bool hasEntered})
      : super(hasEntered: hasEntered);
  factory CollaboratorPoolEntryStatusModel.fromSupabase(
    FunctionResponse funcRes,
  ) {
    if (funcRes.status == 200) {
      return const CollaboratorPoolEntryStatusModel(hasEntered: true);
    } else {
      return const CollaboratorPoolEntryStatusModel(hasEntered: false);
    }
  }
}

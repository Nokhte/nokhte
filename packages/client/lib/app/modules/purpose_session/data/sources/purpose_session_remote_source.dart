import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PurposeSessionRemoteSource {
  Future<bool> checkIfUserHasTheQuestion();
}

class PurposeSessionRemoteSourceImpl implements PurposeSessionRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborations;
  PurposeSessionRemoteSourceImpl({
    required this.supabase,
  }) : existingCollaborations =
            ExistingCollaborationsQueries(supabase: supabase);

  @override
  Future<bool> checkIfUserHasTheQuestion() async =>
      await existingCollaborations.checkIfUserHasTheQuestion();
}

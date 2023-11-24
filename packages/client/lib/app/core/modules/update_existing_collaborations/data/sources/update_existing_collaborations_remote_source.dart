import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UpdateExistingCollaborationsRemoteSource {
  Future<List> updateCollaborationActivationStatus(
      {required bool shouldActivate});
  Future<List> consecrateTheCollaboration(NoParams params);
}

class UpdateExistingCollaborationsRemoteSourceImpl
    implements UpdateExistingCollaborationsRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries queries;

  UpdateExistingCollaborationsRemoteSourceImpl({
    required this.supabase,
  }) : queries = ExistingCollaborationsQueries(supabase: supabase);
  @override
  Future<List> consecrateTheCollaboration(NoParams params) async =>
      queries.consecrateTheCollaboration();

  @override
  Future<List> updateCollaborationActivationStatus(
          {required bool shouldActivate}) async =>
      queries.updateActivityStatus(
        newActivityStatus: shouldActivate,
      );
}

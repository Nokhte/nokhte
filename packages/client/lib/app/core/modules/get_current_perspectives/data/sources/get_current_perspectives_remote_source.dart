import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/individual_sessions.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:record/record.dart';

abstract class GetCurrentPerspectivesRemoteSource {
  Future<List> getCurrentPerspectives();
}

class GetCurrentPerspectivesRemoteSourceImpl
    implements GetCurrentPerspectivesRemoteSource {
  final SupabaseClient supabase;
  final P2PPerspectivesTrackingQueries perpsectivesQueries;
  final IndividualSessionsQueries sessionQueries;
  final PerspectivesAudioStorageQueries storageQueries;
  final record = AudioRecorder();

  GetCurrentPerspectivesRemoteSourceImpl({
    required this.supabase,
  })  : perpsectivesQueries =
            P2PPerspectivesTrackingQueries(supabase: supabase),
        sessionQueries = IndividualSessionsQueries(supabase: supabase),
        storageQueries = PerspectivesAudioStorageQueries(supabase: supabase);

  @override
  Future<List> getCurrentPerspectives() async => [
        await perpsectivesQueries.selectPerspectivesRow(),
        perpsectivesQueries.collaboratorInfo.theUsersUID,
      ];
}

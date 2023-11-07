import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/domain/logic/upload_individual_perspectives_audio.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/individual_sessions.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IndividualSessionRemoteSource {
  Future<List> getCurrentPerspectives();
  Future<List> createIndividualSession();
  Future<List> updateSessionMetadata(UpdateSessionMetadataParams params);
  Future<void> uploadIndividualPerspectivesAudio(
      UploadIndividualPerspectivesAudioParams params);
}

class IndividualSessionRemoteSourceImpl
    implements IndividualSessionRemoteSource {
  final SupabaseClient supabase;
  final P2PPerspectivesTrackingQueries perpsectivesQueries;
  final IndividualSessionsQueries sessionQueries;
  final PerspectivesAudioStorageQueries storageQueries;

  IndividualSessionRemoteSourceImpl({
    required this.supabase,
  })  : perpsectivesQueries =
            P2PPerspectivesTrackingQueries(supabase: supabase),
        sessionQueries = IndividualSessionsQueries(supabase: supabase),
        storageQueries = PerspectivesAudioStorageQueries(supabase: supabase);

  @override
  Future<List> getCurrentPerspectives() async =>
      await perpsectivesQueries.selectPerspectivesRow();

  @override
  Future<List> createIndividualSession() async =>
      await sessionQueries.createNewSession();

  @override
  Future<List> updateSessionMetadata(
          UpdateSessionMetadataParams params) async =>
      await sessionQueries.updateSessionMetadata(newMetadata: params);

  @override
  Future<void> uploadIndividualPerspectivesAudio(
          UploadIndividualPerspectivesAudioParams params) async =>
      storageQueries.uploadPerspective(params.clipData);
}

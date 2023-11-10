import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollectiveSessionRemoteSource {
  Future<void> moveIndividualPerspectivesAudioToCollectiveSpace(
      CollectiveSessionAudioExtrapolationInfo params);
}

class CollectiveSessionRemoteSourceImpl
    implements CollectiveSessionRemoteSource {
  final SupabaseClient supabase;
  final PerspectivesAudioStorageQueries storageQueries;
  CollectiveSessionRemoteSourceImpl({required this.supabase})
      : storageQueries = PerspectivesAudioStorageQueries(supabase: supabase);

  @override
  Future<void> moveIndividualPerspectivesAudioToCollectiveSpace(
          CollectiveSessionAudioExtrapolationInfo params) async =>
      await storageQueries.moveToCollectiveSpace(params);
}

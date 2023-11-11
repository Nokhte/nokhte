import 'dart:io';

import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte_backend/collective_sessions.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollectiveSessionRemoteSource {
  Future<void> moveIndividualPerspectivesAudioToCollectiveSpace(
      CollectiveSessionAudioExtrapolationInfo params);
  Future<void> downloadTheCollaboratorsPerspectivesClips(
      CollectiveSessionAudioExtrapolationInfo params);
  Future<List> getCollaboratorIndividualSessionMetadata(NoParams params);
}

class CollectiveSessionRemoteSourceImpl
    implements CollectiveSessionRemoteSource {
  final SupabaseClient supabase;
  final PerspectivesAudioStorageQueries storageQueries;
  final CollectiveSessionQueries collectiveQueries;
  CollectiveSessionRemoteSourceImpl({required this.supabase})
      : storageQueries = PerspectivesAudioStorageQueries(supabase: supabase),
        collectiveQueries = CollectiveSessionQueries(supabase: supabase);

  @override
  Future<void> moveIndividualPerspectivesAudioToCollectiveSpace(
          CollectiveSessionAudioExtrapolationInfo params) async =>
      await storageQueries.moveToCollectiveSpace(params);

  @override
  Future<void> downloadTheCollaboratorsPerspectivesClips(
      CollectiveSessionAudioExtrapolationInfo params) async {
    final pathsAndBytes =
        await storageQueries.downloadTheCollaboratorsAudioClips(params);
    for (final pathAndBytes in pathsAndBytes) {
      final file =
          File("${(await getTemporaryDirectory()).path}/${pathAndBytes.path}");
      file.writeAsBytes(pathAndBytes.rawBytes);
    }
  }

  @override
  Future<List> getCollaboratorIndividualSessionMetadata(NoParams params) async {
    final res = await collectiveQueries.getCollaboratorsSessionMetadata();
    return [collectiveQueries, res];
  }

  // Future
}

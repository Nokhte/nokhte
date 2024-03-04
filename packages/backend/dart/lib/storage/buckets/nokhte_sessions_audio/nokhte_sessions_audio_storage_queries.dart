// ignore_for_file: constant_identifier_names
import 'package:nokhte_backend/storage/buckets/shared/path_and_bytes.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/finished_nokhte_sessions/queries.dart';
import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'types/types.dart';
import 'constants/constants.dart';
import "../shared/shared.dart";
export "../shared/shared.dart";

class NokhteSessionsAudioStorageQueries with NokhteSessionsAudioConstants {
  final IrlActiveNokhteSessionQueries activeQueries;
  final FinishedNokhteSessionQueries finishedQueries;
  final SupabaseClient supabase;
  NokhteSessionsAudioStorageQueries({
    required this.supabase,
  })  : activeQueries = IrlActiveNokhteSessionQueries(supabase: supabase),
        finishedQueries = FinishedNokhteSessionQueries(supabase: supabase) {
    supabase.storage.setAuth(supabase.auth.currentSession?.accessToken ?? '');
  }

  upload(UploadNokhteSessionAudioParams params) async {
    await activeQueries.addNewAudioClipToSessionMetadata(params.audioID);
    final path = await activeQueries.composePath(params.audioID);
    await supabase.storage.from(BUCKET).upload(path, params.file);
  }

  Future<List<PathAndBytes>> download({
    required String collaboratorUID,
    required int sessionIndex,
  }) async {
    final List<PathAndBytes> returnList = [];
    final audioPaths = await finishedQueries.getAudioPathsFromSession(
      collaboratorUID,
      sessionIndex,
    );
    for (final path in audioPaths) {
      final rawBytes = await supabase.storage.from(BUCKET).download(path);
      final pathAndFile = PathAndBytes(path: path, rawBytes: rawBytes);
      returnList.add(pathAndFile);
    }
    return returnList;
  }

  nuke({required String collaboratorUID}) async {
    final audioPaths = await finishedQueries.getAudioPathsFromSession(
      collaboratorUID,
      0,
    );
    for (final path in audioPaths) {
      await supabase.storage.from(BUCKET).remove([path]);
    }
  }
}

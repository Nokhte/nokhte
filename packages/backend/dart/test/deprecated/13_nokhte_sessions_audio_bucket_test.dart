// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/storage/buckets/nokhte_sessions_audio/nokhte_sessions_audio_storage_queries.dart';
import 'package:nokhte_backend/storage/buckets/nokhte_sessions_audio/types/types.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/finished_nokhte_sessions/queries.dart';
import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import '../shared/common_collaborative_test_functions.dart';

void main() {
  late NokhteSessionsAudioStorageQueries user1Storage;
  late FinishedNokhteSessionQueries user1FinishedQueries;
  late ActiveNokhteSessionQueries user1ActiveQueries;
  final tSetup = CommonCollaborativeTestFunctions();
  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1Storage = NokhteSessionsAudioStorageQueries(
      supabase: tSetup.user1Supabase,
    );
    user1FinishedQueries = FinishedNokhteSessionQueries(
      supabase: tSetup.user1Supabase,
    );
    user1ActiveQueries = ActiveNokhteSessionQueries(
      supabase: tSetup.user1Supabase,
    );
  });

  tearDownAll(() async {
    final tableNames = ["finished_nokhte_sessions", "active_nokhte_sessions"];
    await user1Storage.nuke(collaboratorUID: tSetup.secondUserUID);
    for (var table in tableNames) {
      await tSetup.supabaseAdmin.from(table).delete().eq(
            FinishedNokhteSessionQueries.COLLABORATOR_UIDS,
            [tSetup.firstUserUID, tSetup.secondUserUID]..sort(),
          );
    }
  });

  test("upload", () async {
    final sorted = [tSetup.firstUserUID, tSetup.secondUserUID]..sort();
    await tSetup.supabaseAdmin.from("active_nokhte_sessions").insert(
        {"collaborator_uids": sorted, "meeting_uid": tSetup.firstUserUID});
    final timeStamp = await user1ActiveQueries.getCreatedAt();
    await user1FinishedQueries.insert(
      collaboratorUIDs: sorted,
      sessionMetadata: [
        {"audioID": "s1t1", "content": "s1t1"},
      ],
      sessionTimestamp: timeStamp,
    );
    final file = File('${Directory.current.path}/test/assets/star_wars.wav');
    await user1Storage
        .upload(UploadNokhteSessionAudioParams(audioID: 's1t1', file: file));
    final url = await user1Storage.supabase.storage
        .from(user1Storage.BUCKET)
        .createSignedUrl('/${sorted.join('_')}/$timeStamp/s1t1.wav', 3600);
    expect(url, isNotEmpty);
  });

  test("download", () async {
    final res = await user1Storage.download(
        collaboratorUID: tSetup.secondUserUID, sessionIndex: 0);
    expect(res, isNotEmpty);
  });
}

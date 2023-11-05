// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:nokhte_backend/tables/real_time_disabled/individual_sessions/queries.dart';

import 'shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late IndividualSessionsQueries user1Queries;
  late PerspectivesAudioStorageQueries user1StorageQueries;
  final now = DateTime.now();
  // late CollectiveS
  final PerspectiveMetadata perspectiveMetadata = PerspectiveMetadata(
    numberOfFiles: 1,
    thePerspective: tSetup.tPerspectives[0],
  );
  final tMetadata = IndividualSessionMetadata(perspectivesMetadata: [
    perspectiveMetadata,
  ]);
  final tAudioClipData = IndividualSessionAudioClip(
    thePerspectivesIndex: 0,
    isOverwritingAnotherFile: true,
    thePerspective: tSetup.tPerspectives[0],
    theRecordingNumber: 1,
    theSessionTimestamp: now,
    thePerspectivesTimestamp: now,
    theFile: File(
        '/Users/sonny/Desktop/kode/nokhte/packages/backend/dart/test/assets/star_wars.wav'),
  );
  final CollectiveSessionAudioExtrapolationInfo tExtrapolationInfo =
      CollectiveSessionAudioExtrapolationInfo(
    collectiveSessionTimestamp: now,
    perspectivesCommitTimestamp: now,
    individualSessionMetadata: {
      "metadata": [
        {
          "thePerspective": tSetup.tPerspectives[0],
          "numberOfFiles": 1,
        }
      ]
    },
    individualSessionTimestamp: now,
  );

  setUpAll(() async {
    await tSetup.setUp(shouldSetupPerspectives: true);
    user1Queries = IndividualSessionsQueries(supabase: tSetup.user1Supabase);
    user1StorageQueries =
        PerspectivesAudioStorageQueries(supabase: tSetup.user1Supabase);
    // adminQueries = IndividualSessionsQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    await tSetup.tearDownAll(shouldTearDownPerspectives: true);
  });

  test("should be able to upload a doc & do all the stuff they need to do",
      () async {
    await user1Queries.createNewSession();
    await user1Queries.updateSessionMetadata(
      newMetadata: tMetadata.toJson(),
    );
    await user1StorageQueries.uploadPerspective(tAudioClipData);
    await user1StorageQueries.moveToCollectiveSpace(tExtrapolationInfo);
  });
}

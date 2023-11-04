// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/individual_sessions_storage.dart';
import 'package:nokhte_backend/storage/types/types.dart';
import 'package:nokhte_backend/tables/real_time_disabled/individual_sessions/queries.dart';

import 'shared/shared.dart';

void main() {
  final tSetup = CommonCollaborativeTestFunctions();
  late IndividualSessionsQueries user1Queries;
  late IndividualSessionsStorageQueries user1StorageQueries;
  // late IndividualSessionsQueries adminQueries;
  final PerspectiveMetadata perspectiveMetadata = PerspectiveMetadata(
    numberOfFiles: 1,
    thePerspective: tSetup.tPerspectives[0],
  );
  final tMetadata = IndividualSessionMetadata(perspectivesMetadata: [
    perspectiveMetadata,
  ]);
  final tAudioClipData = IndividualSessionAudioClip(
    isOverwritingAnotherFile: false,
    thePerspective: tSetup.tPerspectives[0],
    theRecordingNumber: 1,
    theSessionTimestamp: DateTime.now(),
    thePerspectivesTimestamp: DateTime.now(),
    theFile: File(
        '/Users/sonny/Desktop/kode/nokhte/packages/backend/dart/test/assets/star_wars.wav'),
  );

  setUpAll(() async {
    await tSetup.setUp(shouldSetupPerspectives: true);
    user1Queries = IndividualSessionsQueries(supabase: tSetup.user1Supabase);
    user1StorageQueries =
        IndividualSessionsStorageQueries(supabase: tSetup.user1Supabase);
    // adminQueries = IndividualSessionsQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    await tSetup.tearDownAll(shouldTearDownPerspectives: true);
  });

  test("should be able to upload a doc & do all the stuff they need to do",
      () async {
    // print("");
    // print("${currentDirectory}");
    // print("${tAudioClipData.uri}");
    await user1Queries.createNewSession();
    await user1Queries.updateSessionMetadata(
      newMetadata: tMetadata.toJson(),
    );
    await user1StorageQueries.uploadPerspective(tAudioClipData);
    // that's great we kinda knew it would fail b/c like rls NEVER works
    // on the first go aorund we just need ot figure out where it's going pad
  });
}

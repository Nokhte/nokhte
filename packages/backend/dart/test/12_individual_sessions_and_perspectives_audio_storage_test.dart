// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/storage/buckets/utilities/storage_utilities.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:nokhte_backend/tables/real_time_disabled/individual_sessions/queries.dart';

import 'constants/individual_and_collective_session_fixtures.dart';
import 'shared/shared.dart';

void main() {
  late IndividualSessionsQueries user1Queries;
  late IndividualSessionsQueries user2Queries;
  late PerspectivesAudioStorageQueries user1StorageQueries;
  late PerspectivesAudioStorageQueries user2StorageQueries;
  late IndividualSessionsQueries adminQueries;

  final tSetup = CommonCollaborativeTestFunctions();
  final now = DateTime.now();
  final extrapolationInfo =
      IndividualAndCollectiveSessionFixtures.getTestExtrapolationInfo(
    tSetup,
    now,
  );
  final tAudioClipData =
      IndividualAndCollectiveSessionFixtures.getTestAudioClipData(
    tSetup,
    now,
  );

  setUpAll(() async {
    await tSetup.setUp(shouldSetupPerspectives: true);
    user1Queries = IndividualSessionsQueries(supabase: tSetup.user1Supabase);
    user2Queries = IndividualSessionsQueries(supabase: tSetup.user2Supabase);

    user1StorageQueries =
        PerspectivesAudioStorageQueries(supabase: tSetup.user1Supabase);
    user2StorageQueries =
        PerspectivesAudioStorageQueries(supabase: tSetup.user2Supabase);

    adminQueries = IndividualSessionsQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    adminQueries.currentUserUID = tSetup.firstUserUID;
    await tSetup.tearDownAll(shouldTearDownPerspectives: true);
    await user1StorageQueries.emptyTheBucket(extrapolationInfo);
    await user2StorageQueries.emptyTheBucket(extrapolationInfo);
    await adminQueries.deleteTheRow();
    adminQueries.currentUserUID = tSetup.secondUserUID;
    await adminQueries.deleteTheRow();
  });

  test("user 1 & 2 individual Session Stuff", () async {
    // arrange i
    await user1Queries.createNewSession();
    await user2Queries.createNewSession();
    // act i
    await user1Queries.updateSessionMetadata(
      newMetadata:
          IndividualAndCollectiveSessionFixtures.getTestMetadata(tSetup)
              .toJson(),
    );
    await user2Queries.updateSessionMetadata(
      newMetadata:
          IndividualAndCollectiveSessionFixtures.getTestMetadata(tSetup)
              .toJson(),
    );
    await user1StorageQueries.uploadPerspective(tAudioClipData);
    await user2StorageQueries.uploadPerspective(tAudioClipData);
    final userPath = StorageUtilities.getPersonalPerspectivesPath(
      collaboratorInfo: user1Queries.collaboratorInfo,
      audioClipData: tAudioClipData,
      excludeFile: true,
    );

    final res =
        await user1Queries.supabase.storage.from('perspectives_audio').list(
              path: userPath,
            );
    // assert i
    expect(res[0].name, "${user1Queries.collaboratorInfo.theUsersUID}_one.wav");
    //arrange i
    final collaboratorPath = StorageUtilities.getCollectiveSessionPaths(
      extrapolationInfo: extrapolationInfo,
      collaboratorInfo: user1Queries.collaboratorInfo,
      excludeFile: true,
    )[0]
        .endPath;
    // // act i
    await user1StorageQueries.moveToCollectiveSpace(extrapolationInfo);
    await user2StorageQueries.moveToCollectiveSpace(extrapolationInfo);
    final res2 =
        await user1Queries.supabase.storage.from('perspectives_audio').list(
              path: collaboratorPath,
            );
    // assert i
    expect(
        res2[0].name, "${user1Queries.collaboratorInfo.theUsersUID}_one.wav");
    // arrange ii
    final res3 = await user1StorageQueries
        .getTheCollaboratorsAudioClipLinks(extrapolationInfo);
    expect(res3, isNotEmpty);
  });
}

// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/storage/buckets/utilities/storage_utilities.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:nokhte_backend/tables/real_time_disabled/individual_sessions/queries.dart';

import 'constants/individual_and_collective_session_fixtures.dart';
import 'shared/shared.dart';

void main() {
  late IndividualSessionsQueries user1Queries;
  late PerspectivesAudioStorageQueries user1StorageQueries;
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

    user1StorageQueries =
        PerspectivesAudioStorageQueries(supabase: tSetup.user1Supabase);
    adminQueries = IndividualSessionsQueries(supabase: tSetup.supabaseAdmin);
  });

  tearDownAll(() async {
    adminQueries.currentUserUID = tSetup.firstUserUID;
    await tSetup.tearDownAll(shouldTearDownPerspectives: true);
    await user1StorageQueries.emptyTheBucket(extrapolationInfo);
    await adminQueries.deleteTheRow();
  });

  test("should be able to upload a doc & do all the stuff they need to do",
      () async {
    // arrange i
    await user1Queries.createNewSession();
    // act i
    final qRes = await user1Queries.updateSessionMetadata(
      newMetadata:
          IndividualAndCollectiveSessionFixtures.getTestMetadata(tSetup)
              .toJson(),
    );
    print("qRes $qRes");
    await user1StorageQueries.uploadPerspective(tAudioClipData);
    final userPath = StorageUtilities.getPersonalPerspectivesPath(
      collaboratorInfo: user1Queries.collaboratorInfo,
      audioClipData: tAudioClipData,
      excludeFile: true,
    );
    final collaboratorPath = StorageUtilities.getCollectiveSessionPaths(
      extrapolationInfo: extrapolationInfo,
      collaboratorInfo: user1Queries.collaboratorInfo,
      excludeFile: true,
    )[0]
        .endPath;
    final res =
        await user1Queries.supabase.storage.from('perspectives_audio').list(
              path: userPath,
            );
    // assert i
    expect(res[0].name, "${user1Queries.collaboratorInfo.theUsersUID}_one.wav");
    // act ii
    await user1StorageQueries.moveToCollectiveSpace(extrapolationInfo);
    final res2 =
        await user1Queries.supabase.storage.from('perspectives_audio').list(
              path: collaboratorPath,
            );
    // assert ii
    expect(
        res2[0].name, "${user1Queries.collaboratorInfo.theUsersUID}_one.wav");

    // right we're messing the colaborative_session queries & we're missing the
    // individual session confirm queries
  });
}

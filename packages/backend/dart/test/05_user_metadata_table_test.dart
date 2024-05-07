// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/edge_functions/consume_trial_session.dart';
import 'package:nokhte_backend/tables/user_metadata.dart';

import 'shared/shared.dart';

void main() {
  late UserMetadataQueries user1Queries;
  late ConsumeTrialSession consumeTrialSession;
  final tSetup = CommonCollaborativeTestFunctions();

  setUp(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1Queries = UserMetadataQueries(supabase: tSetup.user1Supabase);
    consumeTrialSession = ConsumeTrialSession(supabase: tSetup.user1Supabase);
  });

  test("insertDefaultMetadata", () async {
    final res = await user1Queries.insertDefaultMetadata();
    expect(res.first['uid'], tSetup.firstUserUID);
    expect(res.first['has_used_trial'], false);
  });

  test("getUserMetadata", () async {
    final res = await user1Queries.getUserMetadata();
    expect(res.first['uid'], tSetup.firstUserUID);
    expect(res.first['has_used_trial'], false);
  });

  test("consume-trial-session", () async {
    final consumeRes = await consumeTrialSession.invoke();
    expect(consumeRes.status, 200);
    final metadataRes = await user1Queries.getUserMetadata();
    expect(metadataRes.first['uid'], tSetup.firstUserUID);
    expect(metadataRes.first['has_used_trial'], true);
  });
}

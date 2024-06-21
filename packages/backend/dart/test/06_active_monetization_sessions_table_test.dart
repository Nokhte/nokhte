// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';
import 'package:nokhte_backend/tables/active_monetization_sessions.dart';

import 'shared/shared.dart';

void main() {
  late ActiveMonetizationSessionQueries user1Queries;
  final tSetup = CommonCollaborativeTestFunctions();
  late CompanyPresetsQueries presetQueries;
  late List<String> sortedUIDs = [];

  setUpAll(() async {
    await tSetup.setUp();
    sortedUIDs = [tSetup.firstUserUID, tSetup.secondUserUID];
    user1Queries =
        ActiveMonetizationSessionQueries(supabase: tSetup.user1Supabase);
    presetQueries = CompanyPresetsQueries(supabase: tSetup.user1Supabase);
  });

  tearDownAll(() async {
    await tSetup.supabaseAdmin
        .from('st_active_nokhte_sessions')
        .delete()
        .contains("collaborator_uids", "{${tSetup.firstUserUID}}");
  });

  test("startSession", () async {
    final consultativeUID =
        await presetQueries.getUnifiedUID(PresetTypes.consultative);
    await tSetup.supabaseAdmin.from("st_active_nokhte_sessions").insert({
      "collaborator_uids": sortedUIDs,
      "is_whitelisted": false,
      "leader_uid": tSetup.firstUserUID,
      "has_premium_access": [false, false],
      "should_skip_instructions": [false, false],
      "preset_uid": consultativeUID,
    });

    final res = await user1Queries.startSession();
    print("test res $res");
    expect(res.first["collaborator_uids"], sortedUIDs);
    expect(res.first["have_finished_explanations"], [false, false]);
  });

  test("updateHasFinishedExplanation", () async {
    final arr = [true, true];
    arr.contains(true);
    final res = await user1Queries.updateHasFinishedExplanation();
    expect(res.first["have_finished_explanations"], [true, false]);
  });

  test("deleteSession", () async {
    await user1Queries.deleteSession();
    final res = await user1Queries.select();
    expect(res.isEmpty, true);
  });
}

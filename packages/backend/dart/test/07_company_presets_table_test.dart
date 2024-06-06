// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/preset_types.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';

import 'shared/shared.dart';

void main() {
  late CompanyPresetsQueries user1Queries;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp(shouldMakeCollaboration: false);
    user1Queries = CompanyPresetsQueries(supabase: tSetup.user1Supabase);
  });

  test("select: PresetTypes.consultative", () async {
    final res = await user1Queries.select(type: PresetTypes.consultative);
    expect(res.first[CompanyPresetsQueries.TALKING_RATIO], 1);
    expect(res.first[CompanyPresetsQueries.GROUP_HYBRID_RATIO], .5);
    expect(res.first[CompanyPresetsQueries.SOLO_HYBRID_RATIO], 0);
    expect(res.first[CompanyPresetsQueries.NOTES_RATIO], 1);
    expect(
      res.first[CompanyPresetsQueries.NAME],
      CompanyPresetsQueries.mapTypeToPresetType(PresetTypes.consultative),
    );
    expect(res.first[CompanyPresetsQueries.UNIFIED_PRESETS], isNotEmpty);
  });

  test("getUnifiedUID: PresetTypes.consultative", () async {
    final res = await user1Queries.getUnifiedUID(PresetTypes.consultative);
    expect(res, isNotEmpty);
  });

  test("select: PresetTypes.collaborative", () async {
    final res = await user1Queries.select(type: PresetTypes.collaborative);
    expect(res.first[CompanyPresetsQueries.TALKING_RATIO], 0);
    expect(res.first[CompanyPresetsQueries.GROUP_HYBRID_RATIO], 0);
    expect(res.first[CompanyPresetsQueries.SOLO_HYBRID_RATIO], 1);
    expect(res.first[CompanyPresetsQueries.NOTES_RATIO], 0);
    expect(
      res.first[CompanyPresetsQueries.NAME],
      CompanyPresetsQueries.mapTypeToPresetType(PresetTypes.collaborative),
    );
    expect(res.first[CompanyPresetsQueries.UNIFIED_PRESETS], isNotEmpty);
  });

  test("getUnifiedUID: PresetTypes.collaborative", () async {
    final res = await user1Queries.getUnifiedUID(PresetTypes.collaborative);
    expect(res, isNotEmpty);
  });

  test("select: PresetTypes.socratic", () async {
    final res = await user1Queries.select(type: PresetTypes.socratic);
    expect(res.first[CompanyPresetsQueries.TALKING_RATIO], 1);
    expect(res.first[CompanyPresetsQueries.GROUP_HYBRID_RATIO], 0);
    expect(res.first[CompanyPresetsQueries.SOLO_HYBRID_RATIO], 0);
    expect(res.first[CompanyPresetsQueries.NOTES_RATIO], 0);
    expect(
      res.first[CompanyPresetsQueries.NAME],
      CompanyPresetsQueries.mapTypeToPresetType(PresetTypes.socratic),
    );
    expect(res.first[CompanyPresetsQueries.UNIFIED_PRESETS], isNotEmpty);
  });

  test("getUnifiedUID: PresetTypes.socratic", () async {
    final res = await user1Queries.getUnifiedUID(PresetTypes.socratic);
    expect(res, isNotEmpty);
  });
}

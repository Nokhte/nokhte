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
    expect(res.first[CompanyPresetsQueries.EVEN_CONFIGURATION],
        ['speaking', 'notes']);
    expect(res.first[CompanyPresetsQueries.ODD_CONFIGURATION],
        ['group_hybrid', 'speaking', 'notes']);
    expect(res.first[CompanyPresetsQueries.TAGS],
        ['hold_to_speak', 'strict_seating', 'notes_during']);
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
    expect(
        res.first[CompanyPresetsQueries.EVEN_CONFIGURATION], ['solo_hybrid']);
    expect(res.first[CompanyPresetsQueries.ODD_CONFIGURATION], ['solo_hybrid']);
    expect(res.first[CompanyPresetsQueries.TAGS],
        ['tap_to_speak', 'flexible_seating', 'notes_during']);
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
    expect(res.first[CompanyPresetsQueries.EVEN_CONFIGURATION], ['speaking']);
    expect(res.first[CompanyPresetsQueries.ODD_CONFIGURATION], ['speaking']);
    expect(res.first[CompanyPresetsQueries.TAGS],
        ['hold_to_speak', 'strict_seating', 'notes_after']);
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

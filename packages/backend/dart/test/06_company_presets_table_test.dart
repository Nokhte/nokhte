// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';

import 'shared/shared.dart';

void main() {
  late CompanyPresetsQueries user1Queries;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp();
    user1Queries = CompanyPresetsQueries(supabase: tSetup.user1Supabase);
  });

  const consultativeTags = ['hold_to_speak', 'strict_seating', 'notes_during'];
  const collaborativeTags = [
    'tap_to_speak',
    'flexible_seating',
    'notes_during'
  ];
  const socraticTags = ['hold_to_speak', 'strict_seating', 'notes_after'];

  test("select: PresetTypes.consultative", () async {
    final res = await user1Queries.select(type: PresetTypes.consultative);
    expect(
        res.first[CompanyPresetsQueries.EVEN_CONFIGURATION], ['group_hybrid']);
    expect(
        res.first[CompanyPresetsQueries.ODD_CONFIGURATION], ['group_hybrid']);
    expect(res.first[CompanyPresetsQueries.TAGS], consultativeTags);
    expect(
      res.first[CompanyPresetsQueries.NAME],
      CompanyPresetsQueries.mapTypeToPresetType(PresetTypes.consultative),
    );
  });

  test("select: PresetTypes.collaborative", () async {
    final res = await user1Queries.select(type: PresetTypes.collaborative);
    expect(
        res.first[CompanyPresetsQueries.EVEN_CONFIGURATION], ['solo_hybrid']);
    expect(res.first[CompanyPresetsQueries.ODD_CONFIGURATION], ['solo_hybrid']);
    expect(res.first[CompanyPresetsQueries.TAGS], collaborativeTags);
    expect(
      res.first[CompanyPresetsQueries.NAME],
      CompanyPresetsQueries.mapTypeToPresetType(PresetTypes.collaborative),
    );
  });

  test("select: PresetTypes.socratic", () async {
    final res = await user1Queries.select(type: PresetTypes.socratic);
    expect(res.first[CompanyPresetsQueries.EVEN_CONFIGURATION], ['speaking']);
    expect(res.first[CompanyPresetsQueries.ODD_CONFIGURATION], ['speaking']);
    expect(res.first[CompanyPresetsQueries.TAGS], socraticTags);
    expect(
      res.first[CompanyPresetsQueries.NAME],
      CompanyPresetsQueries.mapTypeToPresetType(PresetTypes.socratic),
    );
  });
}

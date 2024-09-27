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
    expect(res.first[CompanyPresetsQueries.TAGS], collaborativeTags);
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
    expect(res.first[CompanyPresetsQueries.TAGS], socraticTags);
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

  test("getTagsFromUnifiedUID: PresetTypes.socratic", () async {
    const socraticTags = [
      SessionTags.holdToSpeak,
      SessionTags.strictSeating,
      SessionTags.notesAfter,
    ];
    final uid = await user1Queries.getUnifiedUID(PresetTypes.socratic);
    final res = await user1Queries.getTagsFromUnifiedUID(uid);
    expect(res, socraticTags);
  });

  test("getTagsFromUnifiedUID: PresetTypes.consultative", () async {
    const consultativeTags = [
      SessionTags.holdToSpeak,
      SessionTags.strictSeating,
      SessionTags.notesDuring,
    ];
    final uid = await user1Queries.getUnifiedUID(PresetTypes.consultative);
    final res = await user1Queries.getTagsFromUnifiedUID(uid);
    expect(res, consultativeTags);
  });

  test("getTagsFromUnifiedUID: PresetTypes.collaborative", () async {
    const collaborativeTags = [
      SessionTags.tapToSpeak,
      SessionTags.flexibleSeating,
      SessionTags.notesDuring
    ];
    final uid = await user1Queries.getUnifiedUID(PresetTypes.collaborative);
    final res = await user1Queries.getTagsFromUnifiedUID(uid);
    expect(res, collaborativeTags);
  });
}

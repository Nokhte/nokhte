// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CompanyPresetsPreferencesQueries {
  static const TABLE = 'company_presets_preferences';
  static const UID = 'uid';
  static const OWNER_UID = 'owner_uid';
  static const COMPANY_PRESET = 'company_preset';
  static const TAGS = 'tags';

  final SupabaseClient supabase;
  final CompanyPresetsQueries companyPresets;

  CompanyPresetsPreferencesQueries({
    required this.supabase,
  }) : companyPresets = CompanyPresetsQueries(supabase: supabase);

  Future<List> insert({
    PresetTypes type = PresetTypes.solo,
  }) async {
    final companyPresetUID = (await companyPresets.select(
      type: type,
    ))
        .first[CompanyPresetsQueries.UID];
    final othertags = mapTypeToPresetType(type);
    if (othertags.isNotEmpty) {
      return await supabase.from(TABLE).insert({
        COMPANY_PRESET: companyPresetUID,
        'chosen_tags': othertags,
      }).select();
    } else {
      return [];
    }
  }

  Future<List> upsert({
    PresetTypes type = PresetTypes.solo,
    List<SessionTags> newTags = const [],
  }) async {
    final companyPresetUID = (await companyPresets.select(
      type: type,
    ))
        .first[CompanyPresetsQueries.UID];
    final checkRes = await supabase
        .from(TABLE)
        .select()
        .eq(COMPANY_PRESET, companyPresetUID);
    if (checkRes.isEmpty) {
      return await insert(
        type: type,
      );
    } else {
      if (newTags.isNotEmpty) {
        return await update(type: type, newTags: newTags);
      } else {
        return [];
      }
    }
  }

  Future<List> update({
    PresetTypes type = PresetTypes.solo,
    required List<SessionTags> newTags,
  }) async {
    final companyPresetUID =
        (await companyPresets.select()).first[CompanyPresetsQueries.UID];
    final tags = CompanyPresetsQueries.mapEnumsToTags(newTags);
    if (tags.isNotEmpty) {
      return await supabase
          .from(TABLE)
          .update({
            TAGS: tags,
          })
          .eq(COMPANY_PRESET, companyPresetUID)
          .select();
    } else {
      return [];
    }
  }

  static List<String> mapTypeToPresetType(PresetTypes type) {
    if (type == PresetTypes.solo) {
      return CompanyPresetsQueries.mapEnumsToTags([
        SessionTags.tapToSpeak,
        SessionTags.noSeating,
        SessionTags.deactivatedNotes,
      ]);
    } else {
      return CompanyPresetsQueries.mapEnumsToTags([]);
    }
  }
}
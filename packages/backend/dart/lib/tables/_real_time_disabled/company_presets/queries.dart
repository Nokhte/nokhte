// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';
import 'preset_types.dart';
import 'session_tags.dart';

class CompanyPresetsQueries {
  static const TABLE = 'company_presets';
  static const UID = 'uid';
  static const EVEN_CONFIGURATION = 'even_configuration';
  static const ODD_CONFIGURATION = 'odd_configuration';
  static const TAGS = 'tags';
  static const NAME = 'name';
  static const UNIFIED_PRESETS = 'unified_presets';

  final SupabaseClient supabase;

  CompanyPresetsQueries({
    required this.supabase,
  });

  Future<List> select({
    PresetTypes type = PresetTypes.none,
  }) async {
    final name = mapTypeToPresetType(type);
    if (name.isEmpty) {
      return await supabase.from(TABLE).select('*, $UNIFIED_PRESETS(*)');
    } else {
      return await supabase
          .from(TABLE)
          .select('*, $UNIFIED_PRESETS($UID)')
          .eq(NAME, name);
    }
  }

  Future<String> getUnifiedUID(PresetTypes type) async {
    final res = await select(type: type);
    if (res.isNotEmpty) {
      return res.first[UNIFIED_PRESETS].first[UID];
    } else {
      return '';
    }
  }

  Future<List<SessionTags>> getTagsFromUnifiedUID(String unifiedUID) async {
    final res = await supabase
        .from(UNIFIED_PRESETS)
        .select('*, $TABLE($TAGS)')
        .eq(UID, unifiedUID);
    if (res.isNotEmpty) {
      return mapTagsToEnum(res.first[TABLE][TAGS]);
    } else {
      return [];
    }
  }

  static List<SessionTags> mapTagsToEnum(List tags) =>
      tags.map((e) => mapTagToEnum(e)).toList();

  static SessionTags mapTagToEnum(String tag) {
    if (tag == 'strict_seating') {
      return SessionTags.strictSeating;
    } else if (tag == 'flexible_seating') {
      return SessionTags.flexibleSeating;
    } else if (tag == 'tap_to_speak') {
      return SessionTags.tapToSpeak;
    } else if (tag == 'hold_to_speak') {
      return SessionTags.holdToSpeak;
    } else if (tag == 'notes_during') {
      return SessionTags.notesDuring;
    } else if (tag == 'notes_after') {
      return SessionTags.notesAfter;
    } else {
      return SessionTags.none;
    }
  }

  static mapTypeToPresetType(PresetTypes type) {
    switch (type) {
      case PresetTypes.consultative:
        return 'Consultation';
      case PresetTypes.collaborative:
        return 'Collaboration';
      case PresetTypes.socratic:
        return 'Socratic';
      case PresetTypes.none:
        return '';
    }
  }
}

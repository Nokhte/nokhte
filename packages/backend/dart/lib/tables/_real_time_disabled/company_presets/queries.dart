// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
export 'preset_types.dart';
export 'session_tags.dart';

class CompanyPresetsQueries {
  static const TABLE = 'company_presets';
  static const UID = 'uid';
  static const EVEN_CONFIGURATION = 'even_configuration';
  static const ODD_CONFIGURATION = 'odd_configuration';
  static const TAGS = 'tags';
  static const NAME = 'name';

  final SupabaseClient supabase;

  CompanyPresetsQueries({
    required this.supabase,
  });

  Future<List> select({
    String uid = '',
    PresetTypes? type,
  }) async {
    if (uid.isEmpty) {
      return await supabase.from(TABLE).select();
    } else if (type != null) {
      final name = mapTypeToPresetType(type);
      return await supabase.from(TABLE).select().eq(NAME, name);
    } else {
      return await supabase.from(TABLE).select().eq(UID, uid);
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

// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
export 'preset_types.dart';
export 'session_tags.dart';

class CompanyPresetsQueries {
  static const TABLE = 'company_presets';
  static const UID = 'uid';
  static const PHONE_TYPE = 'phone_type';
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
    switch (tag) {
      case 'strict_seating':
        return SessionTags.strictSeating;
      case 'flexible_seating':
        return SessionTags.flexibleSeating;
      case 'no_seating':
        return SessionTags.noSeating;
      case 'hold_to_speak':
        return SessionTags.holdToSpeak;
      case 'tap_to_speak':
        return SessionTags.tapToSpeak;
      case 'mono_focal_notes':
        return SessionTags.monoFocalNotes;
      case 'multi_focal_notes':
        return SessionTags.multiFocalNotes;
      case 'deactivated_notes':
        return SessionTags.deactivatedNotes;
      default:
        return SessionTags.none;
    }
  }

  static List<String> mapEnumsToTags(List<SessionTags> tags) =>
      tags.map((e) => mapEnumToTag(e)).toList();

  static String mapEnumToTag(SessionTags tag) {
    switch (tag) {
      case SessionTags.strictSeating:
        return 'strict_seating';
      case SessionTags.flexibleSeating:
        return 'flexible_seating';
      case SessionTags.noSeating:
        return 'no_seating';
      case SessionTags.holdToSpeak:
        return 'hold_to_speak';
      case SessionTags.tapToSpeak:
        return 'tap_to_speak';
      case SessionTags.monoFocalNotes:
        return 'mono_focal_notes';
      case SessionTags.multiFocalNotes:
        return 'multi_focal_notes';
      case SessionTags.deactivatedNotes:
        return 'deactivated_notes';
      default:
        return 'none';
    }
  }

  static PresetTypes mapStringToPresetType(String type) {
    switch (type) {
      case 'Consultation':
        return PresetTypes.consultative;
      case 'Collaboration':
        return PresetTypes.collaborative;
      case 'Solo':
        return PresetTypes.solo;
      default:
        return PresetTypes.none;
    }
  }

  static mapTypeToPresetType(PresetTypes type) {
    switch (type) {
      case PresetTypes.consultative:
        return 'Consultation';
      case PresetTypes.collaborative:
        return 'Collaboration';
      case PresetTypes.solo:
        return 'Solo';
      case PresetTypes.none:
        return '';
    }
  }
}

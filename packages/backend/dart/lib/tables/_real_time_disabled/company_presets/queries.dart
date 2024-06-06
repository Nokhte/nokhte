// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';
import 'preset_types.dart';

class CompanyPresetsQueries {
  static const TABLE = 'company_presets';
  static const UID = 'uid';
  static const TALKING_RATIO = 'talking_ratio';
  static const NOTES_RATIO = 'notes_ratio';
  static const GROUP_HYBRID_RATIO = 'group_hybrid_ratio';
  static const SOLO_HYBRID_RATIO = 'solo_hybrid_ratio';
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
      return await supabase.from(TABLE).select('*, unified_presets(*)');
    } else {
      return await supabase
          .from(TABLE)
          .select('*, unified_presets(uid)')
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

  static mapTypeToPresetType(PresetTypes type) {
    switch (type) {
      case PresetTypes.consultative:
        return 'Consultative';
      case PresetTypes.collaborative:
        return 'Collaborative';
      case PresetTypes.socratic:
        return 'Socratic';
      case PresetTypes.none:
        return '';
    }
  }
}

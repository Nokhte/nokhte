// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/_real_time_disabled/company_presets_preferences/queries.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
export 'types/types.dart';
export 'utils.dart';

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
    if (uid.isEmpty && type == null) {
      return await supabase.from(TABLE).select(
            '*,${CompanyPresetsPreferencesQueries.TABLE}(*)',
          );
    } else if (type != null) {
      final name = CompanyPresetsUtils.mapTypeToPresetType(type);
      return await supabase.from(TABLE).select().eq(NAME, name);
    } else {
      return await supabase.from(TABLE).select().eq(UID, uid);
    }
  }
}

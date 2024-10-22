import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:nokhte_backend/tables/company_presets_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PresetsRemoteSource {
  Future<List> getCompanyPresets();
  Future<List> upsertSessionPreferences(UpsertSessionPreferencesParams params);
}

class PresetsRemoteSourceImpl implements PresetsRemoteSource {
  final SupabaseClient supabase;
  final CompanyPresetsQueries queries;
  final CompanyPresetsPreferencesQueries prefQueries;

  PresetsRemoteSourceImpl({required this.supabase})
      : queries = CompanyPresetsQueries(supabase: supabase),
        prefQueries = CompanyPresetsPreferencesQueries(supabase: supabase);
  @override
  Future<List> getCompanyPresets() async => await queries.select();

  @override
  upsertSessionPreferences(params) async =>
      await prefQueries.upsert(type: params.type, newTags: params.newTags);
}

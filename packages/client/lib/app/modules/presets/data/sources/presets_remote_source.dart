import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PresetsRemoteSource {
  Future<List> getCompanyPresets();
}

class PresetsRemoteSourceImpl implements PresetsRemoteSource {
  final SupabaseClient supabase;
  final CompanyPresetsQueries queries;

  PresetsRemoteSourceImpl({required this.supabase})
      : queries = CompanyPresetsQueries(supabase: supabase);
  @override
  Future<List> getCompanyPresets() async => await queries.select();
}

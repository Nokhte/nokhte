import 'package:nokhte/app/modules/presets/domain/domain.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';

class CompanyPresetsModel extends CompanyPresetsEntity {
  const CompanyPresetsModel({
    required super.unifiedUIDs,
    required super.tags,
    required super.names,
  });

  static CompanyPresetsModel fromSupabase(List presetsRes) {
    if (presetsRes.isEmpty) {
      return const CompanyPresetsModel(
        unifiedUIDs: [],
        tags: [],
        names: [],
      );
    } else {
      final List unifiedUIDs = [];
      final List tags = [];
      final List names = [];
      for (var preset in presetsRes) {
        unifiedUIDs.add(preset[CompanyPresetsQueries.UNIFIED_PRESETS]
            .first[CompanyPresetsQueries.UID]);
        tags.add(preset[CompanyPresetsQueries.TAGS]);
        names.add(preset[CompanyPresetsQueries.NAME]);
      }
      return CompanyPresetsModel(
        unifiedUIDs: unifiedUIDs,
        tags: tags,
        names: names,
      );
    }
  }
}

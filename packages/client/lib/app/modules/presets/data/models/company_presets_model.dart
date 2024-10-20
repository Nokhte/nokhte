import 'package:nokhte/app/modules/presets/domain/domain.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';

class CompanyPresetsModel extends CompanyPresetsEntity {
  const CompanyPresetsModel({
    required super.uids,
    required super.tags,
    required super.names,
  });

  static CompanyPresetsModel fromSupabase(List presetsRes) {
    if (presetsRes.isEmpty) {
      return const CompanyPresetsModel(
        uids: [],
        tags: [],
        names: [],
      );
    } else {
      final List uids = [];
      final List tags = [];
      final List names = [];
      for (var preset in presetsRes) {
        if (preset[CompanyPresetsQueries.NAME] != 'Socratic') {
          uids.add(preset[CompanyPresetsQueries.UID]);
          tags.add(preset[CompanyPresetsQueries.TAGS]);
          names.add(preset[CompanyPresetsQueries.NAME]);
        }
      }

      return CompanyPresetsModel(
        uids: uids,
        tags: tags,
        names: names,
      );
    }
  }
}

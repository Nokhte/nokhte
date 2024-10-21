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
      final List<String> uids = [];
      final List<List<SessionTags>> tags = [];
      final List<String> names = [];
      for (var preset in presetsRes) {
        uids.add(preset[CompanyPresetsQueries.UID]);
        tags.add(CompanyPresetsQueries.mapTagsToEnum(
            preset[CompanyPresetsQueries.TAGS]));
        names.add(preset[CompanyPresetsQueries.NAME]);
      }

      return CompanyPresetsModel(
        uids: uids,
        tags: tags,
        names: names,
      );
    }
  }
}

import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:nokhte_backend/tables/unified_presets.dart';

class PreferredPresetModel extends PreferredPresetEntity {
  const PreferredPresetModel({
    required super.name,
    required super.tags,
  });

  factory PreferredPresetModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const PreferredPresetModel(
        name: '',
        tags: [],
      );
    } else {
      final companyPreset =
          res.first[UnifiedPresetsConstants.TABLE][CompanyPresetsQueries.TABLE];
      return PreferredPresetModel(
        name: companyPreset[CompanyPresetsQueries.NAME],
        tags: companyPreset[CompanyPresetsQueries.TAGS],
      );
    }
  }
}
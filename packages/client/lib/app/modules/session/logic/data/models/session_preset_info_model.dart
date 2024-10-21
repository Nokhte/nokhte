import 'package:nokhte/app/modules/session/logic/domain/domain.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class SessionPresetInfoModel extends SessionPresetInfoEntity {
  const SessionPresetInfoModel({
    required super.name,
    required super.tags,
    required super.phoneType,
  });

  factory SessionPresetInfoModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const SessionPresetInfoModel(
        name: '',
        tags: [],
        phoneType: '',
      );
    } else {
      final companyPresetRes = res.first;
      return SessionPresetInfoModel(
        name: companyPresetRes[CompanyPresetsQueries.NAME],
        tags: CompanyPresetsQueries.mapTagsToEnum(
            companyPresetRes[CompanyPresetsQueries.TAGS]),
        phoneType: companyPresetRes[CompanyPresetsQueries.PHONE_TYPE],
      );
    }
  }
}

import 'package:nokhte/app/modules/session/logic/domain/domain.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class SessionPresetInfoModel extends SessionPresetInfoEntity {
  const SessionPresetInfoModel({
    required super.name,
    required super.tags,
    required super.oddConfiguration,
    required super.evenConfiguration,
  });

  factory SessionPresetInfoModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const SessionPresetInfoModel(
        name: '',
        tags: [],
        oddConfiguration: [],
        evenConfiguration: [],
      );
    } else {
      final companyPresetRes = res.first[CompanyPresetsQueries.TABLE];
      return SessionPresetInfoModel(
        name: companyPresetRes[CompanyPresetsQueries.NAME],
        tags: companyPresetRes[CompanyPresetsQueries.TAGS],
        oddConfiguration:
            companyPresetRes[CompanyPresetsQueries.ODD_CONFIGURATION],
        evenConfiguration:
            companyPresetRes[CompanyPresetsQueries.EVEN_CONFIGURATION],
      );
    }
  }
}



/// [{
/// uid: 8e562e20-e4cd-4b3b-a73c-b93bc902a340, is_company_preset: true, company_preset_id: 8e562e20-e4cd-4b3b-a73c-b93bc902a340, user_generated_preset_id: null, 
/// company_presets: {tags: [hold_to_speak, strict_seating, notes_during], 
///                   name: Consultation, even_configuration: [speaking, notes],
///  odd_configuration: [group_hybrid, speaking, notes]}}]
import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class SessionPresetInfoEntity extends Equatable {
  final String name;
  final List<SessionTags> tags;
  final String phoneType;
  const SessionPresetInfoEntity({
    required this.name,
    required this.tags,
    required this.phoneType,
  });

  @override
  List<Object> get props => [
        name,
        tags,
        phoneType,
      ];
}

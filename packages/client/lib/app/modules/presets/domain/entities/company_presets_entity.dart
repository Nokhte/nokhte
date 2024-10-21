import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class CompanyPresetsEntity extends Equatable {
  final List<String> uids;
  final List<List<SessionTags>> tags;
  final List<String> names;

  const CompanyPresetsEntity({
    required this.uids,
    required this.tags,
    required this.names,
  });

  @override
  List<Object> get props => [uids, tags, names];
}

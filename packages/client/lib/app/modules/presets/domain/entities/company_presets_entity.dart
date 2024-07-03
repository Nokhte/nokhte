import 'package:equatable/equatable.dart';

class CompanyPresetsEntity extends Equatable {
  final List unifiedUIDs;
  final List tags;
  final List names;

  const CompanyPresetsEntity({
    required this.unifiedUIDs,
    required this.tags,
    required this.names,
  });

  @override
  List<Object> get props => [unifiedUIDs, tags, names];
}

import 'package:equatable/equatable.dart';

class CompanyPresetsEntity extends Equatable {
  final List uids;
  final List tags;
  final List names;

  const CompanyPresetsEntity({
    required this.uids,
    required this.tags,
    required this.names,
  });

  @override
  List<Object> get props => [uids, tags, names];
}

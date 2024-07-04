import 'package:equatable/equatable.dart';

class SessionPresetInfoEntity extends Equatable {
  final String name;
  final List tags;
  final List oddConfiguration;
  final List evenConfiguration;
  const SessionPresetInfoEntity({
    required this.name,
    required this.tags,
    required this.oddConfiguration,
    required this.evenConfiguration,
  });

  @override
  List<Object> get props => [
        name,
        tags,
        evenConfiguration,
        oddConfiguration,
      ];
}

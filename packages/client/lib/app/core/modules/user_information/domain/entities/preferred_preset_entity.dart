import 'package:equatable/equatable.dart';

class PreferredPresetEntity extends Equatable {
  final String name;
  final List tags;
  final String unifiedUID;

  const PreferredPresetEntity({
    required this.name,
    required this.tags,
    required this.unifiedUID,
  });

  factory PreferredPresetEntity.initial() => const PreferredPresetEntity(
        name: '',
        tags: [],
        unifiedUID: '',
      );

  @override
  List<Object> get props => [name, tags];
}

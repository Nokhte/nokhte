import 'package:equatable/equatable.dart';

class PreferredPresetEntity extends Equatable {
  final String name;
  final List tags;

  const PreferredPresetEntity({
    required this.name,
    required this.tags,
  });

  factory PreferredPresetEntity.initial() => const PreferredPresetEntity(
        name: '',
        tags: [],
      );

  @override
  List<Object> get props => [name, tags];
}

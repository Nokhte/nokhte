import 'package:equatable/equatable.dart';

class PreferredPresetEntity extends Equatable {
  final String name;
  final List tags;
  final String presetUID;
  final String userUID;

  const PreferredPresetEntity({
    required this.name,
    required this.tags,
    required this.presetUID,
    required this.userUID,
  });

  factory PreferredPresetEntity.initial() => const PreferredPresetEntity(
        name: '',
        tags: [],
        presetUID: '',
        userUID: '',
      );

  @override
  List<Object> get props => [name, tags];
}

import 'package:equatable/equatable.dart';

class NokhteSessionArtifactEntity extends Equatable {
  final String title;
  final String date;
  final String sessionUID;
  final List content;
  const NokhteSessionArtifactEntity({
    required this.title,
    required this.content,
    required this.sessionUID,
    required this.date,
  });

  factory NokhteSessionArtifactEntity.initial() =>
      const NokhteSessionArtifactEntity(
        title: '',
        content: [],
        sessionUID: '',
        date: '',
      );

  @override
  List<Object?> get props => [title, content, sessionUID];
}

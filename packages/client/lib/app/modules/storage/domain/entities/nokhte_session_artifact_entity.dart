import 'package:equatable/equatable.dart';

class NokhteSessionArtifactEntity extends Equatable {
  final String title;
  final String date;
  final int id;
  final List<String> content;
  const NokhteSessionArtifactEntity({
    required this.title,
    required this.content,
    required this.id,
    required this.date,
  });
  @override
  List<Object?> get props => [title, content, id];
}

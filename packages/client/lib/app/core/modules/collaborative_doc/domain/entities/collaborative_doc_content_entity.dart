import 'package:equatable/equatable.dart';

class CollaborativeDocContentEntity extends Equatable {
  final Stream<String> docContent;

  const CollaborativeDocContentEntity({required this.docContent});

  @override
  List<Object> get props => [docContent];
}

import 'package:equatable/equatable.dart';

class CollaboratorDocInfo extends Equatable {
  final bool isPresent;
  final int delta;

  CollaboratorDocInfo({
    required this.isPresent,
    required this.delta,
  });

  @override
  List<Object> get props => [
        isPresent,
        delta,
      ];
}

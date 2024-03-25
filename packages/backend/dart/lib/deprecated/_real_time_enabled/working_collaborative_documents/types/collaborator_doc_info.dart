import 'package:equatable/equatable.dart';

class CollaboratorDocInfo extends Equatable {
  final bool isPresent;
  final int delta;

  CollaboratorDocInfo({
    required this.isPresent,
    required this.delta,
  });

  static Stream<CollaboratorDocInfo> get initialStream => Stream.value(
        CollaboratorDocInfo(
          isPresent: false,
          delta: -1,
        ),
      );

  @override
  List<Object> get props => [
        isPresent,
        delta,
      ];
}

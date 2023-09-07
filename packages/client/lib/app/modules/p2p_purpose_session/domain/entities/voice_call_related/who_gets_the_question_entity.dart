import 'package:equatable/equatable.dart';

class WhoGetsTheQuestionEntity extends Equatable {
  final bool hasIt;

  const WhoGetsTheQuestionEntity({
    required this.hasIt,
  });

  @override
  List<Object> get props => [
        hasIt,
      ];
}

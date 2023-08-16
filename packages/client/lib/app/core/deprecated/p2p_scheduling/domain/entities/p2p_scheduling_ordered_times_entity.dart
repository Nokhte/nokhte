import 'package:equatable/equatable.dart';

class P2PSchedulingOrderedTimesEntity extends Equatable {
  final List<String> orderedTimesArr;
  const P2PSchedulingOrderedTimesEntity({required this.orderedTimesArr});

  @override
  List<Object> get props => [orderedTimesArr];
}

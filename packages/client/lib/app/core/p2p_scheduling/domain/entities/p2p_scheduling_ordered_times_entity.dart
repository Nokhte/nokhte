import 'package:equatable/equatable.dart';

class P2PSchedulingOrderedTimesEntity extends Equatable {
  List<String> orderedTimesArr;
  P2PSchedulingOrderedTimesEntity({required this.orderedTimesArr});

  @override
  List<Object> get props => [orderedTimesArr];
}

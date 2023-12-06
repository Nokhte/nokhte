import 'package:equatable/equatable.dart';

class CollectivePurposeEntity extends Equatable {
  final String thePurpose;

  const CollectivePurposeEntity({
    required this.thePurpose,
  });

  @override
  List<Object> get props => [thePurpose];
}

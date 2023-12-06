import 'package:equatable/equatable.dart';

class IndividualSessionCreationEntity extends Equatable {
  final DateTime sessionTimestamp;

  const IndividualSessionCreationEntity({
    required this.sessionTimestamp,
  });

  @override
  List<Object> get props => [];
}

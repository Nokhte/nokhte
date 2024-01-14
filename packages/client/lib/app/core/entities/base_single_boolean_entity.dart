import 'package:equatable/equatable.dart';

class BaseSingleBooleanEntity extends Equatable {
  final bool isTrue;

  const BaseSingleBooleanEntity({required this.isTrue});

  @override
  List<Object?> get props => [isTrue];
}

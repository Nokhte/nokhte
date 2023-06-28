import 'package:equatable/equatable.dart';

class UsernameStatusEntity extends Equatable {
  final bool isCreated;

  const UsernameStatusEntity({required this.isCreated});

  @override
  List<Object> get props => [isCreated];
}

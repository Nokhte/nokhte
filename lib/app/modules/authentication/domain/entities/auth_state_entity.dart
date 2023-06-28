import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final Stream<bool> isAuthenticated;

  const AuthEntity({required this.isAuthenticated});

  @override
  List<Object> get props => [isAuthenticated];
}

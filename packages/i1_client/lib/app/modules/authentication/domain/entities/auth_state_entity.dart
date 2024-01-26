import 'package:equatable/equatable.dart';

class AuthStateEntity extends Equatable {
  final Stream<bool> isAuthenticated;

  const AuthStateEntity({required this.isAuthenticated});

  @override
  List<Object> get props => [isAuthenticated];
}

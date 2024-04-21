import 'package:equatable/equatable.dart';

class LoginStateEntity extends Equatable {
  final Stream<bool> isAuthenticated;

  const LoginStateEntity({required this.isAuthenticated});

  @override
  List<Object> get props => [isAuthenticated];
}

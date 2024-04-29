import 'package:equatable/equatable.dart';
import 'package:nokhte/app/modules/login/login.dart';

class AuthProviderEntity extends Equatable {
  final AuthProvider authProvider;
  final bool authProviderStatus;

  const AuthProviderEntity(
      {required this.authProvider, required this.authProviderStatus});

  @override
  List<Object> get props => [authProvider, authProviderStatus];
}

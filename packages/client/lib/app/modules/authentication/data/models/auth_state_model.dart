import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';

class AuthStateModel extends AuthStateEntity {
  const AuthStateModel({required super.isAuthenticated});

  factory AuthStateModel.fromSupabase(Stream<AuthState> supabaseAuthSession) {
    final Stream<bool> isAuthenticated = supabaseAuthSession
        .map((authState) => authState.session?.accessToken.isNotEmpty == true)
        .distinct();

    return AuthStateModel(isAuthenticated: isAuthenticated);
  }
}

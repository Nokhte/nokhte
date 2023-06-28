import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required Stream<bool> isAuthenticated})
      : super(isAuthenticated: isAuthenticated);

  static AuthModel fromSupabase(Stream<AuthState> supabaseAuthSession) {
    final Stream<bool> isAuthenticated = supabaseAuthSession
        .map((authState) => authState.session?.accessToken.isNotEmpty == true)
        .distinct();

    return AuthModel(isAuthenticated: isAuthenticated);
  }
}

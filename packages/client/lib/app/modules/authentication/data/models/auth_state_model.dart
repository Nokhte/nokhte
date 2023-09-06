import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala/app/modules/authentication/domain/domain.dart';

class AuthStateModel extends AuthStateEntity {
  const AuthStateModel({required Stream<bool> isAuthenticated})
      : super(isAuthenticated: isAuthenticated);

  static AuthStateModel fromSupabase(Stream<AuthState> supabaseAuthSession) {
    final Stream<bool> isAuthenticated = supabaseAuthSession
        .map((authState) => authState.session?.accessToken.isNotEmpty == true)
        .distinct();

    return AuthStateModel(isAuthenticated: isAuthenticated);
  }
}

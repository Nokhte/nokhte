import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte/app/modules/login/domain/domain.dart';

class LoginStateModel extends LoginStateEntity {
  const LoginStateModel({required super.isAuthenticated});

  factory LoginStateModel.fromSupabase(Stream<AuthState> supabaseAuthSession) {
    final Stream<bool> isAuthenticated = supabaseAuthSession
        .map((authState) => authState.session?.accessToken.isNotEmpty == true)
        .distinct();

    return LoginStateModel(isAuthenticated: isAuthenticated);
  }
}

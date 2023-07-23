/// auth_state_model.dart
/// Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 23rd 2023
///
/// Author: Sonny Vesali
///
/// This file defines the [AuthStateModel] class, which extends
/// [AuthStateEntity]. The [AuthStateModel] is a model class that represents
/// the authentication state of the application. It serves as an intermediate
/// abstraction between the external library, Supabase, and our application's
/// domain logic.
///
/// The [AuthStateModel] constructor takes a [Stream<bool>] parameter,
/// [isAuthenticated], and calls the constructor  of [AuthStateEntity] to
/// initialize the authentication state. It is designed to hold the
/// [Stream<bool>], which will emit  a value whenever the authentication state
/// changes. This allows us to track the user's authentication status
/// reactively.
///
/// The [fromSupabase] factory method is used to create an [AuthStateModel]
/// instance from a [Stream<AuthState>] provided by the Supabase library. It
/// maps the [AuthState] from Supabase into a [Stream<bool>] representing the
/// authentication state of our application. The mapping logic is done here for
/// simplicity, as it is directly related to the purpose of the model. The
/// result is returned as a new [AuthStateModel] instance with the mapped
/// [isAuthenticated] stream.
///
/// This model class adheres to the dependency inversion principle, as it
/// converts data from external libraries or APIs into terms that are
/// controlled by our application. By doing so, each component can remain
/// independent and only rely on intermediate abstractions, promoting better
/// separation of concerns and maintainability.

import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthStateModel extends AuthStateEntity {
  /// Constructs an [AuthStateModel] instance with the specified [isAuthenticated] stream.
  const AuthStateModel({required Stream<bool> isAuthenticated})
      : super(isAuthenticated: isAuthenticated);

  /// Creates an [AuthStateModel] from the provided [supabaseAuthSession] stream.
  static AuthStateModel fromSupabase(Stream<AuthState> supabaseAuthSession) {
    /// Map the [AuthState] from Supabase into a [Stream<bool>] representing
    /// the authentication state.
    final Stream<bool> isAuthenticated = supabaseAuthSession
        .map((authState) => authState.session?.accessToken.isNotEmpty == true)
        .distinct();

    /// Return a new [AuthStateModel] instance with the mapped [isAuthenticated] stream.
    return AuthStateModel(isAuthenticated: isAuthenticated);
  }
}

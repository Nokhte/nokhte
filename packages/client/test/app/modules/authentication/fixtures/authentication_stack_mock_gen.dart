// ignore_for_file: must_be_immutable
// * Testing & Mocking Libs
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:primala/app/modules/authentication/data/sources/auth_remote_source.dart';
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/logic/get_auth_state.dart';
import 'package:primala/app/modules/authentication/domain/logic/sign_in_with_apple.dart';
import 'package:primala/app/modules/authentication/domain/logic/sign_in_with_google.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_provider_getter_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_state_getter_store.dart';

class MAuthenticationRemoteSourceImpl extends Mock
    implements AuthenticationRemoteSourceImpl {}

class MAuthenticationContract extends Mock implements AuthenticationContract {}

class MRemoteSource extends Mock implements AuthenticationRemoteSource {}

class MSignInWithGoogle extends Mock implements SignInWithGoogle {}

class MSignInWithApple extends Mock implements SignInWithApple {}

class MGetAuthState extends Mock implements GetAuthState {}

class MGetAuthProviderStateStore extends Mock
    implements GetAuthProviderStateGetterStore {}

class MGetAuthStateStore extends Mock implements GetAuthStateGetterStore {}

@GenerateMocks([
  MAuthenticationRemoteSourceImpl,
  MRemoteSource,
  MAuthenticationContract,
  MSignInWithGoogle,
  MSignInWithApple,
  MGetAuthState,
  MGetAuthProviderStateStore,
  MGetAuthStateStore
])
void main() {}

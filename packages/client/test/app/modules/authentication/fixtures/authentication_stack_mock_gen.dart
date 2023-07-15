// ignore_for_file: must_be_immutable
// * Testing & Mocking Libs
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:primala/app/modules/authentication/data/sources/auth_remote_source.dart';
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/logic/add_name_to_database.dart';
import 'package:primala/app/modules/authentication/domain/logic/get_auth_state.dart';
import 'package:primala/app/modules/authentication/domain/logic/sign_in_with_apple.dart';
import 'package:primala/app/modules/authentication/domain/logic/sign_in_with_google.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/add_name_to_database_getter_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_provider_getter_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_state_getter_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/add_name_to_database_store.dart';

class MAuthenticationRemoteSourceImpl extends Mock
    implements AuthenticationRemoteSourceImpl {}

class MAuthenticationContract extends Mock implements AuthenticationContract {}

class MRemoteSource extends Mock implements AuthenticationRemoteSource {}

class MSignInWithGoogle extends Mock implements SignInWithGoogle {}

class MAddNameToDatabase extends Mock implements AddNameToDatabase {}

class MSignInWithApple extends Mock implements SignInWithApple {}

class MGetAuthState extends Mock implements GetAuthState {}

class MGetAuthProviderStateStore extends Mock
    implements GetAuthProviderStateStore {}

class MAddNameToDatabaseGetterStore extends Mock
    implements AddNameToDatabaseGetterStore {}

class MAddNameToDatabaseStore extends Mock implements AddNameToDatabaseStore {}

class MGetAuthStateStore extends Mock implements GetAuthStateStore {}

@GenerateMocks([
  MAuthenticationRemoteSourceImpl,
  MRemoteSource,
  MAuthenticationContract,
  MAddNameToDatabase,
  MSignInWithGoogle,
  MSignInWithApple,
  MGetAuthState,
  MAddNameToDatabaseGetterStore,
  MAddNameToDatabaseStore,
  MGetAuthProviderStateStore,
  MGetAuthStateStore
])
void main() {}

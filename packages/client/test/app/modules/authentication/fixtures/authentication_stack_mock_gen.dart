// ignore_for_file: must_be_immutable
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:nokhte/app/modules/authentication/data/sources/auth_remote_source.dart';
import 'package:nokhte/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:nokhte/app/modules/authentication/domain/logic/get_auth_state.dart';
import 'package:nokhte/app/modules/authentication/domain/logic/sign_in_with_apple.dart';
import 'package:nokhte/app/modules/authentication/domain/logic/sign_in_with_google.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';

class MAuthenticationRemoteSourceImpl extends Mock
    implements AuthenticationRemoteSourceImpl {}

class MAuthenticationContract extends Mock implements AuthenticationContract {}

class MRemoteSource extends Mock implements AuthenticationRemoteSource {}

@GenerateMocks([
  MAuthenticationRemoteSourceImpl,
  MRemoteSource,
  MAuthenticationContract,
])
@GenerateNiceMocks([
  MockSpec<GetAuthState>(),
  MockSpec<GetAuthStateStore>(),
  MockSpec<SignInWithAuthProviderStore>(),
  MockSpec<SignInWithApple>(),
  MockSpec<SignInWithGoogle>(),
  MockSpec<LoginScreenWidgetsCoordinator>()
])
void main() {}

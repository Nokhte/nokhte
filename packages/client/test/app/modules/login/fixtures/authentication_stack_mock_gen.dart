// ignore_for_file: must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/modules/login/domain/logic/add_metadata.dart';
import 'package:nokhte/app/modules/login/login.dart';

@GenerateMocks([
  LoginRemoteSourceImpl,
  LoginRemoteSource,
  LoginContract,
])
@GenerateNiceMocks([
  MockSpec<GetLoginState>(),
  MockSpec<GetLoginStateStore>(),
  MockSpec<SignInWithAuthProviderStore>(),
  MockSpec<AddName>(),
  MockSpec<SignInWithApple>(),
  MockSpec<SignInWithGoogle>(),
  MockSpec<AddMetadata>(),
  MockSpec<LoginScreenWidgetsCoordinator>()
])
void main() {}

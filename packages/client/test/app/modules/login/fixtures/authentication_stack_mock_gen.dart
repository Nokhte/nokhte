// ignore_for_file: must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/modules/login/data/sources/login_remote_source.dart';
import 'package:nokhte/app/modules/login/domain/domain.dart';
import 'package:nokhte/app/modules/login/presentation/presentation.dart';

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
  MockSpec<LoginScreenWidgetsCoordinator>()
])
void main() {}

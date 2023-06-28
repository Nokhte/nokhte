// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/username/data/sources/username_remote_source.dart';
import 'package:primala/app/modules/username/domain/contracts/username_contract.dart';
import 'package:primala/app/modules/username/domain/logic/check_if_username_is_created.dart';
import 'package:primala/app/modules/username/domain/logic/create_username.dart';
import 'package:primala/app/modules/username/domain/logic/get_default_username.dart';
import 'package:primala/app/modules/username/presentation/mobx/getters/check_if_username_is_created_getter_store.dart';
import 'package:primala/app/modules/username/presentation/mobx/getters/create_username_getter_store.dart';
import 'package:primala/app/modules/username/presentation/mobx/getters/get_default_username_getter_store.dart';

class MUsernameRemoteSourceImpl extends Mock
    implements UsernameRemoteSourceImpl {}

class MRemoteSource extends Mock implements UsernameRemoteSource {}

class MUsernameContract extends Mock implements UsernameContract {}

class MCheckIfUsernameIsCreated extends Mock
    implements CheckIfUsernameIsCreated {}

class MCreateUsername extends Mock implements CreateUsername {}

class MGetDefaultUsername extends Mock implements GetDefaultUsername {}

class MCheckIfUsernameIsCreatedGetterStore extends Mock
    implements CheckIfUsernameIsCreatedGetterStore {}

class MCreateUsernameGetterStore extends Mock
    implements CreateUsernameGetterStore {}

class MGetDefaultUsernameGetterStore extends Mock
    implements GetDefaultUsernameGetterStore {}

@GenerateMocks([
  MUsernameRemoteSourceImpl,
  MRemoteSource,
  MUsernameContract,
  MCheckIfUsernameIsCreated,
  MCreateUsername,
  MGetDefaultUsername,
  MCheckIfUsernameIsCreatedGetterStore,
  MCreateUsernameGetterStore,
  MGetDefaultUsernameGetterStore,
])
void main() {}

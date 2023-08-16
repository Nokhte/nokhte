// ignore_for_file: must_be_immutable
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/home/data/sources/home_remote_source.dart';
import 'package:primala/app/modules/home/domain/contracts/home_contract.dart';
import 'package:primala/app/modules/home/domain/logic/add_name_to_database.dart';
import 'package:primala/app/modules/home/presentation/mobx/getter/add_name_to_database_getter_store.dart';
import 'package:primala/app/modules/home/presentation/mobx/main/add_name_to_database_store.dart';

class MHomeRemoteSourceImpl extends Mock implements HomeRemoteSourceImpl {}

class MHomeContract extends Mock implements HomeContract {}

class MRemoteSource extends Mock implements HomeRemoteSource {}

class MAddNameToDatabase extends Mock implements AddNameToDatabase {}

class MAddNameToDatabaseGetterStore extends Mock
    implements AddNameToDatabaseGetterStore {}

class MAddNameToDatabaseStore extends Mock implements AddNameToDatabaseStore {}

@GenerateMocks([
  MHomeRemoteSourceImpl,
  MHomeContract,
  MRemoteSource,
  MAddNameToDatabase,
  MAddNameToDatabaseGetterStore,
  MAddNameToDatabaseStore,
])
void main() {}

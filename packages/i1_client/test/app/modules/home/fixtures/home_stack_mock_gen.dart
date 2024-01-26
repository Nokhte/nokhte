// ignore_for_file: must_be_immutable
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';

class MHomeRemoteSourceImpl extends Mock implements HomeRemoteSourceImpl {}

class MHomeContract extends Mock implements HomeContract {}

class MRemoteSource extends Mock implements HomeRemoteSource {}

class MAddNameToDatabase extends Mock implements AddNameToDatabase {}

class MGetCollaboratorPhrase extends Mock implements GetCollaboratorPhrase {}

class MAddNameToDatabaseStore extends Mock implements AddNameToDatabaseStore {}

class MGetCollaboratorPhraseStore extends Mock
    implements GetCollaboratorPhraseStore {}

@GenerateMocks([
  MHomeRemoteSourceImpl,
  MHomeContract,
  MRemoteSource,
  MGetCollaboratorPhrase,
  MAddNameToDatabase,
  MAddNameToDatabaseStore,
  MGetCollaboratorPhraseStore,
])
void main() {}

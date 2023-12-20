// ignore_for_file: must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';

@GenerateMocks([
  HomeRemoteSourceImpl,
  HomeContract,
  HomeRemoteSource,
  GetCollaboratorPhrase,
  AddNameToDatabase,
  AddNameToDatabaseStore,
  GetCollaboratorPhraseStore,
])
void main() {}

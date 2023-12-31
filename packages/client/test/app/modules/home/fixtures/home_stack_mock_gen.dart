// ignore_for_file: must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';

@GenerateNiceMocks([
  MockSpec<HomeRemoteSourceImpl>(),
  MockSpec<HomeContract>(),
  MockSpec<HomeRemoteSource>(),
  MockSpec<GetCollaboratorPhrase>(),
  MockSpec<AddNameToDatabase>(),
  MockSpec<AddNameToDatabaseStore>(),
  MockSpec<GetExistingCollaborationsInfoStore>(),
  MockSpec<UserInformationCoordinator>(),
  MockSpec<GetCollaboratorPhraseStore>(),
  MockSpec<UpdateWantsToRepeatInvitationFlowStore>(),
  MockSpec<HomeScreenWidgetsCoordinator>(),
  MockSpec<GetUserInfoStore>(),
  MockSpec<UpdateHasGoneThroughInvitationFlowStore>(),
  MockSpec<UpdateHasSentAnInvitationStore>(),
])
void main() {}

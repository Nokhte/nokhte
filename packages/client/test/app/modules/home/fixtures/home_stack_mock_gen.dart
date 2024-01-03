// ignore_for_file: must_be_immutable
import 'package:mockito/annotations.dart';
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
  MockSpec<GetInvitationURL>(),
  MockSpec<GetUserInfo>(),
  MockSpec<ShareCollaborationInvitation>(),
  MockSpec<UpdateHasGoneThroughInvitationFlow>(),
  MockSpec<UpdateHasSentAnInvitation>(),
  MockSpec<AddNameToDatabaseStore>(),
  MockSpec<GetExistingCollaborationsInfoStore>(),
  MockSpec<ShareCollaborationInvitationStore>(),
  MockSpec<GetInvitationURLStore>(),
  MockSpec<GetUserInfoStore>(),
  MockSpec<GetCollaboratorPhraseStore>(),
  MockSpec<UpdateHasGoneThroughInvitationFlowStore>(),
  MockSpec<UpdateHasSentAnInvitationStore>(),
  MockSpec<HomeScreenWidgetsCoordinator>(),
])
void main() {}

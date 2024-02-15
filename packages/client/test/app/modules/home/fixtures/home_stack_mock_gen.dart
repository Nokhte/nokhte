// ignore_for_file: must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';

@GenerateNiceMocks([
  MockSpec<HomeRemoteSourceImpl>(),
  MockSpec<HomeContract>(),
  MockSpec<HomeRemoteSource>(),
  MockSpec<GetExistingCollaborationsInfoStore>(),
  MockSpec<UserInformationCoordinator>(),
  MockSpec<UpdateWantsToRepeatInvitationFlow>(),
  MockSpec<GetDeepLinkURL>(),
  MockSpec<ListenForOpenedDeepLinkStore>(),
  MockSpec<SendDeepLink>(),
  MockSpec<DeepLinksCoordinator>(),
  MockSpec<GetUserInfoStore>(),
  MockSpec<UpdateHasGoneThroughInvitationFlow>(),
  MockSpec<UpdateHasSentAnInvitation>(),
  MockSpec<DeleteUnconsecratedCollaborationsCoordinator>(),
])
void main() {}

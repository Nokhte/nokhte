// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
part 'user_information_coordinator.g.dart';

class UserInformationCoordinator = _UserInformationCoordinatorBase
    with _$UserInformationCoordinator;

abstract class _UserInformationCoordinatorBase extends Equatable with Store {
  final GetUserInfoStore getUserInfo;
  final UpdateHasGoneThroughInvitationFlowStore
      updateHasGoneThroughInvitationFlow;
  final UpdateHasSentAnInvitationStore updateHasSentAnInvitation;

  _UserInformationCoordinatorBase({
    required this.getUserInfo,
    required this.updateHasGoneThroughInvitationFlow,
    required this.updateHasSentAnInvitation,
  });

  @override
  List<Object> get props => [];
}

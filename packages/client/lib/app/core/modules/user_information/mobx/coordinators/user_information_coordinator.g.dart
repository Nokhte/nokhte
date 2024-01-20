// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserInformationCoordinator on _UserInformationCoordinatorBase, Store {
  late final _$invitationFlowCompletionStatusIsUpdatedAtom = Atom(
      name:
          '_UserInformationCoordinatorBase.invitationFlowCompletionStatusIsUpdated',
      context: context);

  @override
  bool get invitationFlowCompletionStatusIsUpdated {
    _$invitationFlowCompletionStatusIsUpdatedAtom.reportRead();
    return super.invitationFlowCompletionStatusIsUpdated;
  }

  @override
  set invitationFlowCompletionStatusIsUpdated(bool value) {
    _$invitationFlowCompletionStatusIsUpdatedAtom
        .reportWrite(value, super.invitationFlowCompletionStatusIsUpdated, () {
      super.invitationFlowCompletionStatusIsUpdated = value;
    });
  }

  late final _$invitationSendStatusIsUpdatedAtom = Atom(
      name: '_UserInformationCoordinatorBase.invitationSendStatusIsUpdated',
      context: context);

  @override
  bool get invitationSendStatusIsUpdated {
    _$invitationSendStatusIsUpdatedAtom.reportRead();
    return super.invitationSendStatusIsUpdated;
  }

  @override
  set invitationSendStatusIsUpdated(bool value) {
    _$invitationSendStatusIsUpdatedAtom
        .reportWrite(value, super.invitationSendStatusIsUpdated, () {
      super.invitationSendStatusIsUpdated = value;
    });
  }

  late final _$invitationRepeatStatusIsUpdatedAtom = Atom(
      name: '_UserInformationCoordinatorBase.invitationRepeatStatusIsUpdated',
      context: context);

  @override
  bool get invitationRepeatStatusIsUpdated {
    _$invitationRepeatStatusIsUpdatedAtom.reportRead();
    return super.invitationRepeatStatusIsUpdated;
  }

  @override
  set invitationRepeatStatusIsUpdated(bool value) {
    _$invitationRepeatStatusIsUpdatedAtom
        .reportWrite(value, super.invitationRepeatStatusIsUpdated, () {
      super.invitationRepeatStatusIsUpdated = value;
    });
  }

  late final _$updateHasGoneThroughInvitationFlowAsyncAction = AsyncAction(
      '_UserInformationCoordinatorBase.updateHasGoneThroughInvitationFlow',
      context: context);

  @override
  Future updateHasGoneThroughInvitationFlow(bool newStatus) {
    return _$updateHasGoneThroughInvitationFlowAsyncAction
        .run(() => super.updateHasGoneThroughInvitationFlow(newStatus));
  }

  late final _$updateHasSentAnInvitationAsyncAction = AsyncAction(
      '_UserInformationCoordinatorBase.updateHasSentAnInvitation',
      context: context);

  @override
  Future updateHasSentAnInvitation(bool newStatus) {
    return _$updateHasSentAnInvitationAsyncAction
        .run(() => super.updateHasSentAnInvitation(newStatus));
  }

  late final _$updateWantsToRepeatInvitationFlowAsyncAction = AsyncAction(
      '_UserInformationCoordinatorBase.updateWantsToRepeatInvitationFlow',
      context: context);

  @override
  Future updateWantsToRepeatInvitationFlow(bool newStatus) {
    return _$updateWantsToRepeatInvitationFlowAsyncAction
        .run(() => super.updateWantsToRepeatInvitationFlow(newStatus));
  }

  @override
  String toString() {
    return '''
invitationFlowCompletionStatusIsUpdated: ${invitationFlowCompletionStatusIsUpdated},
invitationSendStatusIsUpdated: ${invitationSendStatusIsUpdated},
invitationRepeatStatusIsUpdated: ${invitationRepeatStatusIsUpdated}
    ''';
  }
}

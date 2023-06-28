// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/logic/respond_to_a_request.dart';
// * Mobx Codegen Inclusion
part 'respond_to_a_request_getter_store.g.dart';

class RespondToARequestGetterStore = _RespondToARequestGetterStoreBase
    with _$RespondToARequestGetterStore;

abstract class _RespondToARequestGetterStoreBase extends Equatable with Store {
  final RespondToARequest respondToARequestLogic;

  _RespondToARequestGetterStoreBase({required RespondToARequest respondLogic})
      : respondToARequestLogic = respondLogic;

  Future<Either<Failure, P2PRequestRecipientResponseStatusEntity>> call(
      String senderUsername) async {
    return await respondToARequestLogic(
      P2PRespondToReqParams(
        senderUsername: senderUsername,
      ),
    );
  }

  @override
  List<Object> get props => [];
}

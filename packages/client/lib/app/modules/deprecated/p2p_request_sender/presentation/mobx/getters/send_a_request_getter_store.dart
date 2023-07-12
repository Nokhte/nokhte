// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/domain/entities/p2p_request_sender_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/domain/logic/send_a_request.dart';
// * Mobx Codegen Inclusion
part 'send_a_request_getter_store.g.dart';

class SendARequestGetterStore = _SendARequestGetterStoreBase
    with _$SendARequestGetterStore;

abstract class _SendARequestGetterStoreBase extends Equatable with Store {
  final SendARequest sendARequestLogic;

  _SendARequestGetterStoreBase({required SendARequest sendLogic})
      : sendARequestLogic = sendLogic;

  Future<Either<Failure, P2PRequestSenderStatusEntity>> call(
      String username) async {
    return await sendARequestLogic(P2PSendReqParams(username: username));
  }

  @override
  List<Object> get props => [];
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/validate_request.dart';
// * Mobx Codegen Inclusion
part 'validate_request_getter_store.g.dart';

class ValidateRequestGetterStore = _ValidateRequestGetterStoreBase
    with _$ValidateRequestGetterStore;

abstract class _ValidateRequestGetterStoreBase extends Equatable with Store {
  final ValidateRequest validateRequestLogic;

  _ValidateRequestGetterStoreBase({required ValidateRequest validateRequest})
      : validateRequestLogic = validateRequest;

  Future<Either<Failure, P2PRequestRecipientEntity>> call(
      String username) async {
    return await validateRequestLogic(
        P2PReqRecipientParams(username: username));
  }

  @override
  List<Object> get props => [];
}

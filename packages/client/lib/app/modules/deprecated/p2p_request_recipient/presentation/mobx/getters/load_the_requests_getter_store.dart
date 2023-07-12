// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/entities/p2p_recipient_request_presentational_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/logic/load_the_requests.dart';
// * Mobx Codegen Inclusion
part 'load_the_requests_getter_store.g.dart';

class LoadTheRequestsGetterStore = _LoadTheRequestsGetterStoreBase
    with _$LoadTheRequestsGetterStore;

abstract class _LoadTheRequestsGetterStoreBase extends Equatable with Store {
  final LoadTheRequests loadTheRequestsLogic;

  _LoadTheRequestsGetterStoreBase({required LoadTheRequests loadLogic})
      : loadTheRequestsLogic = loadLogic;

  Future<Either<Failure, P2PRecipientRequestPresentationalEntity>>
      call() async {
    return await loadTheRequestsLogic(NoParams());
  }

  @override
  List<Object> get props => [];
}

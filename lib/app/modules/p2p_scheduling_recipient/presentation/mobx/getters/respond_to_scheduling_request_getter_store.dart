// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/respond_to_scheduling_request_param_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/logic/respond_to_scheduling_request.dart';
// * Mobx Codegen Inclusion
part 'respond_to_scheduling_request_getter_store.g.dart';

class RespondToSchedulingRequestGetterStore = _RespondToSchedulingRequestGetterStoreBase
    with _$RespondToSchedulingRequestGetterStore;

abstract class _RespondToSchedulingRequestGetterStoreBase extends Equatable
    with Store {
  final RespondToSchedulingRequest respondToSchedulingRequestLogic;
  _RespondToSchedulingRequestGetterStoreBase({
    required this.respondToSchedulingRequestLogic,
  });

  Future<Either<Failure, P2PSchedulingResponseStatusEntity>> call(
      RespondToSchedulingRequestParamEntity params) async {
    return await respondToSchedulingRequestLogic(params);
  }

  @override
  List<Object> get props => [
// some items
      ];
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/logic/send_scheduling_request.dart';
// * Mobx Codegen Inclusion
part 'send_scheduling_request_getter_store.g.dart';

class SendSchedulingRequestGetterStore = _SendSchedulingRequestGetterStoreBase
    with _$SendSchedulingRequestGetterStore;

abstract class _SendSchedulingRequestGetterStoreBase extends Equatable
    with Store {
  final SendSchedulingRequest sendSchedulingRequestLogic;

  _SendSchedulingRequestGetterStoreBase({
    required this.sendSchedulingRequestLogic,
  });
  Future<Either<Failure, P2PSchedulingRequestStatusEntity>> call(
      SendSchedulingRequestParamEntity params) async {
    return await sendSchedulingRequestLogic(params);
  }

  @override
  List<Object> get props => [
// some items
      ];
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/confirm_p2p_scheduling_time_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/logic/confirm_scheduling_time.dart';
// * Mobx Codegen Inclusion
part 'confirm_scheduling_time_getter_store.g.dart';

class ConfirmSchedulingTimeGetterStore = _ConfirmSchedulingTimeGetterStoreBase
    with _$ConfirmSchedulingTimeGetterStore;

abstract class _ConfirmSchedulingTimeGetterStoreBase extends Equatable
    with Store {
  final ConfirmSchedulingTime confirmSchedulingTimeLogic;
  _ConfirmSchedulingTimeGetterStoreBase(
      {required this.confirmSchedulingTimeLogic});

  Future<Either<Failure, ConfirmP2PSchedulingTimeStatusEntity>> call(
      ConfirmSchedulingTimeParams params) async {
    return await confirmSchedulingTimeLogic(params);
  }

  @override
  List<Object> get props => [
// some items
      ];
}

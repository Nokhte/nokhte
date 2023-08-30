// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'join_call_getter_store.g.dart';

class JoinCallGetterStore = _JoinCallGetterStoreBase with _$JoinCallGetterStore;

abstract class _JoinCallGetterStoreBase extends Equatable with Store {
  JoinCall joinCallLogic;

  _JoinCallGetterStoreBase({
    required this.joinCallLogic,
  });

  Future<Either<Failure, CallStatusEntity>> call({
    required String token,
    required String channelId,
  }) async =>
      await joinCallLogic(JoinCallParams(token: token, channelId: channelId));

  @override
  List<Object> get props => [
// some items
      ];
}

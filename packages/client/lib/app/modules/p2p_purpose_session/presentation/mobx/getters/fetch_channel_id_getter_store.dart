// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'fetch_channel_id_getter_store.g.dart';

class FetchChannelIdGetterStore = _FetchChannelIdGetterStoreBase
    with _$FetchChannelIdGetterStore;

abstract class _FetchChannelIdGetterStoreBase extends Equatable with Store {
  FetchChannelId logic;

  _FetchChannelIdGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, ChannelIdEntity>> call() async =>
      await logic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}

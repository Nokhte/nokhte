// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
part 'get_channel_id_getter_store.g.dart';

class GetChannelIdGetterStore = _GetChannelIdGetterStoreBase
    with _$GetChannelIdGetterStore;

abstract class _GetChannelIdGetterStoreBase extends Equatable with Store {
  GetChannelId logic;

  _GetChannelIdGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, ChannelIdEntity>> call() async =>
      await logic(NoParams());

  @override
  List<Object> get props => [];
}

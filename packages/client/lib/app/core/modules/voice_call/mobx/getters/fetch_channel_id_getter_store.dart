// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
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
  List<Object> get props => [];
}

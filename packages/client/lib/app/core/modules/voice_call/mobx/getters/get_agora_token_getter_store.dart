// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
part 'get_agora_token_getter_store.g.dart';

class GetAgoraTokenGetterStore = _GetAgoraTokenGetterStoreBase
    with _$GetAgoraTokenGetterStore;

abstract class _GetAgoraTokenGetterStoreBase extends Equatable with Store {
  GetAgoraToken logic;

  _GetAgoraTokenGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, AgoraCallTokenEntity>> call(
          GetAgoraTokenParams params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}

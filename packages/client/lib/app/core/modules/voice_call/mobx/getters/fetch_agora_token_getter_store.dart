// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'fetch_agora_token_getter_store.g.dart';

class FetchAgoraTokenGetterStore = _FetchAgoraTokenGetterStoreBase
    with _$FetchAgoraTokenGetterStore;

abstract class _FetchAgoraTokenGetterStoreBase extends Equatable with Store {
  FetchAgoraToken logic;

  _FetchAgoraTokenGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, AgoraCallTokenEntity>> call(
          FetchAgoraTokenParams params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}

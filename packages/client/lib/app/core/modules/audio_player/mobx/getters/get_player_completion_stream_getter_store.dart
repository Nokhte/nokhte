// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/logic/get_player_completion_stream.dart';
part 'get_player_completion_stream_getter_store.g.dart';

class GetPlayerCompletionStreamGetterStore = _GetPlayerCompletionStreamGetterStoreBase
    with _$GetPlayerCompletionStreamGetterStore;

abstract class _GetPlayerCompletionStreamGetterStoreBase extends Equatable
    with Store {
  final GetPlayerCompletionStream logic;

  _GetPlayerCompletionStreamGetterStoreBase({
    required this.logic,
  });

  PlayerCompletionStreamEntity call(NoParams params) => logic(params);

  @override
  List<Object> get props => [];
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
part 'cancel_session_metadata_stream_store.g.dart';

class CancelSessionMetadataStreamStore = _CancelSessionMetadataSreamStoreBase
    with _$CancelSessionMetadataStreamStore;

abstract class _CancelSessionMetadataSreamStoreBase
    extends BaseMobxDBStore<NoParams, bool> with Store {
  @observable
  bool isListening = true;

  final CancelSessionMetadataStream logic;

  _CancelSessionMetadataSreamStoreBase({required this.logic});

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    logic(params);
    state = StoreState.loaded;
  }
}

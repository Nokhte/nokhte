// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'solo_doc_coordinator_store.g.dart';

class SoloDocCoordinatorStore = _SoloDocCoordinatorStoreBase
    with _$SoloDocCoordinatorStore;

abstract class _SoloDocCoordinatorStoreBase extends Equatable with Store {
  final CreateSoloDocStore createSoloDoc;
  final GetSoloDocStore getSoloDoc;
  final SealSoloDocStore sealSoloDoc;
  final ShareSoloDocStore shareSoloDoc;
  final SubmitSoloDocStore submitSoloDoc;

  _SoloDocCoordinatorStoreBase({
    required this.createSoloDoc,
    required this.getSoloDoc,
    required this.sealSoloDoc,
    required this.shareSoloDoc,
    required this.submitSoloDoc,
  });

  @override
  List<Object> get props => [];
}

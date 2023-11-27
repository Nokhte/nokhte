// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/main/get_solo_doc_store.dart';
part 'solo_doc_coordinator.g.dart';

class SoloDocCoordinator = _SoloDocCoordinatorBase with _$SoloDocCoordinator;

abstract class _SoloDocCoordinatorBase extends Equatable with Store {
  final CreateSoloDoc createSoloDoc;
  final GetSoloDocStore getSoloDoc;
  final SealSoloDoc sealSoloDoc;
  final ShareSoloDoc shareSoloDoc;
  final SubmitSoloDoc submitSoloDoc;

  _SoloDocCoordinatorBase({
    required this.createSoloDoc,
    required this.getSoloDoc,
    required this.sealSoloDoc,
    required this.shareSoloDoc,
    required this.submitSoloDoc,
  });

  @override
  List<Object> get props => [];
}

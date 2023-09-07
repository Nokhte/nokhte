// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'submit_solo_doc_content_getter_store.g.dart';

class SubmitSoloDocContentGetterStore = _SubmitSoloDocContentGetterStoreBase
    with _$SubmitSoloDocContentGetterStore;

abstract class _SubmitSoloDocContentGetterStoreBase extends Equatable
    with Store {
  final SubmitSoloDocContent logic;
  _SubmitSoloDocContentGetterStoreBase({required this.logic});

  Future<Either<Failure, SoloDocSubmissionStatusEntity>> call(
          SubmitSoloDocContentParams params) =>
      logic(params);
  @override
  List<Object> get props => [
// some items
      ];
}

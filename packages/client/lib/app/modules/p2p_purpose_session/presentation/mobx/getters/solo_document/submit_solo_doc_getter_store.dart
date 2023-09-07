// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'submit_solo_doc_getter_store.g.dart';

class SubmitSoloDocGetterStore = _SubmitSoloDocGetterStoreBase
    with _$SubmitSoloDocGetterStore;

abstract class _SubmitSoloDocGetterStoreBase extends Equatable with Store {
  final SubmitSoloDoc logic;
  _SubmitSoloDocGetterStoreBase({required this.logic});

  Future<Either<Failure, SoloDocSubmissionStatusEntity>> call(
          SubmitSoloDocParams params) =>
      logic(params);
  @override
  List<Object> get props => [
// some items
      ];
}

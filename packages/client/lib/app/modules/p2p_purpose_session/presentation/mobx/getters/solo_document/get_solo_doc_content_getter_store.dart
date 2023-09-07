// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'get_solo_doc_content_getter_store.g.dart';

class GetSoloDocContentGetterStore = _GetSoloDocContentGetterStoreBase
    with _$GetSoloDocContentGetterStore;

abstract class _GetSoloDocContentGetterStoreBase extends Equatable with Store {
  final GetSoloDoc logic;

  _GetSoloDocContentGetterStoreBase({required this.logic});

  Future<Either<Failure, SoloDocContentEntity>> call(NoParams params) async =>
      logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}

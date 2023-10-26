// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'create_solo_doc_getter_store.g.dart';

class CreateSoloDocGetterStore = _CreateSoloDocGetterStoreBase
    with _$CreateSoloDocGetterStore;

abstract class _CreateSoloDocGetterStoreBase extends Equatable with Store {
  CreateSoloDoc logic;

  _CreateSoloDocGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, SoloDocCreationStatusEntity>> call(
          CreateSoloDocParams params) async =>
      logic(params);

  @override
  List<Object> get props => [];
}

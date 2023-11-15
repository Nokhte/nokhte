// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
part 'seal_solo_doc_getter_store.g.dart';

class SealSoloDocGetterStore = _SealSoloDocGetterStoreBase
    with _$SealSoloDocGetterStore;

abstract class _SealSoloDocGetterStoreBase extends Equatable with Store {
  final SealSoloDoc logic;
  _SealSoloDocGetterStoreBase({required this.logic});

  Future<Either<Failure, SoloDocSealingStatusEntity>> call(
          NoParams params) async =>
      logic(params);
  @override
  List<Object> get props => [];
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'update_current_quadrant_getter_store.g.dart';

class UpdateCurrentQuadrantGetterStore = _UpdateCurrentQuadrantGetterStoreBase
    with _$UpdateCurrentQuadrantGetterStore;

abstract class _UpdateCurrentQuadrantGetterStoreBase extends Equatable
    with Store {
  final UpdateCurrentQuadrant logic;

  _UpdateCurrentQuadrantGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CurrentQuadrantUpdatingStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}

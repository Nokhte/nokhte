// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'get_current_perspectives_getter_store.g.dart';

class GetCurrentPerspectivesGetterStore = _GetCurrentPerspectivesGetterStoreBase
    with _$GetCurrentPerspectivesGetterStore;

abstract class _GetCurrentPerspectivesGetterStoreBase extends Equatable
    with Store {
  final GetCurrentPerspectives logic;

  _GetCurrentPerspectivesGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CurrentPerspectivesEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}

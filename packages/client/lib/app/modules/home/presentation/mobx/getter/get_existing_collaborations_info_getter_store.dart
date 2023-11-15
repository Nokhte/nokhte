// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';
part 'get_existing_collaborations_info_getter_store.g.dart';

class GetExistingCollaborationsInfoGetterStore = _GetExistingCollaborationsInfoGetterStoreBase
    with _$GetExistingCollaborationsInfoGetterStore;

abstract class _GetExistingCollaborationsInfoGetterStoreBase extends Equatable
    with Store {
  final GetExistingCollaborationsInfo logic;

  _GetExistingCollaborationsInfoGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, ExistingCollaborationsInfoEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}

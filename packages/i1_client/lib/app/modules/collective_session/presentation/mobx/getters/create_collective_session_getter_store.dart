// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
part 'create_collective_session_getter_store.g.dart';

class CreateCollectiveSessionGetterStore = _CreateCollectiveSessionGetterStoreBase
    with _$CreateCollectiveSessionGetterStore;

abstract class _CreateCollectiveSessionGetterStoreBase extends Equatable
    with Store {
  final CreateCollectiveSession logic;

  _CreateCollectiveSessionGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollectiveSessionCreationStatusEntity>> call(
          NoParams params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}

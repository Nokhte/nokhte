// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
part 'create_a_perspectives_session_getter_store.g.dart';

class CreateAPerspectivesSessionGetterStore = _CreateAPerspectivesSessionGetterStoreBase
    with _$CreateAPerspectivesSessionGetterStore;

abstract class _CreateAPerspectivesSessionGetterStoreBase extends Equatable
    with Store {
  final CreateAPerspectivesSession logic;

  _CreateAPerspectivesSessionGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, PerspectiveSessionCreationStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}

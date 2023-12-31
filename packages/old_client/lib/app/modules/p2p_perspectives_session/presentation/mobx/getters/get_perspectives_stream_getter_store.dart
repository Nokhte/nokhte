// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
part 'get_perspectives_stream_getter_store.g.dart';

class GetPerspectivesStreamGetterStore = _GetPerspectivesStreamGetterStoreBase
    with _$GetPerspectivesStreamGetterStore;

abstract class _GetPerspectivesStreamGetterStoreBase extends Equatable
    with Store {
  final GetPerspectivesStream logic;

  _GetPerspectivesStreamGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, WorkingPerspectivesStreamEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}

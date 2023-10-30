// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'fetch_perspectives_stream_getter_store.g.dart';

class FetchPerspectivesStreamGetterStore = _FetchPerspectivesStreamGetterStoreBase
    with _$FetchPerspectivesStreamGetterStore;

abstract class _FetchPerspectivesStreamGetterStoreBase extends Equatable
    with Store {
  final FetchPerspectivesStream logic;

  _FetchPerspectivesStreamGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, WorkingPerspectivesStreamEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}

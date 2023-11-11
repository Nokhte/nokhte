// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
part 'get_solo_doc_getter_store.g.dart';

class GetSoloDocGetterStore = _GetSoloDocGetterStoreBase
    with _$GetSoloDocGetterStore;

abstract class _GetSoloDocGetterStoreBase extends Equatable with Store {
  final GetSoloDoc logic;

  _GetSoloDocGetterStoreBase({required this.logic});

  Future<Either<Failure, SoloDocContentEntity>> call(
          GetSoloDocParams params) async =>
      logic(params);

  @override
  List<Object> get props => [];
}

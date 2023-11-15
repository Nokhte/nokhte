// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
part 'share_solo_doc_getter_store.g.dart';

class ShareSoloDocGetterStore = _ShareSoloDocGetterStoreBase
    with _$ShareSoloDocGetterStore;

abstract class _ShareSoloDocGetterStoreBase extends Equatable with Store {
  final ShareSoloDoc logic;

  _ShareSoloDocGetterStoreBase({required this.logic});

  Future<Either<Failure, SoloDocSharingStatusEntity>> call(
          NoParams params) async =>
      logic(params);
  @override
  List<Object> get props => [];
}

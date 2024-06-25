// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'dummy_mobx_db_store_child.g.dart';

class DummyMobxDBStoreChild = _DummyMobxDBStoreChildBase
    with _$DummyMobxDBStoreChild;

abstract class _DummyMobxDBStoreChildBase with Store, BaseMobxLogic<NoParams> {}

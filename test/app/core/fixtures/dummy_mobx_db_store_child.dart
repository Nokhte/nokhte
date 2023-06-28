// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';

import 'dummy_entity.dart';
// * Mobx Codegen Inclusion
part 'dummy_mobx_db_store_child.g.dart';

class DummyMobxDBStoreChild = _DummyMobxDBStoreChildBase
    with _$DummyMobxDBStoreChild;

abstract class _DummyMobxDBStoreChildBase
    extends BaseMobxDBStore<DummyEntity, NoParams> with Store {}

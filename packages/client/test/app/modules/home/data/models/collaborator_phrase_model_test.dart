import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/modules/home/data/models/models.dart';

import '../../constants/data/data.dart';
import '../../constants/models/models.dart';

void main() {
  test(
      "`fromSupabase` should return an entity with the proper fields being set",
      () {
    final res = CollaboratorPhraseModel.fromSupabase(SampleSupabaseRes.res);
    expect(res, ConstantCollaboratorPhraseModels.successCase);
  });
}

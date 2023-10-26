import 'package:nokhte/app/core/modules/fetch_the_purpose/domain/entities/entities.dart';

class CollectivePurposeModel extends CollectivePurposeEntity {
  const CollectivePurposeModel({required super.thePurpose});

  static CollectivePurposeModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const CollectivePurposeModel(thePurpose: '');
    } else {
      final thePurpose = sbQueryRes[0]["content"];
      return CollectivePurposeModel(thePurpose: thePurpose);
    }
  }
}

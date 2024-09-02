import 'package:hive/hive.dart';
import 'package:nokhte/app/core/modules/hive/hive.dart';

mixin HiveBoxUtils {
  Future<List> updateBox({
    required Map data,
    required String name,
  }) async {
    final box = await Hive.openBox(name);
    box.putAll(data);
    return [box.toMap()];
  }

  Future<List> initBoxIfNecessary({
    required String name,
    required Future<List> Function() query,
  }) async {
    final box = await Hive.openBox(
      HiveBoxes.userInformation.toString(),
    );
    if (box.isEmpty) {
      final res = await query();
      if (res.isNotEmpty) {
        await updateBox(data: res.first, name: name);
      }
    }
    return [box.toMap()];
  }
}

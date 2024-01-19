import 'package:share_plus/share_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

mixin ResponseToStatus {
  bool fromSupabase(List response) {
    if (response.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool fromShareResult(ShareResult res) {
    if (res.status == ShareResultStatus.success) {
      return true;
    } else {
      return false;
    }
  }

  bool fromFunctionResponse(FunctionResponse res) {
    if (res.status == 200) {
      return true;
    } else {
      return false;
    }
  }
}

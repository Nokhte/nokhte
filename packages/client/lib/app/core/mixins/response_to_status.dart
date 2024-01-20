import 'dart:convert';

import 'package:http/http.dart';
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

  T fromSupabaseProperty<T>(List res, String property, T defaultType) {
    if (res.isEmpty) {
      return defaultType;
    } else {
      return res.first[property];
    }
  }

  bool fromShareResult(ShareResult res) {
    if (res.status == ShareResultStatus.success) {
      return true;
    } else {
      return false;
    }
  }

  T fromHTTPResponseProperty<T>(Response res, String property, T defaultType) {
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      return json[property];
    } else {
      return defaultType;
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

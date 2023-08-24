import 'package:supabase_flutter/supabase_flutter.dart';

class FunctionResponses {
  static FunctionResponse get successRes => FunctionResponse(status: 200);
  static FunctionResponse get notSuccessRes => FunctionResponse(status: 500);
}

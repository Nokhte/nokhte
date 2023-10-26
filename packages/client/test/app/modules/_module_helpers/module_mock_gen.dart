// * Testing & Mocking Libs
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MNetworkInfoImpl extends Mock implements NetworkInfoImpl {}

class MConnectivity extends Mock implements Connectivity {}

class MSupabaseClient extends Mock implements SupabaseClient {}

@GenerateMocks([
  MNetworkInfoImpl,
  MConnectivity,
  MSupabaseClient,
])
void main() {}

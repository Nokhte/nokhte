// * Testing & Mocking Libs
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/core/network/network_info.dart';

class MNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([MNetworkInfo])
void main() {}

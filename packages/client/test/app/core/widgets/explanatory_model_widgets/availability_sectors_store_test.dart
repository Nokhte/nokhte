import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import '../wifi_disconnect_overlay/wifi_disconnect_mocks.mocks.dart';

void main() {
  late AvailabilitySectorsStore testStore;
  late MockGetOnConnectivityChangedStore mock;

  setUp(() {
    mock = MockGetOnConnectivityChangedStore();
    testStore = AvailabilitySectorsStore();
  });

  group("initial values", () {
    test("movie", () {
      expect(testStore.movie.duration, Seconds.get(3));
    });

    test("movieMode", () {
      expect(testStore.movieMode, AvailabilitySectorMovieModes.initial);
    });
  });

  group("actions", () {
    test("setMovieMode", () {
      testStore.setMovieMode(AvailabilitySectorMovieModes.joinAndFadeOut);
      expect(testStore.movieMode, AvailabilitySectorMovieModes.joinAndFadeOut);
    });

    test("initMovie", () {
      testStore.initMovie(NoParams());
      expect(testStore.control, Control.play);
      expect(testStore.movieMode, AvailabilitySectorMovieModes.setup);
    });

    test("initJoinAndFadeOutMovie", () {
      when(mock.isConnected).thenAnswer((realInvocation) => true);
      testStore.setMovieStatus(MovieStatus.finished);
      testStore.setMovieMode(AvailabilitySectorMovieModes.setup);
      testStore.initJoinAndFadeOutMovie();
      expect(testStore.movieStatus, MovieStatus.inProgress);
      expect(testStore.movieMode, AvailabilitySectorMovieModes.joinAndFadeOut);
      expect(testStore.movie.duration, Seconds.get(4));
      expect(testStore.control, Control.playFromStart);
    });
  });
}

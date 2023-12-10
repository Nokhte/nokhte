import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/widgets/trailing_text/stack/movies/reveal_text_movie.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

void main() {
  group("getPadding", () {
    test("(15.0, TextRevealDirection.fromLeft)", () {
      final padding =
          RevealTextMovie.getPadding(15.0, TextRevealDirection.fromLeft);
      expect(padding.right, 15.0);
      expect(padding.bottom, 0.0);
      expect(padding.top, 0.0);
      expect(padding.left, 0.0);
    });
    test("(15.0, TextRevealDirection.fromRight)", () {
      final padding =
          RevealTextMovie.getPadding(15.0, TextRevealDirection.fromRight);
      expect(padding.left, 15.0);
      expect(padding.bottom, 0.0);
      expect(padding.top, 0.0);
      expect(padding.right, 0.0);
    });
  });
}

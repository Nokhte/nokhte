// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'preset_diagram_store.g.dart';

class PresetDiagramStore = _PresetDiagramStoreBase with _$PresetDiagramStore;

abstract class _PresetDiagramStoreBase extends BaseWidgetStore with Store {
  _PresetDiagramStoreBase() {
    final movies = PresetDiagramMovies();
    setMovie(movies.appear);
  }

  @observable
  PresetDiagramCircleMovieModes movieMode =
      PresetDiagramCircleMovieModes.appear;

  @action
  setMovieMode(PresetDiagramCircleMovieModes movieMode) =>
      this.movieMode = movieMode;

  @computed
  int get numOfCircles {
    switch (movieMode) {
      case PresetDiagramCircleMovieModes.appear:
        return 1;
      case PresetDiagramCircleMovieModes.showSecondCircle:
        return 2;
      case PresetDiagramCircleMovieModes.showLeftTalkingPhone:
        return 2;
      case PresetDiagramCircleMovieModes.showRightNotesPhone:
        return 2;
      case PresetDiagramCircleMovieModes.consolidateThePair:
        return 2;
      case PresetDiagramCircleMovieModes.trioExpansion:
        return 3;
      case PresetDiagramCircleMovieModes.trioConsolidation:
        return 3;
      case PresetDiagramCircleMovieModes.fourWayExpansion:
        return 4;
      case PresetDiagramCircleMovieModes.fourWayConsolidation:
        return 4;
      case PresetDiagramCircleMovieModes.whiteToHalfAndHalfCircle:
        return 1;
    }
  }

  @computed
  List<List<Alignment>> get lineGradAlignments {
    switch (movieMode) {
      case PresetDiagramCircleMovieModes.appear:
        return [];
      case PresetDiagramCircleMovieModes.showSecondCircle:
        return [];
      case PresetDiagramCircleMovieModes.showLeftTalkingPhone:
        return [
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
        ];
      case PresetDiagramCircleMovieModes.showRightNotesPhone:
        return [
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
        ];
      case PresetDiagramCircleMovieModes.consolidateThePair:
        return [
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
        ];
      case PresetDiagramCircleMovieModes.trioExpansion:
        return [
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
          [
            Alignment.centerLeft,
            Alignment.centerRight,
          ],
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
        ];
      case PresetDiagramCircleMovieModes.trioConsolidation:
        return [
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
          [
            Alignment.centerLeft,
            Alignment.centerRight,
          ],
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
        ];
      case PresetDiagramCircleMovieModes.fourWayExpansion:
        return [
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
          [
            Alignment.centerLeft,
            Alignment.centerRight,
          ],
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
          [
            Alignment.centerLeft,
            Alignment.centerRight,
          ],
        ];
      case PresetDiagramCircleMovieModes.fourWayConsolidation:
        return [
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
          [
            Alignment.centerLeft,
            Alignment.centerRight,
          ],
          [
            Alignment.topCenter,
            Alignment.bottomCenter,
          ],
          [
            Alignment.centerLeft,
            Alignment.centerRight,
          ],
        ];
      case PresetDiagramCircleMovieModes.whiteToHalfAndHalfCircle:
        return [];
    }
  }

  @computed
  int get numOfLines {
    switch (movieMode) {
      case PresetDiagramCircleMovieModes.appear:
        return 0;
      case PresetDiagramCircleMovieModes.showSecondCircle:
        return 0;
      case PresetDiagramCircleMovieModes.showLeftTalkingPhone:
        return 1;
      case PresetDiagramCircleMovieModes.showRightNotesPhone:
        return 2;
      case PresetDiagramCircleMovieModes.consolidateThePair:
        return 2;
      case PresetDiagramCircleMovieModes.trioExpansion:
        return 3;
      case PresetDiagramCircleMovieModes.trioConsolidation:
        return 3;
      case PresetDiagramCircleMovieModes.fourWayExpansion:
        return 4;
      case PresetDiagramCircleMovieModes.fourWayConsolidation:
        return 4;
      case PresetDiagramCircleMovieModes.whiteToHalfAndHalfCircle:
        return 0;
    }
  }

  @computed
  List<LineGradientTypes> get lineGrads {
    switch (movieMode) {
      case PresetDiagramCircleMovieModes.appear:
        return [];
      case PresetDiagramCircleMovieModes.showSecondCircle:
        return [];
      case PresetDiagramCircleMovieModes.showLeftTalkingPhone:
        return [LineGradientTypes.talking];
      case PresetDiagramCircleMovieModes.showRightNotesPhone:
        return [LineGradientTypes.talking, LineGradientTypes.notes];
      case PresetDiagramCircleMovieModes.consolidateThePair:
        return [LineGradientTypes.talking, LineGradientTypes.notes];
      case PresetDiagramCircleMovieModes.trioExpansion:
        return [
          LineGradientTypes.talking,
          LineGradientTypes.notes,
          LineGradientTypes.talking,
        ];
      case PresetDiagramCircleMovieModes.trioConsolidation:
        return [
          LineGradientTypes.talking,
          LineGradientTypes.notes,
          LineGradientTypes.talking,
        ];
      case PresetDiagramCircleMovieModes.fourWayExpansion:
        return [
          LineGradientTypes.talking,
          LineGradientTypes.notes,
          LineGradientTypes.talking,
          LineGradientTypes.notes,
        ];

      case PresetDiagramCircleMovieModes.fourWayConsolidation:
        return [
          LineGradientTypes.talking,
          LineGradientTypes.notes,
          LineGradientTypes.talking,
          LineGradientTypes.notes,
        ];
      case PresetDiagramCircleMovieModes.whiteToHalfAndHalfCircle:
        return [];
    }
  }

  @computed
  List<PaintingStyle> get paintingStyle {
    switch (movieMode) {
      case PresetDiagramCircleMovieModes.appear:
        return [PaintingStyle.fill, PaintingStyle.stroke];
      case PresetDiagramCircleMovieModes.showSecondCircle:
        return [PaintingStyle.fill, PaintingStyle.stroke];
      case PresetDiagramCircleMovieModes.showLeftTalkingPhone:
        return [PaintingStyle.fill, PaintingStyle.stroke];
      case PresetDiagramCircleMovieModes.showRightNotesPhone:
        return [PaintingStyle.fill, PaintingStyle.stroke];
      case PresetDiagramCircleMovieModes.consolidateThePair:
        return [PaintingStyle.fill, PaintingStyle.stroke];
      case PresetDiagramCircleMovieModes.trioExpansion:
        return [
          PaintingStyle.fill,
          PaintingStyle.stroke,
          PaintingStyle.stroke,
        ];
      case PresetDiagramCircleMovieModes.trioConsolidation:
        return [
          PaintingStyle.fill,
          PaintingStyle.stroke,
          PaintingStyle.stroke,
        ];
      case PresetDiagramCircleMovieModes.fourWayExpansion:
        return [
          PaintingStyle.fill,
          PaintingStyle.stroke,
          PaintingStyle.stroke,
          PaintingStyle.stroke,
        ];
      case PresetDiagramCircleMovieModes.fourWayConsolidation:
        return [
          PaintingStyle.fill,
          PaintingStyle.stroke,
          PaintingStyle.stroke,
          PaintingStyle.stroke,
        ];
      case PresetDiagramCircleMovieModes.whiteToHalfAndHalfCircle:
        return [PaintingStyle.fill];
    }
  }
}

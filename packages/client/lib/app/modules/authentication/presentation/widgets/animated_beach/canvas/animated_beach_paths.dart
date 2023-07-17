import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/canvas/constants/beach_items.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/canvas/constants/raw_beach_paths.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/canvas/constants/beach_path_id.dart';

class AnimatedBeachPaths {
  static List<BeachPathId> get list => [
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path1(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path1Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path2(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path2Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path3(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path3Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path4(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path4Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path5(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path5Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path6(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path6Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path7(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path7Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path8(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path8Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path9(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path9Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path10(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path10Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path11(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path11Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path12(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path12Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path13(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path13Fill(size);
          },
        ),
        BeachPathId(
          isInteractable: false,
          indexIdentifier: 0,
          shapeTypes: BeachItems.drySand,
          pathInformation: (Size size) {
            return RawBeachPaths.path14(size);
          },
          fillInformation: (Size size) {
            return RawBeachPaths.path14Fill(size);
          },
        ),
      ];
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

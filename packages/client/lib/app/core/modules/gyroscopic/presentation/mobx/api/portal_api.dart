// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
// import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
// * Equatable Import
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
import 'package:nokhte/app/core/modules/gyroscopic/utils/drawing_utils.dart';
import 'package:nokhte/app/core/modules/gyroscopic/utils/utils.dart';
import 'package:nokhte/app/core/types/types.dart';
// * Mobx Codegen Inclusion
part 'portal_api.g.dart';

class PortalAPI = _PortalAPIBase with _$PortalAPI;

abstract class _PortalAPIBase extends Equatable with Store {
  final QuadrantAPI quadrantAPI;

  _PortalAPIBase({required this.quadrantAPI});

  @observable
  DrawingStatus drawingMode = DrawingStatus.hasNotDrawn;

  @observable
  List<int> visitedQuadrantsList = [];

  setupTheStream() async {
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: 18,
      quadrantSpread: 20,
      startingQuadrant: 10,
      negativeModeBehavior: NegativeModeBehaviors.indexNegativeQuadrants,
    );
    reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
      Timer.periodic(Seconds.get(60), (timer) {
        visitedQuadrantsList.clear();
        quadrantAPI.resetTheQuadrantLayout(
          numberOfQuadrants: 18,
          quadrantSpread: 20,
          startingQuadrant: 10,
        );
      });
      if (p0 > 0) {
        visitedQuadrantsList.add(p0);
        visitedQuadrantsList =
            GyroscopeUtils.includeNegativeQuads(visitedQuadrantsList, 17, 14);
        final drawingStatus =
            DrawingUtils.decideIfTheyHaveDrawnACircle(visitedQuadrantsList, 10);
        // print("$visitedQuadrantsList $drawingStatus");
        if (drawingStatus == DrawingStatus.hasDrawn) {
          drawingMode = DrawingStatus.hasDrawn;
          // print("congrats you drew a circle $visitedQuadrantsList");
        }
      }
    });
  }

  @override
  List<Object> get props => [];
}

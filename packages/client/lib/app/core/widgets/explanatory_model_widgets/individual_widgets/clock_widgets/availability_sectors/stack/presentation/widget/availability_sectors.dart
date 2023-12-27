import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import 'canvas/availability_sectors_painter.dart';

class AvailabilitySectors extends StatelessWidget {
  final AvailabilitySectorsStore store;
  const AvailabilitySectors({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => AnimatedOpacity(
            opacity: useWidgetOpacity(store.showWidget),
            duration: Seconds.get(0, milli: 500),
            child: CustomAnimationBuilder(
              tween: store.movie,
              duration: store.movie.duration,
              control: store.control,
              builder: (context, value, child) => FullScreen(
                child: CustomPaint(
                  painter: AvailabilitySectorsPainter(
                    redSectorLengths: [
                      value.get(
                          AvailabilitySectorMovieProperties.redSector1Length),
                      value.get(
                          AvailabilitySectorMovieProperties.redSector2Length),
                      value.get(
                          AvailabilitySectorMovieProperties.redSector3Length),
                    ],
                    redSectorGradients: [
                      [
                        value.get(
                          AvailabilitySectorMovieProperties.redSector1Color1,
                        ),
                        value.get(
                          AvailabilitySectorMovieProperties.redSector1Color2,
                        )
                      ],
                      [
                        value.get(
                          AvailabilitySectorMovieProperties.redSector2Color1,
                        ),
                        value.get(
                          AvailabilitySectorMovieProperties.redSector2Color2,
                        ),
                      ],
                      [
                        value.get(
                          AvailabilitySectorMovieProperties.redSector3Color1,
                        ),
                        value.get(
                          AvailabilitySectorMovieProperties.redSector3Color2,
                        )
                      ]
                    ],
                    redSectorRadii: [
                      value.get(
                        AvailabilitySectorMovieProperties
                            .redSector1RadiusScalingFactor,
                      ),
                      value.get(
                        AvailabilitySectorMovieProperties
                            .redSector2RadiusScalingFactor,
                      ),
                      value.get(
                        AvailabilitySectorMovieProperties
                            .redSector3RadiusScalingFactor,
                      ),
                    ],
                    blueSectorLengths: [
                      value.get(
                          AvailabilitySectorMovieProperties.blueSector1Length),
                      value.get(
                          AvailabilitySectorMovieProperties.blueSector2Length),
                      value.get(
                          AvailabilitySectorMovieProperties.blueSector3Length),
                    ],
                    blueSectorGradients: [
                      [
                        value.get(
                          AvailabilitySectorMovieProperties.blueSector1Color1,
                        ),
                        value.get(
                          AvailabilitySectorMovieProperties.blueSector1Color2,
                        )
                      ],
                      [
                        value.get(
                          AvailabilitySectorMovieProperties.blueSector2Color1,
                        ),
                        value.get(
                          AvailabilitySectorMovieProperties.blueSector2Color2,
                        ),
                      ],
                      [
                        value.get(
                          AvailabilitySectorMovieProperties.blueSector3Color1,
                        ),
                        value.get(
                          AvailabilitySectorMovieProperties.blueSector3Color2,
                        )
                      ]
                    ],
                    blueSectorRadii: [
                      value.get(
                        AvailabilitySectorMovieProperties
                            .blueSector1RadiusScalingFactor,
                      ),
                      value.get(
                        AvailabilitySectorMovieProperties
                            .blueSector2RadiusScalingFactor,
                      ),
                      value.get(
                        AvailabilitySectorMovieProperties
                            .blueSector3RadiusScalingFactor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}

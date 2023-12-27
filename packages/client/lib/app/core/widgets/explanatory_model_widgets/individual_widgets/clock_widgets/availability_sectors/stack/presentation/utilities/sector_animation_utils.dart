import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class SectorAnimationUtils {
  static List<double> getRedSectorLengths(Movie value) => [
        value.get(AvailabilitySectorMovieProperties.redSector1Length),
        value.get(AvailabilitySectorMovieProperties.redSector2Length),
        value.get(AvailabilitySectorMovieProperties.redSector3Length),
      ];

  static List<List<Color>> getRedSectorGradients(Movie value) => [
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
      ];
  static List<double> getRedSectorRadii(Movie value) => [
        value.get(
          AvailabilitySectorMovieProperties.redSector1RadiusScalingFactor,
        ),
        value.get(
          AvailabilitySectorMovieProperties.redSector2RadiusScalingFactor,
        ),
        value.get(
          AvailabilitySectorMovieProperties.redSector3RadiusScalingFactor,
        ),
      ];
  static List<double> getBlueSectorLengths(Movie value) => [
        value.get(AvailabilitySectorMovieProperties.blueSector1Length),
        value.get(AvailabilitySectorMovieProperties.blueSector2Length),
        value.get(AvailabilitySectorMovieProperties.blueSector3Length),
      ];
  static List<List<Color>> getBlueSectorGradients(Movie value) => [
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
      ];
  static List<double> getBlueSectorRadii(Movie value) => [
        value.get(
          AvailabilitySectorMovieProperties.blueSector1RadiusScalingFactor,
        ),
        value.get(
          AvailabilitySectorMovieProperties.blueSector2RadiusScalingFactor,
        ),
        value.get(
          AvailabilitySectorMovieProperties.blueSector3RadiusScalingFactor,
        ),
      ];
}

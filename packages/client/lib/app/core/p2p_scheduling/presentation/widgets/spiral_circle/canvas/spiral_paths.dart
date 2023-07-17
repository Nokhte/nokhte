// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_local_variable
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/p2p_scheduling_canvas_entity.dart';

enum Circles { outerCircle, spiralCircle, spiralCircleBorder }

class PathId<T> {
  final bool isInteractable;
  final int indexIdentifier;
  final T circleType;
  final Function pathInformation;
  final Function fillInformation;

  PathId({
    required this.isInteractable,
    required this.indexIdentifier,
    required this.circleType,
    required this.pathInformation,
    required this.fillInformation,
  });
}

class SpiralPaths {
  static List<PathId<Circles>> get list => [
        PathId(
          indexIdentifier: 0,
          isInteractable: false,
          circleType: Circles.outerCircle,
          pathInformation: (Size size) {
            Path path_0 = Path();

            path_0.moveTo(size.width, size.height * 0.5000000);
            path_0.cubicTo(
                size.width,
                size.height * 0.7761429,
                size.width * 0.7761429,
                size.height,
                size.width * 0.5000000,
                size.height);
            path_0.cubicTo(size.width * 0.2238577, size.height, 0,
                size.height * 0.7761429, 0, size.height * 0.5000000);
            path_0.cubicTo(0, size.height * 0.2238577, size.width * 0.2238577,
                0, size.width * 0.5000000, 0);
            path_0.cubicTo(size.width * 0.7761429, 0, size.width,
                size.height * 0.2238577, size.width, size.height * 0.5000000);
            path_0.close();
            return path_0;
          },
          fillInformation: (Size size) {
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                something = Left(
              IndividualSpiralCircleFill(
                fillColor: Colors.white,
              ),
            );
            Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
            paint_0_fill.color = Colors.white.withOpacity(0.45);
            return paint_0_fill;
          },
        ),

        //
        PathId(
          isInteractable: true,
          indexIdentifier: 48,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_1 = Path();
            path_1.moveTo(size.width * 0.4258057, size.height * 0.2305903);
            path_1.cubicTo(
                size.width * 0.4009886,
                size.height * 0.2286277,
                size.width * 0.3817714,
                size.height * 0.2079960,
                size.width * 0.3815771,
                size.height * 0.1831057);
            path_1.lineTo(size.width * 0.3809029, size.height * 0.09664371);
            path_1.cubicTo(
                size.width * 0.3808200,
                size.height * 0.08594600,
                size.width * 0.3936914,
                size.height * 0.08048771,
                size.width * 0.4013457,
                size.height * 0.08797543);
            path_1.cubicTo(
                size.width * 0.4070514,
                size.height * 0.09355600,
                size.width * 0.4164971,
                size.height * 0.09215657,
                size.width * 0.4203171,
                size.height * 0.08516543);
            path_1.lineTo(size.width * 0.4247857, size.height * 0.07698686);
            path_1.cubicTo(
                size.width * 0.4248829,
                size.height * 0.07681086,
                size.width * 0.4250800,
                size.height * 0.07671400,
                size.width * 0.4252771,
                size.height * 0.07674514);
            path_1.lineTo(size.width * 0.4277429, size.height * 0.07713086);
            path_1.cubicTo(
                size.width * 0.4280029,
                size.height * 0.07717143,
                size.width * 0.4280971,
                size.height * 0.07680486,
                size.width * 0.4278543,
                size.height * 0.07671200);
            path_1.cubicTo(
                size.width * 0.4278200,
                size.height * 0.07669971,
                size.width * 0.4277857,
                size.height * 0.07669543,
                size.width * 0.4277514,
                size.height * 0.07669943);
            path_1.lineTo(size.width * 0.4273286, size.height * 0.07674771);
            path_1.cubicTo(
                size.width * 0.4250257,
                size.height * 0.07701200,
                size.width * 0.4242400,
                size.height * 0.07376714,
                size.width * 0.4264086,
                size.height * 0.07295314);
            path_1.lineTo(size.width * 0.4342857, size.height * 0.07000000);
            path_1.cubicTo(
                size.width * 0.4399714,
                size.height * 0.06810400,
                size.width * 0.4458943,
                size.height * 0.06699086,
                size.width * 0.4518829,
                size.height * 0.06669143);
            path_1.lineTo(size.width * 0.4714286, size.height * 0.06571429);
            path_1.lineTo(size.width * 0.4915857, size.height * 0.06571429);
            path_1.cubicTo(
                size.width * 0.5342314,
                size.height * 0.06621514,
                size.width * 0.5686743,
                size.height * 0.1007917,
                size.width * 0.5690057,
                size.height * 0.1434394);
            path_1.lineTo(size.width * 0.5690229, size.height * 0.1456283);
            path_1.cubicTo(
                size.width * 0.5693686,
                size.height * 0.1900183,
                size.width * 0.5336886,
                size.height * 0.2262343,
                size.width * 0.4892971,
                size.height * 0.2265486);
            path_1.lineTo(size.width * 0.4797429, size.height * 0.2266163);
            path_1.lineTo(size.width * 0.4336771, size.height * 0.2305646);
            path_1.cubicTo(
                size.width * 0.4310571,
                size.height * 0.2307891,
                size.width * 0.4284257,
                size.height * 0.2307977,
                size.width * 0.4258057,
                size.height * 0.2305903);
            path_1.close();
            return path_1;
          },

          // % Circle 48

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(142.2, 24.5, 212.6, 86.2);
              const gradAngle = 6.340719988963796;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        //
        PathId(
            isInteractable: true,
            indexIdentifier: 47,
            circleType: Circles.spiralCircle,
            pathInformation: (Size size) {
              Path path_2 = Path();
              path_2.moveTo(size.width * 0.3931286, size.height * 0.2399491);
              path_2.cubicTo(
                  size.width * 0.3734514,
                  size.height * 0.2430931,
                  size.width * 0.3548657,
                  size.height * 0.2298983,
                  size.width * 0.3513429,
                  size.height * 0.2102857);
              path_2.lineTo(size.width * 0.3436343, size.height * 0.1673423);
              path_2.cubicTo(
                  size.width * 0.3357343,
                  size.height * 0.1233291,
                  size.width * 0.3650171,
                  size.height * 0.08128571,
                  size.width * 0.4090400,
                  size.height * 0.07343571);
              path_2.lineTo(size.width * 0.4343371, size.height * 0.06892429);
              path_2.cubicTo(
                  size.width * 0.4784200,
                  size.height * 0.06106371,
                  size.width * 0.5205686,
                  size.height * 0.09041943,
                  size.width * 0.5284800,
                  size.height * 0.1344923);
              path_2.lineTo(size.width * 0.5294457, size.height * 0.1398697);
              path_2.cubicTo(
                  size.width * 0.5367057,
                  size.height * 0.1803094,
                  size.width * 0.5102886,
                  size.height * 0.2190929,
                  size.width * 0.4700000,
                  size.height * 0.2271431);
              path_2.cubicTo(
                  size.width * 0.4585857,
                  size.height * 0.2280940,
                  size.width * 0.4472600,
                  size.height * 0.2298883,
                  size.width * 0.4361143,
                  size.height * 0.2325109);
              path_2.lineTo(size.width * 0.4285714, size.height * 0.2342857);
              path_2.lineTo(size.width * 0.4162771, size.height * 0.2379743);
              path_2.cubicTo(
                  size.width * 0.4149914,
                  size.height * 0.2383603,
                  size.width * 0.4136114,
                  size.height * 0.2382851,
                  size.width * 0.4123743,
                  size.height * 0.2377620);
              path_2.cubicTo(
                  size.width * 0.4113771,
                  size.height * 0.2373409,
                  size.width * 0.4102829,
                  size.height * 0.2372077,
                  size.width * 0.4092171,
                  size.height * 0.2373783);
              path_2.lineTo(size.width * 0.3931286, size.height * 0.2399491);
              path_2.close();
              return path_2;
            },

            // % Circle 47
            fillInformation: (
              Size size,
              Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                  eitherGradOrColor,
            ) {
              late Paint paint_2_fill;
              eitherGradOrColor.fold((fill) {
                paint_2_fill = Paint()..style = PaintingStyle.fill;
                paint_2_fill.color = fill.fillColor;
              }, (gradient) {
                final rect = Rect.fromLTRB(125.3, 22.8, 200.4, 90.8);
                const gradAngle = 6.2;
                paint_2_fill = Paint()
                  ..shader = LinearGradient(
                    colors: gradient.gradientColors,
                    stops: gradient.stops,
                    transform: GradientRotation(
                      gradAngle,
                    ),
                  ).createShader(rect);
              });
              return paint_2_fill;
            }),

        PathId(
          isInteractable: true,
          indexIdentifier: 46,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_3 = Path();
            path_3.moveTo(size.width * 0.3669914, size.height * 0.2541383);
            path_3.cubicTo(
                size.width * 0.3408800,
                size.height * 0.2627329,
                size.width * 0.3127200,
                size.height * 0.2485249,
                size.width * 0.3041143,
                size.height * 0.2224169);
            path_3.lineTo(size.width * 0.2774649, size.height * 0.1415443);
            path_3.cubicTo(
                size.width * 0.2734989,
                size.height * 0.1295086,
                size.width * 0.2831714,
                size.height * 0.1173691,
                size.width * 0.2957971,
                size.height * 0.1185371);
            path_3.cubicTo(
                size.width * 0.3016029,
                size.height * 0.1190743,
                size.width * 0.3072943,
                size.height * 0.1167074,
                size.width * 0.3109971,
                size.height * 0.1122151);
            path_3.lineTo(size.width * 0.3140086, size.height * 0.1085666);
            path_3.cubicTo(
                size.width * 0.3168743,
                size.height * 0.1050906,
                size.width * 0.3205800,
                size.height * 0.1024023,
                size.width * 0.3247771,
                size.height * 0.1007551);
            path_3.lineTo(size.width * 0.3595000, size.height * 0.08712629);
            path_3.lineTo(size.width * 0.3805829, size.height * 0.08006029);
            path_3.cubicTo(
                size.width * 0.4229686,
                size.height * 0.06585286,
                size.width * 0.4688714,
                size.height * 0.08885486,
                size.width * 0.4828629,
                size.height * 0.1313146);
            path_3.cubicTo(
                size.width * 0.4968029,
                size.height * 0.1736120,
                size.width * 0.4737657,
                size.height * 0.2191446,
                size.width * 0.4314314,
                size.height * 0.2329714);
            path_3.lineTo(size.width * 0.4142857, size.height * 0.2385717);
            path_3.lineTo(size.width * 0.3971429, size.height * 0.2442854);
            path_3.lineTo(size.width * 0.3922571, size.height * 0.2463206);
            path_3.cubicTo(
                size.width * 0.3841029,
                size.height * 0.2497183,
                size.width * 0.3756429,
                size.height * 0.2523360,
                size.width * 0.3669914,
                size.height * 0.2541383);
            path_3.close();

            return path_3;
          },
          // % Circle 46
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_3_fill;

            eitherGradOrColor.fold((fill) {
              paint_3_fill = Paint()..style = PaintingStyle.fill;
              paint_3_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(102.1, 24.6, 185.5, 98.1);
              const gradAngle = 5.9805454560385966;
              paint_3_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_3_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 45,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_4 = Path();
            path_4.moveTo(size.width * 0.3273514, size.height * 0.2814497);
            path_4.cubicTo(
                size.width * 0.2962771,
                size.height * 0.2973343,
                size.width * 0.2581626,
                size.height * 0.2850097,
                size.width * 0.2422700,
                size.height * 0.2539411);
            path_4.lineTo(size.width * 0.2148300, size.height * 0.2002991);
            path_4.cubicTo(
                size.width * 0.2063823,
                size.height * 0.1837843,
                size.width * 0.2180920,
                size.height * 0.1641457,
                size.width * 0.2366511,
                size.height * 0.1637034);
            path_4.lineTo(size.width * 0.2497923, size.height * 0.1633900);
            path_4.cubicTo(
                size.width * 0.2591814,
                size.height * 0.1631663,
                size.width * 0.2659363,
                size.height * 0.1543163,
                size.width * 0.2636649,
                size.height * 0.1452149);
            path_4.cubicTo(
                size.width * 0.2620629,
                size.height * 0.1387957,
                size.width * 0.2649651,
                size.height * 0.1321057,
                size.width * 0.2707486,
                size.height * 0.1288874);
            path_4.lineTo(size.width * 0.3123686, size.height * 0.1057257);
            path_4.lineTo(size.width * 0.3275771, size.height * 0.09798429);
            path_4.cubicTo(
                size.width * 0.3673857,
                size.height * 0.07771971,
                size.width * 0.4161486,
                size.height * 0.09353086,
                size.width * 0.4364914,
                size.height * 0.1332989);
            path_4.cubicTo(
                size.width * 0.4571400,
                size.height * 0.1736680,
                size.width * 0.4405400,
                size.height * 0.2230577,
                size.width * 0.3997000,
                size.height * 0.2427629);
            path_4.lineTo(size.width * 0.3728571, size.height * 0.2557146);
            path_4.lineTo(size.width * 0.3542857, size.height * 0.2657143);
            path_4.lineTo(size.width * 0.3385714, size.height * 0.2757143);
            path_4.lineTo(size.width * 0.3273514, size.height * 0.2814497);
            path_4.close();
            return path_4;
          },
          // % Circle 45
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(77.1, 29.0, 170.7, 111.0);
              const gradAngle = 5.8621949049026013;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 44,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_5 = Path();
            path_5.moveTo(size.width * 0.3010800, size.height * 0.2991429);
            path_5.cubicTo(
                size.width * 0.2784183,
                size.height * 0.3120314,
                size.width * 0.2495523,
                size.height * 0.3043086,
                size.width * 0.2363569,
                size.height * 0.2818223);
            path_5.lineTo(size.width * 0.2023243, size.height * 0.2238317);
            path_5.cubicTo(
                size.width * 0.1900269,
                size.height * 0.2028771,
                size.width * 0.2001780,
                size.height * 0.1759726,
                size.width * 0.2232600,
                size.height * 0.1683437);
            path_5.cubicTo(
                size.width * 0.2310400,
                size.height * 0.1657723,
                size.width * 0.2377829,
                size.height * 0.1607751,
                size.width * 0.2424949,
                size.height * 0.1540883);
            path_5.lineTo(size.width * 0.2455034, size.height * 0.1498191);
            path_5.cubicTo(
                size.width * 0.2500323,
                size.height * 0.1433923,
                size.width * 0.2559146,
                size.height * 0.1380311,
                size.width * 0.2627397,
                size.height * 0.1341106);
            path_5.lineTo(size.width * 0.2873343, size.height * 0.1199814);
            path_5.cubicTo(
                size.width * 0.3253286,
                size.height * 0.09815457,
                size.width * 0.3739057,
                size.height * 0.1110420,
                size.width * 0.3960829,
                size.height * 0.1488331);
            path_5.cubicTo(
                size.width * 0.4188629,
                size.height * 0.1876511,
                size.width * 0.4049514,
                size.height * 0.2375274,
                size.width * 0.3653657,
                size.height * 0.2589531);
            path_5.lineTo(size.width * 0.3475171, size.height * 0.2686143);
            path_5.lineTo(size.width * 0.3270486, size.height * 0.2810369);
            path_5.lineTo(size.width * 0.3010800, size.height * 0.2991429);
            path_5.close();

            return path_5;
          },

          // % circle 44
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(70.9, 36.6, 156.4, 116.5);
              const gradAngle = 5.7421162523653914;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 43,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_6 = Path();
            path_6.moveTo(size.width * 0.2948800, size.height * 0.3127600);
            path_6.cubicTo(
                size.width * 0.2691614,
                size.height * 0.3362714,
                size.width * 0.2290903,
                size.height * 0.3341657,
                size.width * 0.2059734,
                size.height * 0.3080886);
            path_6.lineTo(size.width * 0.1678151, size.height * 0.2650437);
            path_6.cubicTo(
                size.width * 0.1558489,
                size.height * 0.2515449,
                size.width * 0.1617803,
                size.height * 0.2302411,
                size.width * 0.1790109,
                size.height * 0.2248326);
            path_6.cubicTo(
                size.width * 0.1880820,
                size.height * 0.2219851,
                size.width * 0.1947397,
                size.height * 0.2142446,
                size.width * 0.1961791,
                size.height * 0.2048720);
            path_6.lineTo(size.width * 0.1973849, size.height * 0.1970220);
            path_6.cubicTo(
                size.width * 0.1987743,
                size.height * 0.1879743,
                size.width * 0.2034234,
                size.height * 0.1797423,
                size.width * 0.2104620,
                size.height * 0.1738669);
            path_6.lineTo(size.width * 0.2338197, size.height * 0.1543691);
            path_6.lineTo(size.width * 0.2374480, size.height * 0.1512511);
            path_6.cubicTo(
                size.width * 0.2710360,
                size.height * 0.1223857,
                size.width * 0.3219457,
                size.height * 0.1261326,
                size.width * 0.3513229,
                size.height * 0.1592720);
            path_6.cubicTo(
                size.width * 0.3802743,
                size.height * 0.1919311,
                size.width * 0.3779314,
                size.height * 0.2419871,
                size.width * 0.3457171,
                size.height * 0.2714286);
            path_6.lineTo(size.width * 0.3185714, size.height * 0.2914286);
            path_6.lineTo(size.width * 0.3057143, size.height * 0.3028571);
            path_6.lineTo(size.width * 0.2948800, size.height * 0.3127600);
            path_6.close();
            return path_6;
          },

          // % Circle 43

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(58.2, 45.7, 142.0, 125.5);
              const gradAngle = 5.644210647467785;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 42,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_7 = Path();
            path_7.moveTo(size.width * 0.2552729, size.height * 0.3671457);
            path_7.cubicTo(
                size.width * 0.2368409,
                size.height * 0.3847543,
                size.width * 0.2080166,
                size.height * 0.3855429,
                size.width * 0.1886600,
                size.height * 0.3689686);
            path_7.lineTo(size.width * 0.1657706, size.height * 0.3493686);
            path_7.cubicTo(
                size.width * 0.1311169,
                size.height * 0.3196943,
                size.width * 0.1271249,
                size.height * 0.2676440,
                size.width * 0.1568486,
                size.height * 0.2330343);
            path_7.lineTo(size.width * 0.1650346, size.height * 0.2235023);
            path_7.lineTo(size.width * 0.1821740, size.height * 0.2034726);
            path_7.lineTo(size.width * 0.1878871, size.height * 0.1977497);
            path_7.lineTo(size.width * 0.1941017, size.height * 0.1904857);
            path_7.cubicTo(
                size.width * 0.2232454,
                size.height * 0.1564214,
                size.width * 0.2745983,
                size.height * 0.1524346,
                size.width * 0.3086514,
                size.height * 0.1815926);
            path_7.lineTo(size.width * 0.3161171, size.height * 0.1879866);
            path_7.cubicTo(
                size.width * 0.3444943,
                size.height * 0.2122829,
                size.width * 0.3489343,
                size.height * 0.2544263,
                size.width * 0.3262486,
                size.height * 0.2840954);
            path_7.lineTo(size.width * 0.2926343, size.height * 0.3190314);
            path_7.lineTo(size.width * 0.2821737, size.height * 0.3302971);
            path_7.cubicTo(
                size.width * 0.2767817,
                size.height * 0.3361057,
                size.width * 0.2720274,
                size.height * 0.3424686,
                size.width * 0.2679923,
                size.height * 0.3492829);
            path_7.lineTo(size.width * 0.2636691, size.height * 0.3565829);
            path_7.cubicTo(
                size.width * 0.2613671,
                size.height * 0.3604686,
                size.width * 0.2585423,
                size.height * 0.3640229,
                size.width * 0.2552729,
                size.height * 0.3671457);
            return path_7;
          },

          // % Circle 42

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(47.5, 56.9, 130.3, 143.9);
              const gradAngle = 5.572484981350093;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 41,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_8 = Path();
            path_8.moveTo(size.width * 0.2408871, size.height * 0.3891286);
            path_8.cubicTo(
                size.width * 0.2226780,
                size.height * 0.4074143,
                size.width * 0.1930977,
                size.height * 0.4076600,
                size.width * 0.1746077,
                size.height * 0.3896771);
            path_8.lineTo(size.width * 0.1199977, size.height * 0.3365686);
            path_8.cubicTo(
                size.width * 0.1126280,
                size.height * 0.3294029,
                size.width * 0.1151877,
                size.height * 0.3170286,
                size.width * 0.1248026,
                size.height * 0.3133457);
            path_8.lineTo(size.width * 0.1374560, size.height * 0.3084971);
            path_8.cubicTo(
                size.width * 0.1475157,
                size.height * 0.3046429,
                size.width * 0.1459491,
                size.height * 0.2899943,
                size.width * 0.1353020,
                size.height * 0.2883543);
            path_8.cubicTo(
                size.width * 0.1280723,
                size.height * 0.2872400,
                size.width * 0.1241703,
                size.height * 0.2792857,
                size.width * 0.1277249,
                size.height * 0.2729077);
            path_8.lineTo(size.width * 0.1337509, size.height * 0.2620949);
            path_8.lineTo(size.width * 0.1393080, size.height * 0.2543851);
            path_8.lineTo(size.width * 0.1466806, size.height * 0.2431329);
            path_8.lineTo(size.width * 0.1590271, size.height * 0.2283851);
            path_8.cubicTo(
                size.width * 0.1871929,
                size.height * 0.1947411,
                size.width * 0.2372971,
                size.height * 0.1900426,
                size.width * 0.2712254,
                size.height * 0.2178634);
            path_8.cubicTo(
                size.width * 0.3057486,
                size.height * 0.2461714,
                size.width * 0.3102657,
                size.height * 0.2972143,
                size.width * 0.2812517,
                size.height * 0.3311486);
            path_8.lineTo(size.width * 0.2785703, size.height * 0.3342857);
            path_8.lineTo(size.width * 0.2685703, size.height * 0.3485714);
            path_8.lineTo(size.width * 0.2469231, size.height * 0.3816829);
            path_8.cubicTo(
                size.width * 0.2451709,
                size.height * 0.3843629,
                size.width * 0.2431483,
                size.height * 0.3868571,
                size.width * 0.2408871,
                size.height * 0.3891286);

            return path_8;
          },

          // % Circle 41
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(42.0, 71.0, 115.8, 152.2);
              const gradAngle = 5.3197244146762315;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 40,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_9 = Path();

            path_9.moveTo(size.width * 0.2194751, size.height * 0.4364114);
            path_9.cubicTo(
                size.width * 0.2084823,
                size.height * 0.4557086,
                size.width * 0.1838563,
                size.height * 0.4624086,
                size.width * 0.1646014,
                size.height * 0.4513429);
            path_9.lineTo(size.width * 0.1050940, size.height * 0.4171429);
            path_9.cubicTo(
                size.width * 0.09092086,
                size.height * 0.4089971,
                size.width * 0.09529171,
                size.height * 0.3875314,
                size.width * 0.1115349,
                size.height * 0.3855086);
            path_9.cubicTo(
                size.width * 0.1266174,
                size.height * 0.3836314,
                size.width * 0.1319200,
                size.height * 0.3645000,
                size.width * 0.1199383,
                size.height * 0.3551914);
            path_9.lineTo(size.width * 0.1167731, size.height * 0.3527314);
            path_9.cubicTo(
                size.width * 0.1147426,
                size.height * 0.3511543,
                size.width * 0.1121460,
                size.height * 0.3504886,
                size.width * 0.1096020,
                size.height * 0.3508943);
            path_9.cubicTo(
                size.width * 0.1060829,
                size.height * 0.3514514,
                size.width * 0.1025557,
                size.height * 0.3499571,
                size.width * 0.1005197,
                size.height * 0.3470429);
            path_9.lineTo(size.width * 0.09869143, size.height * 0.3444257);
            path_9.cubicTo(
                size.width * 0.09570314,
                size.height * 0.3401514,
                size.width * 0.09527343,
                size.height * 0.3345914,
                size.width * 0.09756857,
                size.height * 0.3299029);
            path_9.lineTo(size.width * 0.1152731, size.height * 0.2937229);
            path_9.lineTo(size.width * 0.1205620, size.height * 0.2844546);
            path_9.cubicTo(
                size.width * 0.1426191,
                size.height * 0.2479220,
                size.width * 0.1902240,
                size.height * 0.2357691,
                size.width * 0.2273734,
                size.height * 0.2567643);
            path_9.cubicTo(
                size.width * 0.2662757,
                size.height * 0.2787500,
                size.width * 0.2798563,
                size.height * 0.3286114,
                size.width * 0.2569426,
                size.height * 0.3669771);
            path_9.lineTo(size.width * 0.2542849, size.height * 0.3714286);
            path_9.lineTo(size.width * 0.2442854, size.height * 0.3928571);
            path_9.lineTo(size.width * 0.2194751, size.height * 0.4364114);
            path_9.close();

            return path_9;
          },
          // % Circle 40

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(33.9, 88.0, 104.5, 172.6);
              const gradAngle = 5.2311206780778273;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 39,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_10 = Path();
            path_10.moveTo(size.width * 0.2236446, size.height * 0.4589657);
            path_10.cubicTo(
                size.width * 0.2142874,
                size.height * 0.4791829,
                size.width * 0.1907203,
                size.height * 0.4885714,
                size.width * 0.1700271,
                size.height * 0.4803286);
            path_10.lineTo(size.width * 0.08044486, size.height * 0.4446371);
            path_10.cubicTo(
                size.width * 0.07224029,
                size.height * 0.4413686,
                size.width * 0.07189571,
                size.height * 0.4299029,
                size.width * 0.07988857,
                size.height * 0.4261171);
            path_10.lineTo(size.width * 0.09411571, size.height * 0.4193829);
            path_10.cubicTo(
                size.width * 0.1028886,
                size.height * 0.4152286,
                size.width * 0.09848857,
                size.height * 0.4020029,
                size.width * 0.08897857,
                size.height * 0.4039400);
            path_10.cubicTo(
                size.width * 0.08856257,
                size.height * 0.4040257,
                size.width * 0.08814057,
                size.height * 0.4040771,
                size.width * 0.08771657,
                size.height * 0.4040971);
            path_10.lineTo(size.width * 0.08755829, size.height * 0.4041057);
            path_10.cubicTo(
                size.width * 0.08071257,
                size.height * 0.4044229,
                size.width * 0.07549971,
                size.height * 0.3980771,
                size.width * 0.07715000,
                size.height * 0.3914371);
            path_10.lineTo(size.width * 0.07857143, size.height * 0.3857143);
            path_10.lineTo(size.width * 0.08714286, size.height * 0.3571429);
            path_10.lineTo(size.width * 0.09000000, size.height * 0.3485714);
            path_10.lineTo(size.width * 0.09428571, size.height * 0.3385714);
            path_10.cubicTo(
                size.width * 0.1114094,
                size.height * 0.3011429,
                size.width * 0.1549414,
                size.height * 0.2836883,
                size.width * 0.1931726,
                size.height * 0.2989200);
            path_10.lineTo(size.width * 0.2022109, size.height * 0.3025200);
            path_10.cubicTo(
                size.width * 0.2407411,
                size.height * 0.3178714,
                size.width * 0.2585894,
                size.height * 0.3622343,
                size.width * 0.2414286,
                size.height * 0.4000000);
            path_10.lineTo(size.width * 0.2341006, size.height * 0.4212229);
            path_10.lineTo(size.width * 0.2261840, size.height * 0.4518571);
            path_10.cubicTo(
                size.width * 0.2255534,
                size.height * 0.4542971,
                size.width * 0.2247037,
                size.height * 0.4566771,
                size.width * 0.2236446,
                size.height * 0.4589657);

            return path_10;
          },
          // % Circle 39

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(26.8, 105.9, 96.5, 182.4);
              const gradAngle = 5.100402883242727;

              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 38,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_11 = Path();
            path_11.moveTo(size.width * 0.2205837, size.height * 0.4932914);
            path_11.cubicTo(
                size.width * 0.2145474,
                size.height * 0.5057971,
                size.width * 0.2006349,
                size.height * 0.5124543,
                size.width * 0.1871146,
                size.height * 0.5093057);
            path_11.lineTo(size.width * 0.1082337, size.height * 0.4909400);
            path_11.cubicTo(
                size.width * 0.1072240,
                size.height * 0.4907029,
                size.width * 0.1062566,
                size.height * 0.4903143,
                size.width * 0.1053649,
                size.height * 0.4897886);
            path_11.lineTo(size.width * 0.07246343, size.height * 0.4703143);
            path_11.cubicTo(
                size.width * 0.07042371,
                size.height * 0.4691057,
                size.width * 0.07150114,
                size.height * 0.4659686,
                size.width * 0.07385514,
                size.height * 0.4662629);
            path_11.cubicTo(
                size.width * 0.06908514,
                size.height * 0.4656714,
                size.width * 0.06566086,
                size.height * 0.4613914,
                size.width * 0.06613200,
                size.height * 0.4566114);
            path_11.lineTo(size.width * 0.06814200, size.height * 0.4362171);
            path_11.lineTo(size.width * 0.07528343, size.height * 0.3990200);
            path_11.cubicTo(
                size.width * 0.08631714,
                size.height * 0.3584629,
                size.width * 0.1281366,
                size.height * 0.3344457,
                size.width * 0.1687263,
                size.height * 0.3453486);
            path_11.lineTo(size.width * 0.1778260, size.height * 0.3477943);
            path_11.cubicTo(
                size.width * 0.2175460,
                size.height * 0.3584657,
                size.width * 0.2406677,
                size.height * 0.3996800,
                size.width * 0.2290729,
                size.height * 0.4391400);
            path_11.cubicTo(
                size.width * 0.2277883,
                size.height * 0.4435143,
                size.width * 0.2269140,
                size.height * 0.4479943,
                size.width * 0.2264611,
                size.height * 0.4525286);
            path_11.lineTo(size.width * 0.2233829, size.height * 0.4833600);
            path_11.cubicTo(
                size.width * 0.2230386,
                size.height * 0.4868057,
                size.width * 0.2220911,
                size.height * 0.4901686,
                size.width * 0.2205837,
                size.height * 0.4932914);
            path_11.close();
            return path_11;
          },

          // % Circle 38
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(24.5, 124.9, 89.9, 191.3);
              const gradAngle = 5.111223924605092;

              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 37,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_12 = Path();
            path_12.moveTo(size.width * 0.2209109, size.height * 0.5176943);
            path_12.cubicTo(
                size.width * 0.2184294,
                size.height * 0.5420743,
                size.width * 0.1966469,
                size.height * 0.5598629,
                size.width * 0.1722629,
                size.height * 0.5574200);
            path_12.lineTo(size.width * 0.08974143, size.height * 0.5491600);
            path_12.cubicTo(
                size.width * 0.07855457,
                size.height * 0.5480400,
                size.width * 0.07463600,
                size.height * 0.5337400,
                size.width * 0.08368143,
                size.height * 0.5270457);
            path_12.lineTo(size.width * 0.08583629, size.height * 0.5254486);
            path_12.cubicTo(
                size.width * 0.09351114,
                size.height * 0.5197686,
                size.width * 0.09092171,
                size.height * 0.5077086,
                size.width * 0.08159743,
                size.height * 0.5057057);
            path_12.lineTo(size.width * 0.06397657, size.height * 0.5019200);
            path_12.cubicTo(
                size.width * 0.06378543,
                size.height * 0.5018800,
                size.width * 0.06370714,
                size.height * 0.5016486,
                size.width * 0.06383371,
                size.height * 0.5015000);
            path_12.cubicTo(
                size.width * 0.06401057,
                size.height * 0.5012886,
                size.width * 0.06434886,
                size.height * 0.5014629,
                size.width * 0.06428371,
                size.height * 0.5017286);
            path_12.lineTo(size.width * 0.06418057, size.height * 0.5021486);
            path_12.cubicTo(
                size.width * 0.06409257,
                size.height * 0.5025057,
                size.width * 0.06358600,
                size.height * 0.5025171,
                size.width * 0.06348314,
                size.height * 0.5021629);
            path_12.lineTo(size.width * 0.06289714, size.height * 0.5001371);
            path_12.cubicTo(
                size.width * 0.06287057,
                size.height * 0.5000457,
                size.width * 0.06285857,
                size.height * 0.4999514,
                size.width * 0.06286114,
                size.height * 0.4998571);
            path_12.lineTo(size.width * 0.06355457, size.height * 0.4742857);
            path_12.lineTo(size.width * 0.06428571, size.height * 0.4657143);
            path_12.cubicTo(
                size.width * 0.06976314,
                size.height * 0.4228057,
                size.width * 0.1085446,
                size.height * 0.3913314,
                size.width * 0.1515851,
                size.height * 0.3956400);
            path_12.lineTo(size.width * 0.1532494, size.height * 0.3958086);
            path_12.cubicTo(
                size.width * 0.1967851,
                size.height * 0.4001657,
                size.width * 0.2281797,
                size.height * 0.4394257,
                size.width * 0.2228571,
                size.height * 0.4828571);
            path_12.lineTo(size.width * 0.2228571, size.height * 0.4985714);
            path_12.lineTo(size.width * 0.2209109, size.height * 0.5176943);
            path_12.close();

            return path_12;
          },
          // % Circle 37

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(23.5, 146.1, 85.2, 209.0);
              const gradAngle = 4.8272883198627147;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),
        PathId(
          isInteractable: true,
          indexIdentifier: 37,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_13 = Path();
            path_13.moveTo(size.width * 0.07733200, size.height * 0.4771429);
            path_13.lineTo(size.width * 0.06571429, size.height * 0.4971429);
            path_13.lineTo(size.width * 0.06285714, size.height * 0.5014286);
            path_13.lineTo(size.width * 0.06428571, size.height * 0.5285714);
            path_13.lineTo(size.width * 0.06714286, size.height * 0.5514286);
            path_13.lineTo(size.width * 0.06857143, size.height * 0.5614286);
            path_13.lineTo(size.width * 0.07428571, size.height * 0.4985714);
            path_13.lineTo(size.width * 0.07733200, size.height * 0.4771429);
            path_13.close();

            return path_13;
          },
          // % Circle 37 FRAGMENT
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(23.5, 178.1, 28.9, 209.6);
              const gradAngle = 4.5384436947969284;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: [gradient.gradientColors[0]],
                  stops: const [1],
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 36,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_14 = Path();
            path_14.moveTo(size.width * 0.06576543, size.height * 0.5185714);
            path_14.cubicTo(
                size.width * 0.06417743,
                size.height * 0.4772343,
                size.width * 0.09725943,
                size.height * 0.4428571,
                size.width * 0.1386271,
                size.height * 0.4428571);
            path_14.lineTo(size.width * 0.1511697, size.height * 0.4428571);
            path_14.cubicTo(
                size.width * 0.1919020,
                size.height * 0.4428571,
                size.width * 0.2245074,
                size.height * 0.4766486,
                size.width * 0.2230537,
                size.height * 0.5173543);
            path_14.cubicTo(
                size.width * 0.2229229,
                size.height * 0.5210171,
                size.width * 0.2230723,
                size.height * 0.5246857,
                size.width * 0.2235006,
                size.height * 0.5283257);
            path_14.lineTo(size.width * 0.2257143, size.height * 0.5471429);
            path_14.cubicTo(
                size.width * 0.2257143,
                size.height * 0.5663143,
                size.width * 0.2082977,
                size.height * 0.5807714,
                size.width * 0.1894546,
                size.height * 0.5772400);
            path_14.lineTo(size.width * 0.09689857, size.height * 0.5598971);
            path_14.cubicTo(
                size.width * 0.09183743,
                size.height * 0.5589486,
                size.width * 0.08701971,
                size.height * 0.5624514,
                size.width * 0.08635829,
                size.height * 0.5675571);
            path_14.cubicTo(
                size.width * 0.08508771,
                size.height * 0.5773686,
                size.width * 0.07109400,
                size.height * 0.5777800,
                size.width * 0.06867343,
                size.height * 0.5681886);
            path_14.cubicTo(
                size.width * 0.06673771,
                size.height * 0.5557200,
                size.width * 0.06576543,
                size.height * 0.5431229,
                size.width * 0.06576543,
                size.height * 0.5305086);
            path_14.lineTo(size.width * 0.06576543, size.height * 0.5185714);
            path_14.close();
            return path_14;
          },
          // % Circle 36
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(24.0, 165.3, 84.3, 216.8);
              const gradAngle = 4.6584436947969284;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 35,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_15 = Path();
            path_15.moveTo(size.width * 0.2414317, size.height * 0.5942857);
            path_15.cubicTo(
                size.width * 0.2450657,
                size.height * 0.6164314,
                size.width * 0.2309883,
                size.height * 0.6376486,
                size.width * 0.2091740,
                size.height * 0.6429057);
            path_15.lineTo(size.width * 0.1143760, size.height * 0.6657514);
            path_15.cubicTo(
                size.width * 0.1037143,
                size.height * 0.6683229,
                size.width * 0.09294343,
                size.height * 0.6619914,
                size.width * 0.09000000,
                size.height * 0.6514286);
            path_15.lineTo(size.width * 0.07857143, size.height * 0.6157143);
            path_15.cubicTo(
                size.width * 0.07476771,
                size.height * 0.6033514,
                size.width * 0.07193829,
                size.height * 0.5907086,
                size.width * 0.07010857,
                size.height * 0.5779029);
            path_15.lineTo(size.width * 0.07000000, size.height * 0.5771429);
            path_15.cubicTo(
                size.width * 0.06284000,
                size.height * 0.5402971,
                size.width * 0.08596800,
                size.height * 0.5043057,
                size.width * 0.1224569,
                size.height * 0.4955114);
            path_15.lineTo(size.width * 0.1371574, size.height * 0.4919686);
            path_15.cubicTo(
                size.width * 0.1772689,
                size.height * 0.4823029,
                size.width * 0.2175663,
                size.height * 0.5070114,
                size.width * 0.2271429,
                size.height * 0.5471429);
            path_15.lineTo(size.width * 0.2414317, size.height * 0.5942857);
            path_15.close();

            return path_15;
          },
          // % Circle 35

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(23.5, 180.1, 91.5, 249.5);
              const gradAngle = 4.441592653589793;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 34,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_16 = Path();
            path_16.moveTo(size.width * 0.2620926, size.height * 0.6470743);
            path_16.cubicTo(
                size.width * 0.2725709,
                size.height * 0.6680800,
                size.width * 0.2627569,
                size.height * 0.6935914,
                size.width * 0.2408980,
                size.height * 0.7021657);
            path_16.lineTo(size.width * 0.1473529, size.height * 0.7388571);
            path_16.cubicTo(
                size.width * 0.1413869,
                size.height * 0.7411971,
                size.width * 0.1359011,
                size.height * 0.7345743,
                size.width * 0.1392991,
                size.height * 0.7291343);
            path_16.cubicTo(
                size.width * 0.1425423,
                size.height * 0.7239400,
                size.width * 0.1376649,
                size.height * 0.7174943,
                size.width * 0.1317974,
                size.height * 0.7192200);
            path_16.lineTo(size.width * 0.1298671, size.height * 0.7197886);
            path_16.cubicTo(
                size.width * 0.1265900,
                size.height * 0.7207514,
                size.width * 0.1230826,
                size.height * 0.7193514,
                size.width * 0.1213711,
                size.height * 0.7163943);
            path_16.lineTo(size.width * 0.1085714, size.height * 0.6942857);
            path_16.lineTo(size.width * 0.09428571, size.height * 0.6628571);
            path_16.lineTo(size.width * 0.08769314, size.height * 0.6450257);
            path_16.cubicTo(
                size.width * 0.07242286,
                size.height * 0.6037171,
                size.width * 0.09304057,
                size.height * 0.5577257,
                size.width * 0.1340374,
                size.height * 0.5416457);
            path_16.lineTo(size.width * 0.1422894, size.height * 0.5384086);
            path_16.cubicTo(
                size.width * 0.1808246,
                size.height * 0.5232914,
                size.width * 0.2240949,
                size.height * 0.5435686,
                size.width * 0.2371429,
                size.height * 0.5828571);
            path_16.lineTo(size.width * 0.2557143, size.height * 0.6342857);
            path_16.lineTo(size.width * 0.2620926, size.height * 0.6470743);
            path_16.close();
            return path_16;
          },
          // % Circle 34

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(27.0, 195.4, 101.8, 276.7);
              const gradAngle = 4.3558185759344887;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 33,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_17 = Path();
            path_17.moveTo(size.width * 0.2819111, size.height * 0.6723543);
            path_17.cubicTo(
                size.width * 0.2956000,
                size.height * 0.6933400,
                size.width * 0.2888171,
                size.height * 0.7215657,
                size.width * 0.2670886,
                size.height * 0.7340457);
            path_17.lineTo(size.width * 0.1990449, size.height * 0.7731257);
            path_17.cubicTo(
                size.width * 0.1873123,
                size.height * 0.7798629,
                size.width * 0.1735669,
                size.height * 0.7683371,
                size.width * 0.1781214,
                size.height * 0.7555800);
            path_17.lineTo(size.width * 0.1794531, size.height * 0.7518514);
            path_17.cubicTo(
                size.width * 0.1847249,
                size.height * 0.7370829,
                size.width * 0.1653917,
                size.height * 0.7262457,
                size.width * 0.1555737,
                size.height * 0.7384629);
            path_17.cubicTo(
                size.width * 0.1494517,
                size.height * 0.7460800,
                size.width * 0.1376109,
                size.height * 0.7451714,
                size.width * 0.1327380,
                size.height * 0.7367086);
            path_17.lineTo(size.width * 0.1157157, size.height * 0.7071429);
            path_17.lineTo(size.width * 0.1114951, size.height * 0.6997171);
            path_17.cubicTo(
                size.width * 0.08974257,
                size.height * 0.6614429,
                size.width * 0.1030371,
                size.height * 0.6127086,
                size.width * 0.1412129,
                size.height * 0.5907829);
            path_17.cubicTo(
                size.width * 0.1809703,
                size.height * 0.5679486,
                size.width * 0.2316689,
                size.height * 0.5832600,
                size.width * 0.2521486,
                size.height * 0.6242886);
            path_17.lineTo(size.width * 0.2542871, size.height * 0.6285714);
            path_17.lineTo(size.width * 0.2757157, size.height * 0.6628571);
            path_17.lineTo(size.width * 0.2819111, size.height * 0.6723543);
            path_17.close();

            return path_17;
          },
          // % Circle 33

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(33.5, 212.0, 110.4, 291.2);
              const gradAngle = 4.222971447985782;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 32,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_18 = Path();
            path_18.moveTo(size.width * 0.2930429, size.height * 0.6841543);
            path_18.cubicTo(
                size.width * 0.3101286,
                size.height * 0.7103657,
                size.width * 0.3034829,
                size.height * 0.7454457,
                size.width * 0.2779974,
                size.height * 0.7635857);
            path_18.lineTo(size.width * 0.2571417, size.height * 0.7784314);
            path_18.cubicTo(
                size.width * 0.2233991,
                size.height * 0.8024514,
                size.width * 0.1768026,
                size.height * 0.7955857,
                size.width * 0.1514286,
                size.height * 0.7628571);
            path_18.lineTo(size.width * 0.1400000, size.height * 0.7471429);
            path_18.lineTo(size.width * 0.1373134, size.height * 0.7429714);
            path_18.cubicTo(
                size.width * 0.1144886,
                size.height * 0.7075400,
                size.width * 0.1235600,
                size.height * 0.6603429,
                size.width * 0.1578917,
                size.height * 0.6359057);
            path_18.lineTo(size.width * 0.1685900, size.height * 0.6282886);
            path_18.cubicTo(
                size.width * 0.1986420,
                size.height * 0.6068971,
                size.width * 0.2403326,
                size.height * 0.6144143,
                size.width * 0.2610237,
                size.height * 0.6449571);
            path_18.lineTo(size.width * 0.2930429, size.height * 0.6841543);
            path_18.close();

            return path_18;
          },
          // % Circle 32

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(42.7, 226.6, 115.8, 299.6);
              const gradAngle = 4.016929693744344994;

              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 31,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_19 = Path();
            path_19.moveTo(size.width * 0.3373571, size.height * 0.7253771);
            path_19.cubicTo(
                size.width * 0.3459057,
                size.height * 0.7340371,
                size.width * 0.3455057,
                size.height * 0.7481057,
                size.width * 0.3364800,
                size.height * 0.7562686);
            path_19.lineTo(size.width * 0.2449480, size.height * 0.8390343);
            path_19.cubicTo(
                size.width * 0.2429191,
                size.height * 0.8408686,
                size.width * 0.2399071,
                size.height * 0.8384000,
                size.width * 0.2412946,
                size.height * 0.8360400);
            path_19.cubicTo(
                size.width * 0.2382666,
                size.height * 0.8405914,
                size.width * 0.2319414,
                size.height * 0.8414343,
                size.width * 0.2278354,
                size.height * 0.8378343);
            path_19.lineTo(size.width * 0.2241551, size.height * 0.8346086);
            path_19.lineTo(size.width * 0.2117634, size.height * 0.8249429);
            path_19.lineTo(size.width * 0.1946206, size.height * 0.8092286);
            path_19.lineTo(size.width * 0.1889063, size.height * 0.8035143);
            path_19.lineTo(size.width * 0.1746206, size.height * 0.7878000);
            path_19.lineTo(size.width * 0.1660491, size.height * 0.7778000);
            path_19.cubicTo(
                size.width * 0.1414106,
                size.height * 0.7485657,
                size.width * 0.1443626,
                size.height * 0.7049857,
                size.width * 0.1727177,
                size.height * 0.6793457);
            path_19.lineTo(size.width * 0.1807811, size.height * 0.6720543);
            path_19.cubicTo(
                size.width * 0.2138280,
                size.height * 0.6421714,
                size.width * 0.2650674,
                size.height * 0.6460943,
                size.width * 0.2931914,
                size.height * 0.6806571);
            path_19.lineTo(size.width * 0.3373571, size.height * 0.7253771);
            path_19.close();
            return path_19;
          },

          // % Circle 31
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(52.8, 239.8, 129.1, 314.1);
              const gradAngle = 3.9645771823237902;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 30,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_20 = Path();
            path_20.moveTo(size.width * 0.3359086, size.height * 0.7219743);
            path_20.cubicTo(
                size.width * 0.3713514,
                size.height * 0.7499400,
                size.width * 0.3769343,
                size.height * 0.8016714,
                size.width * 0.3482743,
                size.height * 0.8365629);
            path_20.cubicTo(
                size.width * 0.3204600,
                size.height * 0.8704200,
                size.width * 0.2707400,
                size.height * 0.8757029,
                size.width * 0.2364360,
                size.height * 0.8484486);
            path_20.lineTo(size.width * 0.2199989, size.height * 0.8353886);
            path_20.lineTo(size.width * 0.2097420, size.height * 0.8265343);
            path_20.cubicTo(
                size.width * 0.1766109,
                size.height * 0.7979343,
                size.width * 0.1723326,
                size.height * 0.7480229,
                size.width * 0.2001129,
                size.height * 0.7142057);
            path_20.cubicTo(
                size.width * 0.2288049,
                size.height * 0.6792800,
                size.width * 0.2805554,
                size.height * 0.6749343,
                size.width * 0.3146743,
                size.height * 0.7045886);
            path_20.lineTo(size.width * 0.3225457, size.height * 0.7114286);
            path_20.lineTo(size.width * 0.3359086, size.height * 0.7219743);
            path_20.close();

            return path_20;
          },
          // % Circle 30

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              const gradAngle = 3.91187560505283653;
              final rect = Rect.fromLTRB(64.3, 252.0, 140.7, 326.9);
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 29,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_21 = Path();
            path_21.moveTo(size.width * 0.3666114, size.height * 0.7423286);
            path_21.cubicTo(
                size.width * 0.4043829,
                size.height * 0.7658943,
                size.width * 0.4156400,
                size.height * 0.8158829,
                size.width * 0.3916171,
                size.height * 0.8533686);
            path_21.cubicTo(
                size.width * 0.3681771,
                size.height * 0.8899400,
                size.width * 0.3198400,
                size.height * 0.9009343,
                size.width * 0.2828909,
                size.height * 0.8780971);
            path_21.lineTo(size.width * 0.2628571, size.height * 0.8657143);
            path_21.lineTo(size.width * 0.2461551, size.height * 0.8544514);
            path_21.cubicTo(
                size.width * 0.2101351,
                size.height * 0.8301657,
                size.width * 0.2000697,
                size.height * 0.7814714,
                size.width * 0.2235097,
                size.height * 0.7448971);
            path_21.cubicTo(
                size.width * 0.2475394,
                size.height * 0.7074029,
                size.width * 0.2975486,
                size.height * 0.6969343,
                size.width * 0.3346029,
                size.height * 0.7216371);
            path_21.lineTo(size.width * 0.3514286, size.height * 0.7328571);
            path_21.lineTo(size.width * 0.3666114, size.height * 0.7423286);
            path_21.close();

            return path_21;
          },
          // % Circle 29

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(74.7, 260.2, 155.2, 336.4);
              const gradAngle = 3.867236696599082;

              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });

            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 28,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_22 = Path();
            path_22.moveTo(size.width * 0.4219743, size.height * 0.7690886);
            path_22.cubicTo(
                size.width * 0.4460857,
                size.height * 0.7809143,
                size.width * 0.4561000,
                size.height * 0.8100771,
                size.width * 0.4443429,
                size.height * 0.8342229);
            path_22.lineTo(size.width * 0.4065114, size.height * 0.9119229);
            path_22.cubicTo(
                size.width * 0.4025743,
                size.height * 0.9200057,
                size.width * 0.3909286,
                size.height * 0.9195543,
                size.width * 0.3876000,
                size.height * 0.9111914);
            path_22.cubicTo(
                size.width * 0.3856943,
                size.height * 0.9064057,
                size.width * 0.3805771,
                size.height * 0.9037400,
                size.width * 0.3755800,
                size.height * 0.9049286);
            path_22.lineTo(size.width * 0.3619314, size.height * 0.9081771);
            path_22.cubicTo(
                size.width * 0.3569371,
                size.height * 0.9093686,
                size.width * 0.3517029,
                size.height * 0.9090800,
                size.width * 0.3468629,
                size.height * 0.9073514);
            path_22.lineTo(size.width * 0.3342800, size.height * 0.9028571);
            path_22.lineTo(size.width * 0.3028571, size.height * 0.8885714);
            path_22.lineTo(size.width * 0.2856083, size.height * 0.8798286);
            path_22.cubicTo(
                size.width * 0.2466880,
                size.height * 0.8601000,
                size.width * 0.2307577,
                size.height * 0.8127143,
                size.width * 0.2498589,
                size.height * 0.7734829);
            path_22.cubicTo(
                size.width * 0.2691386,
                size.height * 0.7338886,
                size.width * 0.3168200,
                size.height * 0.7175114,
                size.width * 0.3563600,
                size.height * 0.7369057);
            path_22.lineTo(size.width * 0.4219743, size.height * 0.7690886);
            path_22.close();

            return path_22;
          },
          // % Circle 28
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(86.2, 267.9, 170.3, 343.5);
              const gradAngle = 3.632091658375337;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 27,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_23 = Path();
            path_23.moveTo(size.width * 0.4110429, size.height * 0.7604286);
            path_23.cubicTo(
                size.width * 0.4525314,
                size.height * 0.7760457,
                size.width * 0.4734200,
                size.height * 0.8225229,
                size.width * 0.4575543,
                size.height * 0.8639200);
            path_23.lineTo(size.width * 0.4545114, size.height * 0.8718629);
            path_23.cubicTo(
                size.width * 0.4404771,
                size.height * 0.9084857,
                size.width * 0.3995114,
                size.height * 0.9268086,
                size.width * 0.3628571,
                size.height * 0.9128571);
            path_23.lineTo(size.width * 0.3342857, size.height * 0.9028571);
            path_23.lineTo(size.width * 0.3250943, size.height * 0.8991543);
            path_23.cubicTo(
                size.width * 0.2844820,
                size.height * 0.8827914,
                size.width * 0.2644509,
                size.height * 0.8368229,
                size.width * 0.2801183,
                size.height * 0.7959371);
            path_23.cubicTo(
                size.width * 0.2960657,
                size.height * 0.7543200,
                size.width * 0.3428857,
                size.height * 0.7338057,
                size.width * 0.3842943,
                size.height * 0.7502943);
            path_23.lineTo(size.width * 0.3871429, size.height * 0.7514286);
            path_23.lineTo(size.width * 0.4110429, size.height * 0.7604286);
            path_23.close();

            return path_23;
          },
          // % Circle 27
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(98.7, 274.0, 176.8, 346.0);
              const gradAngle = 3.546312408709453;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 26,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_24 = Path();
            path_24.moveTo(size.width * 0.4931486, size.height * 0.7829686);
            path_24.cubicTo(
                size.width * 0.5045143,
                size.height * 0.7860543,
                size.width * 0.5112029,
                size.height * 0.7978229,
                size.width * 0.5080371,
                size.height * 0.8091686);
            path_24.lineTo(size.width * 0.4746771, size.height * 0.9287314);
            path_24.cubicTo(
                size.width * 0.4739829,
                size.height * 0.9312200,
                size.width * 0.4703314,
                size.height * 0.9307714,
                size.width * 0.4702514,
                size.height * 0.9281886);
            path_24.cubicTo(
                size.width * 0.4701800,
                size.height * 0.9258971,
                size.width * 0.4671371,
                size.height * 0.9251514,
                size.width * 0.4660257,
                size.height * 0.9271543);
            path_24.lineTo(size.width * 0.4639629, size.height * 0.9308657);
            path_24.cubicTo(
                size.width * 0.4632914,
                size.height * 0.9320714,
                size.width * 0.4619657,
                size.height * 0.9327571,
                size.width * 0.4605943,
                size.height * 0.9326057);
            path_24.lineTo(size.width * 0.4371429, size.height * 0.9300000);
            path_24.lineTo(size.width * 0.4057143, size.height * 0.9242857);
            path_24.lineTo(size.width * 0.3714286, size.height * 0.9157143);
            path_24.lineTo(size.width * 0.3668600, size.height * 0.9143971);
            path_24.cubicTo(
                size.width * 0.3246486,
                size.height * 0.9022171,
                size.width * 0.3001143,
                size.height * 0.8582457,
                size.width * 0.3119200,
                size.height * 0.8159286);
            path_24.lineTo(size.width * 0.3126857, size.height * 0.8131886);
            path_24.cubicTo(
                size.width * 0.3242314,
                size.height * 0.7718029,
                size.width * 0.3673486,
                size.height * 0.7478857,
                size.width * 0.4085714,
                size.height * 0.7600000);
            path_24.lineTo(size.width * 0.4931486, size.height * 0.7829686);
            path_24.close();

            return path_24;
          },
          // % Circle 26
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(112.0, 279.2, 190.9, 348.2);
              const gradAngle = 3.436312408709453;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 25,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_25 = Path();
            path_25.moveTo(size.width * 0.5066114, size.height * 0.7783200);
            path_25.cubicTo(
                size.width * 0.5276714,
                size.height * 0.7813029,
                size.width * 0.5419971,
                size.height * 0.8012743,
                size.width * 0.5380743,
                size.height * 0.8221800);
            path_25.lineTo(size.width * 0.5183486, size.height * 0.9272629);
            path_25.cubicTo(
                size.width * 0.5174057,
                size.height * 0.9322829,
                size.width * 0.5105171,
                size.height * 0.9330114,
                size.width * 0.5085343,
                size.height * 0.9282971);
            path_25.cubicTo(
                size.width * 0.5067629,
                size.height * 0.9240771,
                size.width * 0.5007857,
                size.height * 0.9240829,
                size.width * 0.4990286,
                size.height * 0.9283029);
            path_25.lineTo(size.width * 0.4981257, size.height * 0.9304714);
            path_25.cubicTo(
                size.width * 0.4972057,
                size.height * 0.9326829,
                size.width * 0.4950829,
                size.height * 0.9341571,
                size.width * 0.4926886,
                size.height * 0.9342400);
            path_25.lineTo(size.width * 0.4914286, size.height * 0.9342857);
            path_25.lineTo(size.width * 0.4600000, size.height * 0.9326714);
            path_25.lineTo(size.width * 0.4314286, size.height * 0.9300000);
            path_25.lineTo(size.width * 0.4114286, size.height * 0.9257143);
            path_25.cubicTo(
                size.width * 0.3693543,
                size.height * 0.9186171,
                size.width * 0.3408600,
                size.height * 0.8788686,
                size.width * 0.3476486,
                size.height * 0.8367429);
            path_25.lineTo(size.width * 0.3482257, size.height * 0.8331629);
            path_25.cubicTo(
                size.width * 0.3552371,
                size.height * 0.7896514,
                size.width * 0.3966743,
                size.height * 0.7604886,
                size.width * 0.4400000,
                size.height * 0.7685714);
            path_25.lineTo(size.width * 0.4851829, size.height * 0.7752857);
            path_25.lineTo(size.width * 0.5066114, size.height * 0.7783200);
            path_25.close();

            return path_25;
          },
          // % Circle 25
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(127.3, 283.9, 202.4, 348.8);
              const gradAngle = 3.3013738635402363;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 24,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_26 = Path();
            path_26.moveTo(size.width * 0.4698371, size.height * 0.9327114);
            path_26.cubicTo(
                size.width * 0.4274600,
                size.height * 0.9303886,
                size.width * 0.3942857,
                size.height * 0.8953486,
                size.width * 0.3942857,
                size.height * 0.8529057);
            path_26.lineTo(size.width * 0.3942857, size.height * 0.8457286);
            path_26.cubicTo(
                size.width * 0.3942857,
                size.height * 0.8049257,
                size.width * 0.4277771,
                size.height * 0.7720714,
                size.width * 0.4685714,
                size.height * 0.7728571);
            path_26.lineTo(size.width * 0.4985714, size.height * 0.7742857);
            path_26.lineTo(size.width * 0.5300000, size.height * 0.7721429);
            path_26.cubicTo(
                size.width * 0.5638086,
                size.height * 0.7717486,
                size.width * 0.5914286,
                size.height * 0.7990486,
                size.width * 0.5914286,
                size.height * 0.8328600);
            path_26.lineTo(size.width * 0.5914286, size.height * 0.8627171);
            path_26.cubicTo(
                size.width * 0.5914286,
                size.height * 0.8997600,
                size.width * 0.5626800,
                size.height * 0.9304457,
                size.width * 0.5257143,
                size.height * 0.9328571);
            path_26.lineTo(size.width * 0.4985714, size.height * 0.9342857);
            path_26.lineTo(size.width * 0.4698371, size.height * 0.9327114);
            path_26.close();
            return path_26;
          },
          // % Circle 24
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(147.2, 288.1, 220.8, 348.8);
              const gradAngle = 3.184264669461485;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 23,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_27 = Path();
            path_27.moveTo(size.width * 0.5551743, size.height * 0.7681400);
            path_27.cubicTo(
                size.width * 0.5909943,
                size.height * 0.7641829,
                size.width * 0.6231571,
                size.height * 0.7902000,
                size.width * 0.6267657,
                size.height * 0.8260571);
            path_27.lineTo(size.width * 0.6294086, size.height * 0.8523086);
            path_27.cubicTo(
                size.width * 0.6332743,
                size.height * 0.8907143,
                size.width * 0.6050514,
                size.height * 0.9249029,
                size.width * 0.5666057,
                size.height * 0.9283771);
            path_27.lineTo(size.width * 0.5466114, size.height * 0.9312400);
            path_27.lineTo(size.width * 0.5286457, size.height * 0.9330343);
            path_27.cubicTo(
                size.width * 0.4846400,
                size.height * 0.9374343,
                size.width * 0.4454000,
                size.height * 0.9053486,
                size.width * 0.4409714,
                size.height * 0.8613457);
            path_27.cubicTo(
                size.width * 0.4364714,
                size.height * 0.8166429,
                size.width * 0.4695943,
                size.height * 0.7769600,
                size.width * 0.5143829,
                size.height * 0.7734029);
            path_27.lineTo(size.width * 0.5266086, size.height * 0.7724314);
            path_27.lineTo(size.width * 0.5551743, size.height * 0.7681400);
            path_27.close();

            return path_27;
          },
          // % Circle 23
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(163.0, 285.3, 236.4, 350.0);
              const gradAngle = pi;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 22,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_28 = Path();
            path_28.moveTo(size.width * 0.6149486, size.height * 0.7513400);
            path_28.cubicTo(
                size.width * 0.6410029,
                size.height * 0.7463000,
                size.width * 0.6664657,
                size.height * 0.7624057,
                size.width * 0.6730800,
                size.height * 0.7881057);
            path_28.lineTo(size.width * 0.6932029, size.height * 0.8663200);
            path_28.cubicTo(
                size.width * 0.6960400,
                size.height * 0.8773543,
                size.width * 0.6846029,
                size.height * 0.8866286,
                size.width * 0.6744029,
                size.height * 0.8815629);
            path_28.cubicTo(
                size.width * 0.6662629,
                size.height * 0.8775229,
                size.width * 0.6565543,
                size.height * 0.8826629,
                size.width * 0.6553086,
                size.height * 0.8916714);
            path_28.lineTo(size.width * 0.6548143, size.height * 0.8952686);
            path_28.cubicTo(
                size.width * 0.6540143,
                size.height * 0.9010571,
                size.width * 0.6501114,
                size.height * 0.9059457,
                size.width * 0.6446429,
                size.height * 0.9080000);
            path_28.lineTo(size.width * 0.6323057, size.height * 0.9126400);
            path_28.lineTo(size.width * 0.6094514, size.height * 0.9197943);
            path_28.lineTo(size.width * 0.5849057, size.height * 0.9256914);
            path_28.cubicTo(
                size.width * 0.5425657,
                size.height * 0.9358657,
                size.width * 0.4999143,
                size.height * 0.9102057,
                size.width * 0.4890629,
                size.height * 0.8680314);
            path_28.cubicTo(
                size.width * 0.4781971,
                size.height * 0.8258000,
                size.width * 0.5032371,
                size.height * 0.7826400,
                size.width * 0.5452943,
                size.height * 0.7711114);
            path_28.lineTo(size.width * 0.5665971, size.height * 0.7652714);
            path_28.lineTo(size.width * 0.6094514, size.height * 0.7524029);
            path_28.lineTo(size.width * 0.6149486, size.height * 0.7513400);
            path_28.close();

            return path_28;
          },

          // % Circle 22
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(178.5, 278.6, 259.9, 349.4);
              const gradAngle = 2.8452652111582565;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 21,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_29 = Path();
            path_29.moveTo(size.width * 0.6417200, size.height * 0.7363143);
            path_29.cubicTo(
                size.width * 0.6661029,
                size.height * 0.7262857,
                size.width * 0.6939771,
                size.height * 0.7379343,
                size.width * 0.7039743,
                size.height * 0.7623286);
            path_29.lineTo(size.width * 0.7258457, size.height * 0.8156914);
            path_29.cubicTo(
                size.width * 0.7336400,
                size.height * 0.8347057,
                size.width * 0.7147829,
                size.height * 0.8537800,
                size.width * 0.6957029,
                size.height * 0.8461829);
            path_29.lineTo(size.width * 0.6930829, size.height * 0.8451429);
            path_29.cubicTo(
                size.width * 0.6876886,
                size.height * 0.8429943,
                size.width * 0.6815829,
                size.height * 0.8436086,
                size.width * 0.6767200,
                size.height * 0.8467943);
            path_29.lineTo(size.width * 0.6507629, size.height * 0.8637857);
            path_29.cubicTo(
                size.width * 0.6480914,
                size.height * 0.8655371,
                size.width * 0.6487114,
                size.height * 0.8696200,
                size.width * 0.6517857,
                size.height * 0.8704886);
            path_29.lineTo(size.width * 0.6662171, size.height * 0.8745686);
            path_29.cubicTo(
                size.width * 0.6693743,
                size.height * 0.8754600,
                size.width * 0.6684000,
                size.height * 0.8801657,
                size.width * 0.6651486,
                size.height * 0.8797343);
            path_29.lineTo(size.width * 0.6893457, size.height * 0.8842714);
            path_29.cubicTo(
                size.width * 0.6902857,
                size.height * 0.8844486,
                size.width * 0.6910657,
                size.height * 0.8851000,
                size.width * 0.6914057,
                size.height * 0.8859971);
            path_29.cubicTo(
                size.width * 0.6919057,
                size.height * 0.8873143,
                size.width * 0.6913257,
                size.height * 0.8888000,
                size.width * 0.6900657,
                size.height * 0.8894314);
            path_29.lineTo(size.width * 0.6865743, size.height * 0.8911800);
            path_29.lineTo(size.width * 0.6665771, size.height * 0.8997657);
            path_29.lineTo(size.width * 0.6600000, size.height * 0.9028571);
            path_29.lineTo(size.width * 0.6400429, size.height * 0.9109057);
            path_29.cubicTo(
                size.width * 0.5990514,
                size.height * 0.9274371,
                size.width * 0.5524400,
                size.height * 0.9077743,
                size.width * 0.5356800,
                size.height * 0.8668771);
            path_29.cubicTo(
                size.width * 0.5188343,
                size.height * 0.8257800,
                size.width * 0.5384800,
                size.height * 0.7787714,
                size.width * 0.5795543,
                size.height * 0.7618800);
            path_29.lineTo(size.width * 0.6417200, size.height * 0.7363143);
            path_29.close();

            return path_29;
          },
          // % Circle 21
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(193.7, 271.2, 273.9, 346.3);
              const gradAngle = 2.71489230364481693;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 20,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_30 = Path();
            path_30.moveTo(size.width * 0.6736029, size.height * 0.7150971);
            path_30.cubicTo(
                size.width * 0.7015943,
                size.height * 0.6991857,
                size.width * 0.7371514,
                size.height * 0.7089943,
                size.width * 0.7530229,
                size.height * 0.7370114);
            path_30.lineTo(size.width * 0.7654257, size.height * 0.7589029);
            path_30.cubicTo(
                size.width * 0.7820000,
                size.height * 0.7881571,
                size.width * 0.7607657,
                size.height * 0.8244371,
                size.width * 0.7271657,
                size.height * 0.8242771);
            path_30.lineTo(size.width * 0.7212743, size.height * 0.8242486);
            path_30.cubicTo(
                size.width * 0.7200857,
                size.height * 0.8242429,
                size.width * 0.7189086,
                size.height * 0.8244457,
                size.width * 0.7177914,
                size.height * 0.8248457);
            path_30.cubicTo(
                size.width * 0.7073029,
                size.height * 0.8285971,
                size.width * 0.7095400,
                size.height * 0.8440571,
                size.width * 0.7206571,
                size.height * 0.8446629);
            path_30.lineTo(size.width * 0.7356114, size.height * 0.8454743);
            path_30.cubicTo(
                size.width * 0.7431914,
                size.height * 0.8458857,
                size.width * 0.7457914,
                size.height * 0.8557800,
                size.width * 0.7394000,
                size.height * 0.8598857);
            path_30.lineTo(size.width * 0.7322857, size.height * 0.8654286);
            path_30.lineTo(size.width * 0.7180029, size.height * 0.8740114);
            path_30.lineTo(size.width * 0.6900771, size.height * 0.8895286);
            path_30.cubicTo(
                size.width * 0.6517714,
                size.height * 0.9108114,
                size.width * 0.6035171,
                size.height * 0.8972429,
                size.width * 0.5819171,
                size.height * 0.8591143);
            path_30.cubicTo(
                size.width * 0.5601686,
                size.height * 0.8207229,
                size.width * 0.5736314,
                size.height * 0.7719257,
                size.width * 0.6119914,
                size.height * 0.7501200);
            path_30.lineTo(size.width * 0.6736029, size.height * 0.7150971);
            path_30.close();

            return path_30;
          },
          // % Circle 20
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(209.1, 261.0, 292.0, 340.1);
              const gradAngle = 2.5910493916798925;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 19,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_31 = Path();
            path_31.moveTo(size.width * 0.6934743, size.height * 0.6954971);
            path_31.cubicTo(
                size.width * 0.7223229,
                size.height * 0.6754943,
                size.width * 0.7618543,
                size.height * 0.6824314,
                size.width * 0.7821686,
                size.height * 0.7110629);
            path_31.lineTo(size.width * 0.8083600, size.height * 0.7479771);
            path_31.cubicTo(
                size.width * 0.8223714,
                size.height * 0.7677257,
                size.width * 0.8118114,
                size.height * 0.7954057,
                size.width * 0.7882143,
                size.height * 0.8007800);
            path_31.lineTo(size.width * 0.7679543, size.height * 0.8061000);
            path_31.cubicTo(
                size.width * 0.7599229,
                size.height * 0.8082086,
                size.width * 0.7618229,
                size.height * 0.8201229,
                size.width * 0.7701086,
                size.height * 0.8196114);
            path_31.lineTo(size.width * 0.7847829, size.height * 0.8187057);
            path_31.cubicTo(
                size.width * 0.7876886,
                size.height * 0.8185286,
                size.width * 0.7889686,
                size.height * 0.8223057,
                size.width * 0.7865543,
                size.height * 0.8239371);
            path_31.lineTo(size.width * 0.7751286, size.height * 0.8339514);
            path_31.lineTo(size.width * 0.7522743, size.height * 0.8520857);
            path_31.lineTo(size.width * 0.7381429, size.height * 0.8618400);
            path_31.cubicTo(
                size.width * 0.7020743,
                size.height * 0.8867400,
                size.width * 0.6527400,
                size.height * 0.8780314,
                size.width * 0.6273800,
                size.height * 0.8422857);
            path_31.cubicTo(
                size.width * 0.6016914,
                size.height * 0.8060800,
                size.width * 0.6102771,
                size.height * 0.7558486,
                size.width * 0.6465314,
                size.height * 0.7302314);
            path_31.lineTo(size.width * 0.6607429, size.height * 0.7201886);
            path_31.lineTo(size.width * 0.6770514, size.height * 0.7068829);
            path_31.lineTo(size.width * 0.6934743, size.height * 0.6954971);
            path_31.close();

            return path_31;
          },
          // % Circle 19
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(224.6, 252.2, 307.0, 331.1);
              const gradAngle = 2.5537976613587263;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 18,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_32 = Path();
            path_32.moveTo(size.width * 0.7265286, size.height * 0.6586143);
            path_32.cubicTo(
                size.width * 0.7486971,
                size.height * 0.6369457,
                size.width * 0.7842200,
                size.height * 0.6374429,
                size.width * 0.8057771,
                size.height * 0.6597200);
            path_32.lineTo(size.width * 0.8585086, size.height * 0.7142200);
            path_32.cubicTo(
                size.width * 0.8668000,
                size.height * 0.7227914,
                size.width * 0.8622771,
                size.height * 0.7371600,
                size.width * 0.8505771,
                size.height * 0.7394143);
            path_32.lineTo(size.width * 0.8171600, size.height * 0.7458571);
            path_32.cubicTo(
                size.width * 0.8049343,
                size.height * 0.7482114,
                size.width * 0.8060457,
                size.height * 0.7660886,
                size.width * 0.8184686,
                size.height * 0.7669057);
            path_32.cubicTo(
                size.width * 0.8273771,
                size.height * 0.7674943,
                size.width * 0.8316257,
                size.height * 0.7781629,
                size.width * 0.8255686,
                size.height * 0.7847314);
            path_32.lineTo(size.width * 0.8061686, size.height * 0.8057714);
            path_32.lineTo(size.width * 0.7884371, size.height * 0.8225000);
            path_32.cubicTo(
                size.width * 0.7566600,
                size.height * 0.8524800,
                size.width * 0.7067343,
                size.height * 0.8513429,
                size.width * 0.6763543,
                size.height * 0.8199429);
            path_32.cubicTo(
                size.width * 0.6453743,
                size.height * 0.7879257,
                size.width * 0.6465171,
                size.height * 0.7367086,
                size.width * 0.6788943,
                size.height * 0.7061057);
            path_32.lineTo(size.width * 0.6948629, size.height * 0.6910114);
            path_32.cubicTo(
                size.width * 0.6966914,
                size.height * 0.6892829,
                size.width * 0.6983686,
                size.height * 0.6874029,
                size.width * 0.6998800,
                size.height * 0.6853886);
            path_32.cubicTo(
                size.width * 0.7012400,
                size.height * 0.6835743,
                size.width * 0.7027400,
                size.height * 0.6818657,
                size.width * 0.7043600,
                size.height * 0.6802800);
            path_32.lineTo(size.width * 0.7265286, size.height * 0.6586143);
            path_32.close();
            return path_32;
          },
          // % Circle 18
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(241.0, 237.8, 323.6, 318.3);
              const gradAngle = 2.3637976613587263;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 17,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_33 = Path();
            path_33.moveTo(size.width * 0.7402143, size.height * 0.6348429);
            path_33.cubicTo(
                size.width * 0.7555543,
                size.height * 0.6136429,
                size.width * 0.7851571,
                size.height * 0.6089200,
                size.width * 0.8063343,
                size.height * 0.6242914);
            path_33.lineTo(size.width * 0.8705057, size.height * 0.6708829);
            path_33.cubicTo(
                size.width * 0.8800771,
                size.height * 0.6778314,
                size.width * 0.8766771,
                size.height * 0.6928800,
                size.width * 0.8650514,
                size.height * 0.6950143);
            path_33.lineTo(size.width * 0.8640200, size.height * 0.6952029);
            path_33.cubicTo(
                size.width * 0.8528057,
                size.height * 0.6972600,
                size.width * 0.8495029,
                size.height * 0.7117657,
                size.width * 0.8587171,
                size.height * 0.7185000);
            path_33.cubicTo(
                size.width * 0.8642486,
                size.height * 0.7225400,
                size.width * 0.8657000,
                size.height * 0.7301857,
                size.width * 0.8620343,
                size.height * 0.7359743);
            path_33.lineTo(size.width * 0.8579743, size.height * 0.7423857);
            path_33.lineTo(size.width * 0.8436000, size.height * 0.7626657);
            path_33.lineTo(size.width * 0.8365943, size.height * 0.7722200);
            path_33.cubicTo(
                size.width * 0.8108086,
                size.height * 0.8073771,
                size.width * 0.7615114,
                size.height * 0.8150800,
                size.width * 0.7262286,
                size.height * 0.7894657);
            path_33.cubicTo(
                size.width * 0.6907829,
                size.height * 0.7637314,
                size.width * 0.6828657,
                size.height * 0.7141057,
                size.width * 0.7085400,
                size.height * 0.6786200);
            path_33.lineTo(size.width * 0.7402143, size.height * 0.6348429);
            path_33.close();

            return path_33;
          },
          // % Circle 17
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(254.9, 227.3, 328.6, 304.3);
              const gradAngle = 2.2537976613587263;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 16,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_34 = Path();
            path_34.moveTo(size.width * 0.7650857, size.height * 0.5914286);
            path_34.cubicTo(
                size.width * 0.7757743,
                size.height * 0.5752629,
                size.width * 0.7975343,
                size.height * 0.5708429,
                size.width * 0.8136829,
                size.height * 0.5815600);
            path_34.lineTo(size.width * 0.8641571, size.height * 0.6150514);
            path_34.cubicTo(
                size.width * 0.8793571,
                size.height * 0.6251371,
                size.width * 0.8717543,
                size.height * 0.6488514,
                size.width * 0.8535371,
                size.height * 0.6481743);
            path_34.lineTo(size.width * 0.8915457, size.height * 0.6523514);
            path_34.cubicTo(
                size.width * 0.8976971,
                size.height * 0.6530257,
                size.width * 0.9015686,
                size.height * 0.6593257,
                size.width * 0.8993971,
                size.height * 0.6651286);
            path_34.lineTo(size.width * 0.8891457, size.height * 0.6880200);
            path_34.lineTo(size.width * 0.8706714, size.height * 0.7232543);
            path_34.lineTo(size.width * 0.8694771, size.height * 0.7250171);
            path_34.cubicTo(
                size.width * 0.8447771,
                size.height * 0.7614886,
                size.width * 0.7953543,
                size.height * 0.7712400,
                size.width * 0.7586514,
                size.height * 0.7468857);
            path_34.cubicTo(
                size.width * 0.7216600,
                size.height * 0.7223400,
                size.width * 0.7115229,
                size.height * 0.6724229,
                size.width * 0.7360114,
                size.height * 0.6353943);
            path_34.lineTo(size.width * 0.7650857, size.height * 0.5914286);
            path_34.close();

            return path_34;
          },
          // % Circle 16
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(265.6, 213.1, 336.6, 287.9);
              const gradAngle = 2.2237976613587263;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 15,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_35 = Path();
            path_35.moveTo(size.width * 0.7850886, size.height * 0.5431200);
            path_35.cubicTo(
                size.width * 0.7869971,
                size.height * 0.5200143,
                size.width * 0.8098600,
                size.height * 0.5046829,
                size.width * 0.8319543,
                size.height * 0.5116943);
            path_35.lineTo(size.width * 0.8720629, size.height * 0.5244171);
            path_35.cubicTo(
                size.width * 0.9087486,
                size.height * 0.5360571,
                size.width * 0.9290829,
                size.height * 0.5752400,
                size.width * 0.9174800,
                size.height * 0.6119371);
            path_35.lineTo(size.width * 0.9015971, size.height * 0.6621629);
            path_35.cubicTo(
                size.width * 0.8886257,
                size.height * 0.7031857,
                size.width * 0.8448657,
                size.height * 0.7258943,
                size.width * 0.8038571,
                size.height * 0.7128829);
            path_35.cubicTo(
                size.width * 0.7623943,
                size.height * 0.6997286,
                size.width * 0.7397057,
                size.height * 0.6551600,
                size.width * 0.7534600,
                size.height * 0.6138943);
            path_35.lineTo(size.width * 0.7557114, size.height * 0.6071429);
            path_35.lineTo(size.width * 0.7724771, size.height * 0.5710343);
            path_35.cubicTo(
                size.width * 0.7736800,
                size.height * 0.5684457,
                size.width * 0.7751057,
                size.height * 0.5659657,
                size.width * 0.7767429,
                size.height * 0.5636286);
            path_35.lineTo(size.width * 0.7786857, size.height * 0.5608571);
            path_35.cubicTo(
                size.width * 0.7823514,
                size.height * 0.5556171,
                size.width * 0.7845629,
                size.height * 0.5494971,
                size.width * 0.7850886,
                size.height * 0.5431200);
            path_35.close();

            return path_35;
          },
          // % Circle 15
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(276.2, 188.4, 346.9, 271.0);
              const gradAngle = 1.9251939247603216;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 14,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_36 = Path();
            path_36.moveTo(size.width * 0.7926914, size.height * 0.4917543);
            path_36.cubicTo(
                size.width * 0.7980400,
                size.height * 0.4729114,
                size.width * 0.8176600,
                size.height * 0.4619657,
                size.width * 0.8365000,
                size.height * 0.4673114);
            path_36.lineTo(size.width * 0.9185114, size.height * 0.4905800);
            path_36.cubicTo(
                size.width * 0.9287429,
                size.height * 0.4934829,
                size.width * 0.9288257,
                size.height * 0.5079457,
                size.width * 0.9186314,
                size.height * 0.5109857);
            path_36.lineTo(size.width * 0.9172514, size.height * 0.5113971);
            path_36.cubicTo(
                size.width * 0.9171800,
                size.height * 0.5114171,
                size.width * 0.9171057,
                size.height * 0.5114286,
                size.width * 0.9170286,
                size.height * 0.5114286);
            path_36.cubicTo(
                size.width * 0.9164400,
                size.height * 0.5114286,
                size.width * 0.9160657,
                size.height * 0.5120629,
                size.width * 0.9163514,
                size.height * 0.5125771);
            path_36.lineTo(size.width * 0.9276629, size.height * 0.5329371);
            path_36.cubicTo(
                size.width * 0.9291800,
                size.height * 0.5356657,
                size.width * 0.9297714,
                size.height * 0.5388171,
                size.width * 0.9293486,
                size.height * 0.5419143);
            path_36.lineTo(size.width * 0.9257143, size.height * 0.5685714);
            path_36.lineTo(size.width * 0.9204829, size.height * 0.5984943);
            path_36.lineTo(size.width * 0.9165600, size.height * 0.6156086);
            path_36.cubicTo(
                size.width * 0.9068514,
                size.height * 0.6579429,
                size.width * 0.8636286,
                size.height * 0.6835229,
                size.width * 0.8218457,
                size.height * 0.6716686);
            path_36.cubicTo(
                size.width * 0.7809886,
                size.height * 0.6600743,
                size.width * 0.7576457,
                size.height * 0.6172057,
                size.width * 0.7700800,
                size.height * 0.5765943);
            path_36.lineTo(size.width * 0.7742857, size.height * 0.5628571);
            path_36.lineTo(size.width * 0.7785714, size.height * 0.5457143);
            path_36.lineTo(size.width * 0.7822600, size.height * 0.5285057);
            path_36.lineTo(size.width * 0.7926914, size.height * 0.4917543);
            path_36.close();

            return path_36;
          },
          // % Circle 14
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(282.9, 172.5, 347.1, 255.2);
              const gradAngle = 1.7824259919471855;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 13,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_37 = Path();
            path_37.moveTo(size.width * 0.8051914, size.height * 0.4364886);
            path_37.cubicTo(
                size.width * 0.8105343,
                size.height * 0.4178943,
                size.width * 0.8299086,
                size.height * 0.4071286,
                size.width * 0.8485171,
                size.height * 0.4124086);
            path_37.lineTo(size.width * 0.8665886, size.height * 0.4175343);
            path_37.cubicTo(
                size.width * 0.8949743,
                size.height * 0.4255886,
                size.width * 0.8953657,
                size.height * 0.4656800,
                size.width * 0.8671429,
                size.height * 0.4742857);
            path_37.lineTo(size.width * 0.8990743, size.height * 0.4676029);
            path_37.cubicTo(
                size.width * 0.9148057,
                size.height * 0.4643086,
                size.width * 0.9299057,
                size.height * 0.4754286,
                size.width * 0.9314286,
                size.height * 0.4914286);
            path_37.lineTo(size.width * 0.9302457, size.height * 0.5375200);
            path_37.cubicTo(
                size.width * 0.9300829,
                size.height * 0.5439171,
                size.width * 0.9292429,
                size.height * 0.5502800,
                size.width * 0.9277429,
                size.height * 0.5565000);
            path_37.lineTo(size.width * 0.9234714, size.height * 0.5741943);
            path_37.cubicTo(
                size.width * 0.9137029,
                size.height * 0.6146743,
                size.width * 0.8722257,
                size.height * 0.6389086,
                size.width * 0.8321629,
                size.height * 0.6275429);
            path_37.lineTo(size.width * 0.8196029, size.height * 0.6239771);
            path_37.cubicTo(
                size.width * 0.7857457,
                size.height * 0.6143714,
                size.width * 0.7669971,
                size.height * 0.5782086,
                size.width * 0.7786629,
                size.height * 0.5450029);
            path_37.cubicTo(
                size.width * 0.7804943,
                size.height * 0.5397857,
                size.width * 0.7816086,
                size.height * 0.5343457,
                size.width * 0.7819771,
                size.height * 0.5288286);
            path_37.lineTo(size.width * 0.7822857, size.height * 0.5242000);
            path_37.cubicTo(
                size.width * 0.7826629,
                size.height * 0.5185543,
                size.width * 0.7835429,
                size.height * 0.5129543,
                size.width * 0.7849143,
                size.height * 0.5074629);
            path_37.lineTo(size.width * 0.7857086, size.height * 0.5042857);
            path_37.lineTo(size.width * 0.8051914, size.height * 0.4364886);
            path_37.close();

            return path_37;
          },
          // % Circle 13
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(286.4, 152.0, 347.7, 238.5);
              const gradAngle = 1.7424259919471855;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 12,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_38 = Path();
            path_38.moveTo(size.width * 0.7814743, size.height * 0.4365914);
            path_38.cubicTo(
                size.width * 0.7806686,
                size.height * 0.4087343,
                size.width * 0.8030286,
                size.height * 0.3857143,
                size.width * 0.8308971,
                size.height * 0.3857143);
            path_38.lineTo(size.width * 0.8988743, size.height * 0.3857143);
            path_38.cubicTo(
                size.width * 0.9116886,
                size.height * 0.3857143,
                size.width * 0.9189914,
                size.height * 0.4003543,
                size.width * 0.9112857,
                size.height * 0.4105914);
            path_38.cubicTo(
                size.width * 0.9066114,
                size.height * 0.4167971,
                size.width * 0.9072429,
                size.height * 0.4255057,
                size.width * 0.9127657,
                size.height * 0.4309714);
            path_38.lineTo(size.width * 0.9184457, size.height * 0.4365943);
            path_38.cubicTo(
                size.width * 0.9197743,
                size.height * 0.4379086,
                size.width * 0.9209486,
                size.height * 0.4393686,
                size.width * 0.9219457,
                size.height * 0.4409486);
            path_38.lineTo(size.width * 0.9229600, size.height * 0.4425543);
            path_38.cubicTo(
                size.width * 0.9266429,
                size.height * 0.4483771,
                size.width * 0.9288114,
                size.height * 0.4550286,
                size.width * 0.9292686,
                size.height * 0.4619057);
            path_38.lineTo(size.width * 0.9314286, size.height * 0.4942857);
            path_38.lineTo(size.width * 0.9311857, size.height * 0.5095457);
            path_38.cubicTo(
                size.width * 0.9305343,
                size.height * 0.5502229,
                size.width * 0.8973743,
                size.height * 0.5828571,
                size.width * 0.8566914,
                size.height * 0.5828571);
            path_38.cubicTo(
                size.width * 0.8147000,
                size.height * 0.5828571,
                size.width * 0.7810057,
                size.height * 0.5481714,
                size.width * 0.7822229,
                size.height * 0.5061971);
            path_38.lineTo(size.width * 0.7828571, size.height * 0.4842857);
            path_38.lineTo(size.width * 0.7814743, size.height * 0.4365914);
            path_38.close();

            return path_38;
          },
          // % Circle 12
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(291.5, 144.0, 347.7, 217.6);
              const gradAngle = 1.5375783963102064;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 11,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_39 = Path();
            path_39.moveTo(size.width * 0.7628829, size.height * 0.3688771);
            path_39.cubicTo(
                size.width * 0.7604829,
                size.height * 0.3574371,
                size.width * 0.7676371,
                size.height * 0.3461657,
                size.width * 0.7790057,
                size.height * 0.3434629);
            path_39.lineTo(size.width * 0.8690886, size.height * 0.3220543);
            path_39.cubicTo(
                size.width * 0.8753714,
                size.height * 0.3205600,
                size.width * 0.8789457,
                size.height * 0.3289714,
                size.width * 0.8735143,
                size.height * 0.3324657);
            path_39.cubicTo(
                size.width * 0.8695571,
                size.height * 0.3350114,
                size.width * 0.8701714,
                size.height * 0.3409771,
                size.width * 0.8745657,
                size.height * 0.3426543);
            path_39.lineTo(size.width * 0.8959657, size.height * 0.3508257);
            path_39.cubicTo(
                size.width * 0.9013343,
                size.height * 0.3528743,
                size.width * 0.9053371,
                size.height * 0.3574571,
                size.width * 0.9066457,
                size.height * 0.3630543);
            path_39.lineTo(size.width * 0.9134914, size.height * 0.3923229);
            path_39.cubicTo(
                size.width * 0.9140029,
                size.height * 0.3945143,
                size.width * 0.9152714,
                size.height * 0.3964543,
                size.width * 0.9170714,
                size.height * 0.3978029);
            path_39.cubicTo(
                size.width * 0.9189543,
                size.height * 0.3992171,
                size.width * 0.9202543,
                size.height * 0.4012771,
                size.width * 0.9207171,
                size.height * 0.4035886);
            path_39.lineTo(size.width * 0.9228543, size.height * 0.4142857);
            path_39.lineTo(size.width * 0.9242829, size.height * 0.4228571);
            path_39.lineTo(size.width * 0.9271400, size.height * 0.4371429);
            path_39.lineTo(size.width * 0.9280829, size.height * 0.4413200);
            path_39.cubicTo(
                size.width * 0.9370800,
                size.height * 0.4812886,
                size.width * 0.9122457,
                size.height * 0.5210800,
                size.width * 0.8723857,
                size.height * 0.5305543);
            path_39.lineTo(size.width * 0.8698286, size.height * 0.5311600);
            path_39.cubicTo(
                size.width * 0.8316571,
                size.height * 0.5402343,
                size.width * 0.7932571,
                size.height * 0.5171086,
                size.width * 0.7834257,
                size.height * 0.4791257);
            path_39.lineTo(size.width * 0.7831000, size.height * 0.4778629);
            path_39.cubicTo(
                size.width * 0.7817886,
                size.height * 0.4727971,
                size.width * 0.7811257,
                size.height * 0.4675829,
                size.width * 0.7811257,
                size.height * 0.4623486);
            path_39.cubicTo(
                size.width * 0.7811286,
                size.height * 0.4580771,
                size.width * 0.7806857,
                size.height * 0.4538200,
                size.width * 0.7798114,
                size.height * 0.4496400);
            path_39.lineTo(size.width * 0.7628829, size.height * 0.3688771);
            path_39.close();

            return path_39;
          },
          // % Circle 11
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              const gradAngle = 1.3375783963102064;
              final rect = Rect.fromLTRB(283.9, 119.7, 349.9, 201.7);
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 10,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_40 = Path();

            path_40.moveTo(size.width * 0.7520486, size.height * 0.3511371);
            path_40.cubicTo(
                size.width * 0.7484771,
                size.height * 0.3304971,
                size.width * 0.7614743,
                size.height * 0.3106000,
                size.width * 0.7818057,
                size.height * 0.3055743);
            path_40.lineTo(size.width * 0.8523886, size.height * 0.2881257);
            path_40.cubicTo(
                size.width * 0.8647829,
                size.height * 0.2850614,
                size.width * 0.8742000,
                size.height * 0.2991857,
                size.width * 0.8666200,
                size.height * 0.3094600);
            path_40.lineTo(size.width * 0.8519600, size.height * 0.3293286);
            path_40.cubicTo(
                size.width * 0.8483600,
                size.height * 0.3342086,
                size.width * 0.8532600,
                size.height * 0.3407943,
                size.width * 0.8589629,
                size.height * 0.3387429);
            path_40.lineTo(size.width * 0.8815600, size.height * 0.3306171);
            path_40.cubicTo(
                size.width * 0.8840914,
                size.height * 0.3297057,
                size.width * 0.8859257,
                size.height * 0.3330629,
                size.width * 0.8837943,
                size.height * 0.3347057);
            path_40.cubicTo(
                size.width * 0.8822429,
                size.height * 0.3359029,
                size.width * 0.8799971,
                size.height * 0.3347971,
                size.width * 0.8799971,
                size.height * 0.3328400);
            path_40.lineTo(size.width * 0.8799971, size.height * 0.3311571);
            path_40.cubicTo(
                size.width * 0.8799971,
                size.height * 0.3292714,
                size.width * 0.8816257,
                size.height * 0.3277971,
                size.width * 0.8835029,
                size.height * 0.3279857);
            path_40.lineTo(size.width * 0.8895343, size.height * 0.3285886);
            path_40.cubicTo(
                size.width * 0.8924914,
                size.height * 0.3288829,
                size.width * 0.8950886,
                size.height * 0.3306743,
                size.width * 0.8964171,
                size.height * 0.3333314);
            path_40.lineTo(size.width * 0.8985686, size.height * 0.3376343);
            path_40.cubicTo(
                size.width * 0.9033257,
                size.height * 0.3471457,
                size.width * 0.9074000,
                size.height * 0.3569829,
                size.width * 0.9107629,
                size.height * 0.3670743);
            path_40.lineTo(size.width * 0.9114257, size.height * 0.3690629);
            path_40.lineTo(size.width * 0.9185686, size.height * 0.3933486);
            path_40.lineTo(size.width * 0.9192371, size.height * 0.3962771);
            path_40.cubicTo(
                size.width * 0.9281714,
                size.height * 0.4354943,
                size.width * 0.9036686,
                size.height * 0.4747571,
                size.width * 0.8646200,
                size.height * 0.4844114);
            path_40.cubicTo(
                size.width * 0.8249514,
                size.height * 0.4942171,
                size.width * 0.7846057,
                size.height * 0.4696371,
                size.width * 0.7755971,
                size.height * 0.4297771);
            path_40.lineTo(size.width * 0.7753286, size.height * 0.4285886);
            path_40.cubicTo(
                size.width * 0.7736914,
                size.height * 0.4213371,
                size.width * 0.7708371,
                size.height * 0.4144171,
                size.width * 0.7668886,
                size.height * 0.4081229);
            path_40.cubicTo(
                size.width * 0.7623429,
                size.height * 0.4008714,
                size.width * 0.7592514,
                size.height * 0.3928029,
                size.width * 0.7577943,
                size.height * 0.3843657);
            path_40.lineTo(size.width * 0.7520486, size.height * 0.3511371);
            path_40.close();

            return path_40;
          },
          // % Circle 10
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(279.4, 106.4, 346.5, 184.5);
              const gradAngle = 1.1375783963102064;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),
        PathId(
          isInteractable: true,
          indexIdentifier: 9,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_41 = Path();
            path_41.moveTo(size.width * 0.7109657, size.height * 0.3353629);
            path_41.cubicTo(
                size.width * 0.7012914,
                size.height * 0.3232286,
                size.width * 0.7076714,
                size.height * 0.3051314,
                size.width * 0.7228114,
                size.height * 0.3017629);
            path_41.lineTo(size.width * 0.7558114, size.height * 0.2944171);
            path_41.cubicTo(
                size.width * 0.7613057,
                size.height * 0.2931943,
                size.width * 0.7662457,
                size.height * 0.2902000,
                size.width * 0.7698771,
                size.height * 0.2858943);
            path_41.lineTo(size.width * 0.7952371, size.height * 0.2558083);
            path_41.cubicTo(
                size.width * 0.8028171,
                size.height * 0.2468189,
                size.width * 0.8174571,
                size.height * 0.2525526,
                size.width * 0.8169314,
                size.height * 0.2643031);
            path_41.lineTo(size.width * 0.8168714, size.height * 0.2655983);
            path_41.cubicTo(
                size.width * 0.8164200,
                size.height * 0.2756694,
                size.width * 0.8280200,
                size.height * 0.2815806,
                size.width * 0.8358857,
                size.height * 0.2752874);
            path_41.cubicTo(
                size.width * 0.8406371,
                size.height * 0.2714871,
                size.width * 0.8474971,
                size.height * 0.2719546,
                size.width * 0.8516857,
                size.height * 0.2763637);
            path_41.lineTo(size.width * 0.8694600, size.height * 0.2950743);
            path_41.cubicTo(
                size.width * 0.8707686,
                size.height * 0.2964514,
                size.width * 0.8719771,
                size.height * 0.2979200,
                size.width * 0.8730771,
                size.height * 0.2994686);
            path_41.lineTo(size.width * 0.8857000, size.height * 0.3172714);
            path_41.lineTo(size.width * 0.8882286, size.height * 0.3206400);
            path_41.cubicTo(
                size.width * 0.9134229,
                size.height * 0.3542114,
                size.width * 0.9063029,
                size.height * 0.4019543,
                size.width * 0.8724057,
                size.height * 0.4267171);
            path_41.lineTo(size.width * 0.8661714, size.height * 0.4312714);
            path_41.cubicTo(
                size.width * 0.8350943,
                size.height * 0.4539714,
                size.width * 0.7914200,
                size.height * 0.4462571,
                size.width * 0.7699971,
                size.height * 0.4142857);
            path_41.lineTo(size.width * 0.7671686, size.height * 0.4095686);
            path_41.cubicTo(
                size.width * 0.7633457,
                size.height * 0.4031971,
                size.width * 0.7590371,
                size.height * 0.3971343,
                size.width * 0.7542829,
                size.height * 0.3914286);
            path_41.lineTo(size.width * 0.7485686, size.height * 0.3855343);
            path_41.lineTo(size.width * 0.7423543, size.height * 0.3805543);
            path_41.cubicTo(
                size.width * 0.7417686,
                size.height * 0.3800857,
                size.width * 0.7414429,
                size.height * 0.3793657,
                size.width * 0.7414800,
                size.height * 0.3786143);
            path_41.lineTo(size.width * 0.7420171, size.height * 0.3674229);
            path_41.cubicTo(
                size.width * 0.7421029,
                size.height * 0.3656743,
                size.width * 0.7395714,
                size.height * 0.3653457,
                size.width * 0.7392057,
                size.height * 0.3670571);
            path_41.cubicTo(
                size.width * 0.7389543,
                size.height * 0.3682343,
                size.width * 0.7374514,
                size.height * 0.3685886,
                size.width * 0.7367029,
                size.height * 0.3676486);
            path_41.lineTo(size.width * 0.7109657, size.height * 0.3353629);
            path_41.close();

            return path_41;
          },
          // % Circle 09
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(261.8, 92.1, 341.0, 169.5);
              const gradAngle = 7.2375783963102064;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),
        // //

        PathId(
          isInteractable: true,
          indexIdentifier: 8,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_42 = Path();
            path_42.moveTo(size.width * 0.6869829, size.height * 0.3423571);
            path_42.cubicTo(
                size.width * 0.6740943,
                size.height * 0.3334714,
                size.width * 0.6699543,
                size.height * 0.3162914,
                size.width * 0.6773800,
                size.height * 0.3025029);
            path_42.lineTo(size.width * 0.7238657, size.height * 0.2162003);
            path_42.cubicTo(
                size.width * 0.7274686,
                size.height * 0.2095089,
                size.width * 0.7376229,
                size.height * 0.2122171,
                size.width * 0.7374343,
                size.height * 0.2198191);
            path_42.cubicTo(
                size.width * 0.7373000,
                size.height * 0.2251709,
                size.width * 0.7428171,
                size.height * 0.2288091,
                size.width * 0.7476714,
                size.height * 0.2265691);
            path_42.lineTo(size.width * 0.7522143, size.height * 0.2244720);
            path_42.cubicTo(
                size.width * 0.7544714,
                size.height * 0.2234306,
                size.width * 0.7570286,
                size.height * 0.2232389,
                size.width * 0.7594171,
                size.height * 0.2239317);
            path_42.lineTo(size.width * 0.7859629, size.height * 0.2316389);
            path_42.cubicTo(
                size.width * 0.7952514,
                size.height * 0.2343357,
                size.width * 0.8040114,
                size.height * 0.2386106,
                size.width * 0.8118571,
                size.height * 0.2442769);
            path_42.lineTo(size.width * 0.8216743, size.height * 0.2513671);
            path_42.cubicTo(
                size.width * 0.8243571,
                size.height * 0.2533051,
                size.width * 0.8267857,
                size.height * 0.2555729,
                size.width * 0.8289057,
                size.height * 0.2581166);
            path_42.cubicTo(
                size.width * 0.8315257,
                size.height * 0.2612580,
                size.width * 0.8346114,
                size.height * 0.2639743,
                size.width * 0.8380600,
                size.height * 0.2661691);
            path_42.lineTo(size.width * 0.8438343, size.height * 0.2698434);
            path_42.cubicTo(
                size.width * 0.8768971,
                size.height * 0.2908886,
                size.width * 0.8881114,
                size.height * 0.3339400,
                size.width * 0.8695200,
                size.height * 0.3684571);
            path_42.cubicTo(
                size.width * 0.8479543,
                size.height * 0.4084943,
                size.width * 0.7959686,
                size.height * 0.4200971,
                size.width * 0.7594343,
                size.height * 0.3930257);
            path_42.lineTo(size.width * 0.7457143, size.height * 0.3828571);
            path_42.lineTo(size.width * 0.6869829, size.height * 0.3423571);
            path_42.close();
            return path_42;
          },

          // % Circle 08
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(250.1, 78.2, 331.6, 156.8);
              const gradAngle = .756784384221419;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(gradAngle),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        //

        PathId(
          isInteractable: true,
          indexIdentifier: 7,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_43 = Path();
            path_43.moveTo(size.width * 0.7783343, size.height * 0.2249020);
            path_43.cubicTo(
                size.width * 0.8191200,
                size.height * 0.2376000,
                size.width * 0.8423143,
                size.height * 0.2812554,
                size.width * 0.8293714,
                size.height * 0.3219657);
            path_43.lineTo(size.width * 0.8272000, size.height * 0.3288000);
            path_43.cubicTo(
                size.width * 0.8151857,
                size.height * 0.3665886,
                size.width * 0.7742371,
                size.height * 0.3868486,
                size.width * 0.7369057,
                size.height * 0.3734743);
            path_43.lineTo(size.width * 0.7083571, size.height * 0.3617371);
            path_43.lineTo(size.width * 0.6400086, size.height * 0.3437914);
            path_43.cubicTo(
                size.width * 0.6259257,
                size.height * 0.3400943,
                size.width * 0.6178114,
                size.height * 0.3253429,
                size.width * 0.6222200,
                size.height * 0.3114686);
            path_43.lineTo(size.width * 0.6472400, size.height * 0.2327700);
            path_43.cubicTo(
                size.width * 0.6503457,
                size.height * 0.2230017,
                size.width * 0.6646400,
                size.height * 0.2246714,
                size.width * 0.6654286,
                size.height * 0.2348946);
            path_43.cubicTo(
                size.width * 0.6656114,
                size.height * 0.2372569,
                size.width * 0.6666829,
                size.height * 0.2394623,
                size.width * 0.6684314,
                size.height * 0.2410631);
            path_43.lineTo(size.width * 0.6688657, size.height * 0.2414629);
            path_43.cubicTo(
                size.width * 0.6761943,
                size.height * 0.2481800,
                size.width * 0.6879314,
                size.height * 0.2423023,
                size.width * 0.6869429,
                size.height * 0.2324109);
            path_43.lineTo(size.width * 0.6858686, size.height * 0.2216531);
            path_43.cubicTo(
                size.width * 0.6849286,
                size.height * 0.2122523,
                size.width * 0.6928229,
                size.height * 0.2043509,
                size.width * 0.7022200,
                size.height * 0.2052903);
            path_43.lineTo(size.width * 0.7244971, size.height * 0.2075183);
            path_43.cubicTo(
                size.width * 0.7261000,
                size.height * 0.2076786,
                size.width * 0.7276914,
                size.height * 0.2079554,
                size.width * 0.7292571,
                size.height * 0.2083466);
            path_43.lineTo(size.width * 0.7497629, size.height * 0.2134734);
            path_43.lineTo(size.width * 0.7583343, size.height * 0.2163306);
            path_43.lineTo(size.width * 0.7783343, size.height * 0.2249020);
            path_43.close();

            return path_43;
          },
          // % Circle 07
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(230.7, 76.3, 314.5, 144.4);
              const gradAngle = 0.412306044454415045;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                  tileMode: TileMode.decal,
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 6,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_44 = Path();
            path_44.moveTo(size.width * 0.6971429, size.height * 0.2042857);
            path_44.cubicTo(
                size.width * 0.7379371,
                size.height * 0.2035011,
                size.width * 0.7714286,
                size.height * 0.2363551,
                size.width * 0.7714286,
                size.height * 0.2771566);
            path_44.lineTo(size.width * 0.7714286, size.height * 0.3002057);
            path_44.cubicTo(
                size.width * 0.7714286,
                size.height * 0.3334314,
                size.width * 0.7448686,
                size.height * 0.3605657,
                size.width * 0.7116486,
                size.height * 0.3612714);
            path_44.cubicTo(
                size.width * 0.7067571,
                size.height * 0.3613771,
                size.width * 0.7018714,
                size.height * 0.3608914,
                size.width * 0.6970971,
                size.height * 0.3598314);
            path_44.lineTo(size.width * 0.6914286, size.height * 0.3585714);
            path_44.lineTo(size.width * 0.6771429, size.height * 0.3571429);
            path_44.cubicTo(
                size.width * 0.6714371,
                size.height * 0.3571429,
                size.width * 0.6657429,
                size.height * 0.3576143,
                size.width * 0.6601171,
                size.height * 0.3585514);
            path_44.lineTo(size.width * 0.6521371, size.height * 0.3598829);
            path_44.cubicTo(
                size.width * 0.6516657,
                size.height * 0.3599600,
                size.width * 0.6512000,
                size.height * 0.3600771,
                size.width * 0.6507457,
                size.height * 0.3602286);
            path_44.lineTo(size.width * 0.6490743, size.height * 0.3607857);
            path_44.cubicTo(
                size.width * 0.6478371,
                size.height * 0.3611971,
                size.width * 0.6464886,
                size.height * 0.3611000,
                size.width * 0.6453229,
                size.height * 0.3605200);
            path_44.lineTo(size.width * 0.6444571, size.height * 0.3600857);
            path_44.cubicTo(
                size.width * 0.6443429,
                size.height * 0.3600286,
                size.width * 0.6442200,
                size.height * 0.3600000,
                size.width * 0.6440943,
                size.height * 0.3600000);
            path_44.lineTo(size.width * 0.6439286, size.height * 0.3600000);
            path_44.cubicTo(
                size.width * 0.6431800,
                size.height * 0.3600000,
                size.width * 0.6428857,
                size.height * 0.3609714,
                size.width * 0.6435086,
                size.height * 0.3613886);
            path_44.cubicTo(
                size.width * 0.6441429,
                size.height * 0.3618086,
                size.width * 0.6438257,
                size.height * 0.3627971,
                size.width * 0.6430657,
                size.height * 0.3627743);
            path_44.lineTo(size.width * 0.5741171, size.height * 0.3606200);
            path_44.cubicTo(
                size.width * 0.5630657,
                size.height * 0.3602743,
                size.width * 0.5542857,
                size.height * 0.3512143,
                size.width * 0.5542857,
                size.height * 0.3401571);
            path_44.lineTo(size.width * 0.5542857, size.height * 0.2626697);
            path_44.cubicTo(
                size.width * 0.5542857,
                size.height * 0.2422886,
                size.width * 0.5797143,
                size.height * 0.2329943,
                size.width * 0.5928571,
                size.height * 0.2485714);
            path_44.cubicTo(
                size.width * 0.5998057,
                size.height * 0.2551123,
                size.width * 0.6109743,
                size.height * 0.2484349,
                size.width * 0.6085000,
                size.height * 0.2392174);
            path_44.lineTo(size.width * 0.6050829, size.height * 0.2264803);
            path_44.cubicTo(
                size.width * 0.6031057,
                size.height * 0.2191034,
                size.width * 0.6077714,
                size.height * 0.2115889,
                size.width * 0.6152600,
                size.height * 0.2100909);
            path_44.lineTo(size.width * 0.6371429, size.height * 0.2057143);
            path_44.lineTo(size.width * 0.6457143, size.height * 0.2042857);
            path_44.lineTo(size.width * 0.6685714, size.height * 0.2028571);
            path_44.lineTo(size.width * 0.6771429, size.height * 0.2028571);
            path_44.lineTo(size.width * 0.6971429, size.height * 0.2042857);
            path_44.close();

            return path_44;
          },
          // % Circle 06
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(206.9, 75.7, 288.0, 135.5);
              const gradAngle = 0.14748032179352083;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    0,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 5,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_46 = Path();
            path_46.moveTo(size.width * 0.6200000, size.height * 0.2085714);
            path_46.cubicTo(
                size.width * 0.6577457,
                size.height * 0.1951554,
                size.width * 0.6992514,
                size.height * 0.2144391,
                size.width * 0.7133400,
                size.height * 0.2519386);
            path_46.lineTo(size.width * 0.7147886, size.height * 0.2557891);
            path_46.cubicTo(
                size.width * 0.7302543,
                size.height * 0.2969514,
                size.width * 0.7085314,
                size.height * 0.3427771,
                size.width * 0.6668743,
                size.height * 0.3568571);
            path_46.lineTo(size.width * 0.6652057, size.height * 0.3574200);
            path_46.lineTo(size.width * 0.6539229, size.height * 0.3607914);
            path_46.cubicTo(
                size.width * 0.6437400,
                size.height * 0.3638343,
                size.width * 0.6338400,
                size.height * 0.3677600,
                size.width * 0.6243371,
                size.height * 0.3725200);
            path_46.lineTo(size.width * 0.6100543, size.height * 0.3782429);
            path_46.lineTo(size.width * 0.5876371, size.height * 0.3876943);
            path_46.cubicTo(
                size.width * 0.5630571,
                size.height * 0.3980571,
                size.width * 0.5348114,
                size.height * 0.3859114,
                size.width * 0.5254286,
                size.height * 0.3609400);
            path_46.lineTo(size.width * 0.5051829, size.height * 0.3070600);
            path_46.cubicTo(
                size.width * 0.4984514,
                size.height * 0.2891429,
                size.width * 0.5163000,
                size.height * 0.2717834,
                size.width * 0.5340029,
                size.height * 0.2790309);
            path_46.cubicTo(
                size.width * 0.5493686,
                size.height * 0.2853206,
                size.width * 0.5658829,
                size.height * 0.2728809,
                size.width * 0.5641000,
                size.height * 0.2563606);
            path_46.lineTo(size.width * 0.5639257, size.height * 0.2547606);
            path_46.lineTo(size.width * 0.5619457, size.height * 0.2456114);
            path_46.cubicTo(
                size.width * 0.5599600,
                size.height * 0.2364274,
                size.width * 0.5644514,
                size.height * 0.2270591,
                size.width * 0.5728543,
                size.height * 0.2228571);
            path_46.lineTo(size.width * 0.5885714, size.height * 0.2171429);
            path_46.lineTo(size.width * 0.6200000, size.height * 0.2085714);
            path_46.close();

            return path_46;
          },
          // % Circle 5
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(186.1, 72.9, 272.6, 148.6);
              // -1.511433
              const gradAngle = 5.8;
              // const gradAngle = 0.0;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.centerLeft,
                  // end: Alignment.centerRight,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 4,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_47 = Path();
            path_47.moveTo(size.width * 0.5500000, size.height * 0.2357146);
            path_47.cubicTo(
                size.width * 0.5795743,
                size.height * 0.2109471,
                size.width * 0.6238286,
                size.height * 0.2160900,
                size.width * 0.6469286,
                size.height * 0.2469786);
            path_47.lineTo(size.width * 0.6531086, size.height * 0.2552417);
            path_47.cubicTo(
                size.width * 0.6790714,
                size.height * 0.2899600,
                size.width * 0.6713314,
                size.height * 0.3393029,
                size.width * 0.6359857,
                size.height * 0.3644029);
            path_47.lineTo(size.width * 0.6278971, size.height * 0.3701457);
            path_47.lineTo(size.width * 0.6229314, size.height * 0.3740000);
            path_47.lineTo(size.width * 0.6100714, size.height * 0.3840086);
            path_47.lineTo(size.width * 0.6043400, size.height * 0.3897057);
            path_47.lineTo(size.width * 0.5774800, size.height * 0.4104229);
            path_47.cubicTo(
                size.width * 0.5648686,
                size.height * 0.4201514,
                size.width * 0.5467543,
                size.height * 0.4176743,
                size.width * 0.5372143,
                size.height * 0.4049200);
            path_47.lineTo(size.width * 0.4702543, size.height * 0.3153800);
            path_47.cubicTo(
                size.width * 0.4675057,
                size.height * 0.3117057,
                size.width * 0.4716914,
                size.height * 0.3068657,
                size.width * 0.4757143,
                size.height * 0.3090657);
            path_47.cubicTo(
                size.width * 0.4798600,
                size.height * 0.3113314,
                size.width * 0.4840686,
                size.height * 0.3061714,
                size.width * 0.4810257,
                size.height * 0.3025571);
            path_47.lineTo(size.width * 0.4806971, size.height * 0.3021686);
            path_47.cubicTo(
                size.width * 0.4794400,
                size.height * 0.3006743,
                size.width * 0.4793257,
                size.height * 0.2985257,
                size.width * 0.4804200,
                size.height * 0.2969057);
            path_47.lineTo(size.width * 0.4943486, size.height * 0.2762611);
            path_47.cubicTo(
                size.width * 0.4971343,
                size.height * 0.2721291,
                size.width * 0.5007200,
                size.height * 0.2685983,
                size.width * 0.5048943,
                size.height * 0.2658771);
            path_47.lineTo(size.width * 0.5314286, size.height * 0.2485717);
            path_47.lineTo(size.width * 0.5500000, size.height * 0.2357146);
            path_47.close();

            return path_47;
          },
          // % Circle 04
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(174.5, 78.8, 253.5, 156.9);
              const gradAngle = 2.633913204881018 + pi;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: false,
          indexIdentifier: 3,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_48 = Path();
            path_48.moveTo(size.width * 0.4807629, size.height * 0.2873800);
            path_48.cubicTo(
                size.width * 0.5059029,
                size.height * 0.2534014,
                size.width * 0.5529743,
                size.height * 0.2446231,
                size.width * 0.5886743,
                size.height * 0.2672543);
            path_48.lineTo(size.width * 0.5919114, size.height * 0.2693063);
            path_48.cubicTo(
                size.width * 0.6284771,
                size.height * 0.2924829,
                size.width * 0.6387914,
                size.height * 0.3412743,
                size.width * 0.6147371,
                size.height * 0.3772657);
            path_48.lineTo(size.width * 0.6116686, size.height * 0.3818543);
            path_48.cubicTo(
                size.width * 0.6100000,
                size.height * 0.3843514,
                size.width * 0.6080143,
                size.height * 0.3866200,
                size.width * 0.6057600,
                size.height * 0.3886029);
            path_48.cubicTo(
                size.width * 0.6000886,
                size.height * 0.3943143,
                size.width * 0.5950714,
                size.height * 0.4006457,
                size.width * 0.5908029,
                size.height * 0.4074743);
            path_48.lineTo(size.width * 0.5900829, size.height * 0.4086257);
            path_48.cubicTo(
                size.width * 0.5745971,
                size.height * 0.4393057,
                size.width * 0.5360800,
                size.height * 0.4499343,
                size.width * 0.5070600,
                size.height * 0.4315400);
            path_48.lineTo(size.width * 0.4498086, size.height * 0.3952486);
            path_48.cubicTo(
                size.width * 0.4370743,
                size.height * 0.3871743,
                size.width * 0.4317743,
                size.height * 0.3712400,
                size.width * 0.4371400,
                size.height * 0.3571429);
            path_48.cubicTo(
                size.width * 0.4437829,
                size.height * 0.3410143,
                size.width * 0.4523829,
                size.height * 0.3257657,
                size.width * 0.4627457,
                size.height * 0.3117429);
            path_48.lineTo(size.width * 0.4807629, size.height * 0.2873800);
            path_48.close();

            return path_48;
          },
          // % Circle 03

          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(161.2, 91.3, 238.5, 168.0);
              const gradAngle = 2.230356093992688 + pi;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(gradAngle),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 2,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_49 = Path();
            path_49.moveTo(size.width * 0.4425029, size.height * 0.3479771);
            path_49.cubicTo(
                size.width * 0.4608886,
                size.height * 0.3090771,
                size.width * 0.5069514,
                size.height * 0.2920086,
                size.width * 0.5462486,
                size.height * 0.3095314);
            path_49.cubicTo(
                size.width * 0.5859257,
                size.height * 0.3272257,
                size.width * 0.6039886,
                size.height * 0.3735971,
                size.width * 0.5867314,
                size.height * 0.4134686);
            path_49.lineTo(size.width * 0.5836771, size.height * 0.4205286);
            path_49.cubicTo(
                size.width * 0.5815543,
                size.height * 0.4254343,
                size.width * 0.5798857,
                size.height * 0.4305257,
                size.width * 0.5786971,
                size.height * 0.4357400);
            path_49.lineTo(size.width * 0.5766343, size.height * 0.4447886);
            path_49.cubicTo(
                size.width * 0.5754971,
                size.height * 0.4497714,
                size.width * 0.5737229,
                size.height * 0.4545829,
                size.width * 0.5713514,
                size.height * 0.4591057);
            path_49.lineTo(size.width * 0.5644400, size.height * 0.4722886);
            path_49.cubicTo(
                size.width * 0.5492257,
                size.height * 0.5013086,
                size.width * 0.5101600,
                size.height * 0.5070486,
                size.width * 0.4872143,
                size.height * 0.4836314);
            path_49.lineTo(size.width * 0.4667514, size.height * 0.4627486);
            path_49.cubicTo(
                size.width * 0.4648086,
                size.height * 0.4607657,
                size.width * 0.4618343,
                size.height * 0.4602114,
                size.width * 0.4593114,
                size.height * 0.4613600);
            path_49.cubicTo(
                size.width * 0.4523514,
                size.height * 0.4645286,
                size.width * 0.4464771,
                size.height * 0.4552800,
                size.width * 0.4523000,
                size.height * 0.4503229);
            path_49.lineTo(size.width * 0.4696457, size.height * 0.4355543);
            path_49.cubicTo(
                size.width * 0.4775514,
                size.height * 0.4288229,
                size.width * 0.4709000,
                size.height * 0.4160171,
                size.width * 0.4608486,
                size.height * 0.4186200);
            path_49.lineTo(size.width * 0.4197286, size.height * 0.4292743);
            path_49.cubicTo(
                size.width * 0.4195286,
                size.height * 0.4293257,
                size.width * 0.4194743,
                size.height * 0.4295857,
                size.width * 0.4196371,
                size.height * 0.4297143);
            path_49.cubicTo(
                size.width * 0.4197943,
                size.height * 0.4298371,
                size.width * 0.4200229,
                size.height * 0.4297400,
                size.width * 0.4200429,
                size.height * 0.4295400);
            path_49.lineTo(size.width * 0.4219457, size.height * 0.4087657);
            path_49.cubicTo(
                size.width * 0.4219943,
                size.height * 0.4082171,
                size.width * 0.4220829,
                size.height * 0.4076714,
                size.width * 0.4222114,
                size.height * 0.4071343);
            path_49.lineTo(size.width * 0.4277343, size.height * 0.3839429);
            path_49.lineTo(size.width * 0.4363086, size.height * 0.3610857);
            path_49.lineTo(size.width * 0.4425029, size.height * 0.3479771);
            path_49.close();

            return path_49;
          },
          // % Circle 02
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(156.6, 109.0, 225.5, 189.3);
              const gradAngle = 5.101275547868724;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(gradAngle),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 1,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_50 = Path();
            path_50.moveTo(size.width * 0.4200000, size.height * 0.4371429);
            path_50.cubicTo(
                size.width * 0.4200000,
                size.height * 0.3945371,
                size.width * 0.4545371,
                size.height * 0.3600000,
                size.width * 0.4971429,
                size.height * 0.3600000);
            path_50.cubicTo(
                size.width * 0.5397486,
                size.height * 0.3600000,
                size.width * 0.5742857,
                size.height * 0.3945371,
                size.width * 0.5742857,
                size.height * 0.4371429);
            path_50.lineTo(size.width * 0.5742857, size.height * 0.4942857);
            path_50.cubicTo(
                size.width * 0.5742857,
                size.height * 0.5368914,
                size.width * 0.5397486,
                size.height * 0.5714286,
                size.width * 0.4971429,
                size.height * 0.5714286);
            path_50.cubicTo(
                size.width * 0.4545371,
                size.height * 0.5714286,
                size.width * 0.4200000,
                size.height * 0.5368914,
                size.width * 0.4200000,
                size.height * 0.4942857);
            path_50.lineTo(size.width * 0.4200000, size.height * 0.4371429);
            path_50.close();
            return path_50;
          },
          // % Circle 01
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(156.8, 134.4, 214.4, 213.3);
              const gradAngle = 1.562885670464124 + pi;
              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  stops: gradient.stops,
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),
        //

        PathId(
          isInteractable: true,
          indexIdentifier: 0,
          circleType: Circles.spiralCircle,
          pathInformation: (Size size) {
            Path path_52 = Path();
            path_52.moveTo(size.width * 0.5714286, size.height * 0.4985714);
            path_52.cubicTo(
                size.width * 0.5714286,
                size.height * 0.5388086,
                size.width * 0.5388086,
                size.height * 0.5714286,
                size.width * 0.4985714,
                size.height * 0.5714286);
            path_52.cubicTo(
                size.width * 0.4583343,
                size.height * 0.5714286,
                size.width * 0.4257143,
                size.height * 0.5388086,
                size.width * 0.4257143,
                size.height * 0.4985714);
            path_52.cubicTo(
                size.width * 0.4257143,
                size.height * 0.4583343,
                size.width * 0.4583343,
                size.height * 0.4257143,
                size.width * 0.4985714,
                size.height * 0.4257143);
            path_52.cubicTo(
                size.width * 0.5388086,
                size.height * 0.4257143,
                size.width * 0.5714286,
                size.height * 0.4583343,
                size.width * 0.5714286,
                size.height * 0.4985714);
            path_52.close();
            return path_52;
          },

          // % Circle 00
          fillInformation: (
            Size size,
            Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>
                eitherGradOrColor,
          ) {
            late Paint paint_1_fill;
            eitherGradOrColor.fold((fill) {
              paint_1_fill = Paint()..style = PaintingStyle.fill;
              paint_1_fill.color = fill.fillColor;
            }, (gradient) {
              final rect = Rect.fromLTRB(158.9, 158.9, 213.3, 213.3);
              const gradAngle = 1.562 + pi;
              List<double> stops = [];
              double startValue = 0.0;

              for (int i = 0; i < gradient.gradientColors.length; i++) {
                stops.add(startValue);
                startValue += .25;
              }

              paint_1_fill = Paint()
                ..shader = LinearGradient(
                  colors: gradient.gradientColors,
                  // stops: List.filled(gradient.gradientColors.length, 0),
                  // stops: gradient.stops,
                  stops: stops,
                  transform: GradientRotation(
                    gradAngle,
                  ),
                ).createShader(rect);
            });
            return paint_1_fill;
          },
        ),

        PathId(
          isInteractable: true,
          indexIdentifier: 0,
          circleType: Circles.spiralCircleBorder,
          pathInformation: (Size size) {
            Path path_53 = Path();
            path_53.moveTo(size.width * 0.5771429, size.height * 0.4985714);
            path_53.cubicTo(
                size.width * 0.5771429,
                size.height * 0.5419657,
                size.width * 0.5419657,
                size.height * 0.5771429,
                size.width * 0.4985714,
                size.height * 0.5771429);
            path_53.cubicTo(
                size.width * 0.4551771,
                size.height * 0.5771429,
                size.width * 0.4200000,
                size.height * 0.5419657,
                size.width * 0.4200000,
                size.height * 0.4985714);
            path_53.cubicTo(
                size.width * 0.4200000,
                size.height * 0.4551771,
                size.width * 0.4551771,
                size.height * 0.4200000,
                size.width * 0.4985714,
                size.height * 0.4200000);
            path_53.cubicTo(
                size.width * 0.5419657,
                size.height * 0.4200000,
                size.width * 0.5771429,
                size.height * 0.4551771,
                size.width * 0.5771429,
                size.height * 0.4985714);
            path_53.close();
            path_53.moveTo(size.width * 0.4257143, size.height * 0.4985714);
            path_53.cubicTo(
                size.width * 0.4257143,
                size.height * 0.5388086,
                size.width * 0.4583343,
                size.height * 0.5714286,
                size.width * 0.4985714,
                size.height * 0.5714286);
            path_53.cubicTo(
                size.width * 0.5388086,
                size.height * 0.5714286,
                size.width * 0.5714286,
                size.height * 0.5388086,
                size.width * 0.5714286,
                size.height * 0.4985714);
            path_53.cubicTo(
                size.width * 0.5714286,
                size.height * 0.4583343,
                size.width * 0.5388086,
                size.height * 0.4257143,
                size.width * 0.4985714,
                size.height * 0.4257143);
            path_53.cubicTo(
                size.width * 0.4583343,
                size.height * 0.4257143,
                size.width * 0.4257143,
                size.height * 0.4583343,
                size.width * 0.4257143,
                size.height * 0.4985714);
            path_53.close();
            return path_53;
          },
          // % Circle 00 Border
          fillInformation: (Size size) {
            final rect = Rect.fromLTRB(156.8, 156.8, 215.5, 215.5);
            Paint paint_53_fill = Paint()..style = PaintingStyle.fill;
            paint_53_fill.color = Colors.white.withOpacity(1.0);
            return paint_53_fill;
          },
        ),
      ];
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/p2p_scheduling_canvas_entity.dart';

class SpiralColors {
  static Map<String,
          Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>>
      get timeColorsMapping => {
// ✅

            "00:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x00010134).withOpacity(1),
                  // Color.fromARGB(0, 43, 43, 255).withOpacity(1),
                ],
                stops: [
                  .6028,
                  1,
                ],
              ),
            ),

//

            "00:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x000E213F).withOpacity(1),
                  const Color(0x00102547).withOpacity(1),
                  // Color.fromARGB(0, 24, 255, 28).withOpacity(1),
                  // Color(0x00102547).withOpacity(1),
                ],
                stops: [
                  .65,
                  1,
                ],
              ),
            ),

//

            "01:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x00173767).withOpacity(1),
                  // Color.fromARGB(0, 0, 102, 255).withOpacity(1),
                ],
                stops: [.65, 1],
              ),
            ),

//

            "01:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x001C427C).withOpacity(1),
                ],
                stops: [
                  .63,
                  1,
                ],
              ),
            ),

//

            "02:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00173767).withOpacity(1),
                  const Color(0x001C427C).withOpacity(1),
                ],
                stops: [
                  .85,
                  1,
                ],
              ),
            ),

//

            "02:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x00214793).withOpacity(1),
                ],
                stops: [.75, 1],
              ),
            ),

//

            "03:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color.fromRGBO(45, 95, 195, 0).withOpacity(1),
                  // Color.fromARGB(0, 0, 255, 21).withOpacity(1),
                ],
                stops: [
                  .6519,
                  1,
                ],
              ),
            ),

//

            "03:30": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00162767).withOpacity(1),
                const Color(0x002A51B6).withOpacity(1),
                // Color.fromARGB(0, 71, 243, 14).withOpacity(1),
              ], stops: [
                .703,
                1,
              ]),
            ),

//

            "04:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00152667).withOpacity(1),
                const Color(0x001030A9).withOpacity(1)
              ], stops: [
                .5503,
                1,
              ]),
            ),

//

            "04:30": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x001A2C71).withOpacity(1),
                const Color(0x000335F3).withOpacity(1),
                // Color.fromARGB(0, 0, 255, 64).withOpacity(1),
              ], stops: [
                .742,
                1,
              ]),
            ),

//

            "05:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00102FA9).withOpacity(1),
                const Color(0x000633DF).withOpacity(1),
                const Color(0x00366FF8).withOpacity(1),
              ], stops: [
                .6222,
                .8222,
                1
              ]),
            ),

//

            "05:30": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00102FA9).withOpacity(1),
                const Color(0x000633E0).withOpacity(1),
                const Color(0x0091D1EB).withOpacity(1),
              ], stops: [
                .5652,
                .7998,
                1,
              ]),
            ),

//

            "06:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00102FA9).withOpacity(1),
                const Color(0x000533E4).withOpacity(1),
                const Color(0x0091D1EB).withOpacity(1),
              ], stops: [
                .3,
                .77,
                1,
              ]),
            ),

//

            "06:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00102FA9).withOpacity(1),
                  const Color(0x000434EB).withOpacity(1),
                  const Color(0x00619DF1).withOpacity(1),
                  const Color(0x0091D1EB).withOpacity(1),
                ],
                stops: [
                  .4,
                  .55,
                  .8,
                  1,
                ],
              ),
            ),

//

            "07:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x003972F7).withOpacity(1),
                const Color(0x007CBAED).withOpacity(1),
                const Color(0x0090D0EA).withOpacity(1),
              ], stops: [
                .5113,
                .9098,
                1,
              ]),
            ),

//

            "07:30": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x003972F7).withOpacity(1),
                const Color(0x007CBAED).withOpacity(1),
                const Color(0x0090D0EA).withOpacity(1),
                const Color(0x00FA8607).withOpacity(1),
              ], stops: [
                .3135,
                .6545,
                .8031,
                1,
              ]),
            ),

//

            "08:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x007CBAED).withOpacity(1),
                  const Color(0x0090D0EA).withOpacity(1),
                  const Color(0x00FA8607).withOpacity(1),
                ],
                stops: [
                  .2419,
                  .4737,
                  .663,
                  1.0357,
                ],
              ),
            ),

//

            "08:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0090D0EB).withOpacity(1),
                  const Color(0x00D5AB66).withOpacity(1),
                  const Color(0x00FB971C).withOpacity(1),
                ],
                stops: [0.1, .4737, .753, .9],
              ),
            ),

//

            "09:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x003972F7).withOpacity(1),
                  const Color(0x0090D0EB).withOpacity(1),
                  const Color(0x00D5AB66).withOpacity(1),
                  const Color(0x00FB971C).withOpacity(1),
                ],
                stops: [0.1, .5537, .65, .9],
              ),
            ),

//

            "09:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FB9A1F).withOpacity(1),
                  const Color(0x00FEC247).withOpacity(1),
                ],
                stops: [
                  .514,
                  1,
                ],
              ),
            ),

//

            "10:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FA961B).withOpacity(1),
                  const Color(0x00FECC51).withOpacity(1),
                ],
                stops: [.4286, 1],
              ),
            ),

//

            "10:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFDD89).withOpacity(1),
                  const Color(0x00FFCE56).withOpacity(1),
                  const Color(0x00FEDE63).withOpacity(1),
                ],
                stops: [
                  .7,
                  .9,
                  1,
                ],
              ),
            ),

//

            "11:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FECD52).withOpacity(1),
                  const Color(0x00FFE469).withOpacity(1),
                ],
                stops: [
                  .61,
                  1,
                ],
              ),
            ),

//

            "11:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FECD52).withOpacity(1),
                  const Color(0x00FFF67C).withOpacity(1),
                  const Color(0x00FFF094).withOpacity(1),
                ],
                stops: [
                  .65,
                  .95,
                  1,
                ],
              ),
            ),

//

            "12:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFF801).withOpacity(1),
                  const Color(0x00FFEE17).withOpacity(1),
                ],
                stops: [
                  .8,
                  1,
                ],
              ),
            ),

//

            "12:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFEB2F).withOpacity(1),
                  const Color(0x00FFC13D).withOpacity(1),
                ],
                stops: [
                  .75608,
                  1,
                ],
              ),
            ),

//

            "13:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFE340).withOpacity(1),
                  const Color(0x00FF904E).withOpacity(1),
                ],
                stops: [
                  .7018,
                  1,
                ],
              ),
            ),

//✅

            "13:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FFE42F).withOpacity(1),
                  const Color(0x00FF9B49).withOpacity(1),
                  const Color(0x00FF8F4D).withOpacity(1),
                ],
                stops: [
                  .5824,
                  .6987,
                  .8232,
                ],
              ),
            ),

//✅

            "14:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00FFE430).withOpacity(1),
                const Color(0x00FFC53C).withOpacity(1),
                const Color(0x00FF904E).withOpacity(1),
                const Color(0x00FE7B2D).withOpacity(1),
              ], stops: [
                .2461,
                .6,
                .85,
                1
              ]),
            ),

//✅

            "14:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FEC333).withOpacity(1),
                  const Color(0x00FEAC35).withOpacity(1),
                  const Color(0x00FD8036).withOpacity(1),
                  const Color(0x00F74736).withOpacity(1),
                ],
                stops: [
                  .2461,
                  .6,
                  .75,
                  1,
                ],
              ),
            ),

//✅

            "15:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FF9934).withOpacity(1),
                  const Color(0x00FD8036).withOpacity(1),
                  const Color(0x00F85438).withOpacity(1),
                  const Color(0x00F8574C).withOpacity(1),
                ],
                stops: [
                  .2461,
                  .6,
                  .75,
                  1,
                ],
              ),
            ),

//

            "15:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FCDEBE).withOpacity(1),
                  const Color(0x00FE9B5B).withOpacity(1),
                  const Color(0x00FF742E).withOpacity(1),
                  const Color(0x00FC7F73).withOpacity(1),
                  const Color(0x00FE5064).withOpacity(1),
                ],
                stops: [.3, .45, .5, .75, 1],
              ),
            ),

//

            "16:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00FE9F62).withOpacity(1),
                const Color(0x00FD8574).withOpacity(1),
                const Color(0x00FE7848).withOpacity(1),
                const Color(0x00FE442F).withOpacity(1),
              ], stops: [
                .2461,
                .6,
                .75,
                1,
              ]),
            ),

//

            "16:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00FC7F77).withOpacity(1),
                  const Color(0x00FF742D).withOpacity(1),
                  const Color(0x00FF2543).withOpacity(1),
                  const Color(0x00E22D96).withOpacity(1),
                ],
                stops: [
                  .5761,
                  .7,
                  .85,
                  1,
                ],
              ),
            ),

//

            "17:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00FCDEBE).withOpacity(1),
                const Color(0x00FCA593).withOpacity(1),
                const Color(0x00FE445F).withOpacity(1),
                const Color(0x00EA2C7C).withOpacity(1),
                const Color(0x00DB3E9E).withOpacity(1),
                const Color(0x00B47CAB).withOpacity(1),
              ], stops: [
                .25,
                .40,
                .6,
                .7,
                .8,
                1,
              ]),
            ),

//

            "17:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00D935AE).withOpacity(1),
                  const Color(0x00BF37AB).withOpacity(1),
                  const Color(0x00903DA6).withOpacity(1),
                  const Color(0x0054449F).withOpacity(1),
                ],
                stops: [
                  .2461,
                  .6,
                  .75,
                  1,
                ],
              ),
            ),

//

            "18:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x007952AA).withOpacity(1),
                  const Color(0x00624BA4).withOpacity(1),
                  const Color(0x00353E9A).withOpacity(1),
                  const Color(0x00203895).withOpacity(1),
                ],
                stops: [
                  .2461,
                  .6,
                  .75,
                  1,
                ],
              ),
            ),

//

            "18:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x007952AA).withOpacity(1),
                  const Color(0x005E4AA3).withOpacity(1),
                  const Color(0x002A3B97).withOpacity(1),
                ],
                stops: [
                  .25,
                  .75,
                  1,
                ],
              ),
            ),

//

            "19:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x004B449F).withOpacity(1),
                const Color(0x00383F9A).withOpacity(1),
                const Color(0x00293895).withOpacity(1),
                // Color.fromARGB(0, 55, 149, 41).withOpacity(1),
              ], stops: [
                .35,
                .6,
                1,
              ]),
            ),

//

            "19:30": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00203895).withOpacity(1),
                const Color(0x00182A6D).withOpacity(1),
              ], stops: [
                .611,
                1
              ]),
            ),

//

            "20:00": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x004C459F).withOpacity(1),
                const Color(0x00152667).withOpacity(1),
                const Color(0x001C417B).withOpacity(1),
              ], stops: [
                .53,
                .68,
                1,
              ]),
            ),

//

            "20:30": Right(
              IndividualSpiralCircleGradient(gradientColors: [
                const Color(0x00162767).withOpacity(1),
                const Color(0x001B417B).withOpacity(1),
                // Color.fromARGB(0, 28, 255, 104).withOpacity(1),
              ], stops: [
                .6,
                1,
              ]),
            ),

//

            "21:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x001C417C).withOpacity(1),
                  // Color.fromARGB(0, 119, 255, 0).withOpacity(1),
                ],
                stops: [
                  .60875,
                  1,
                ],
              ),
            ),

//

            "21:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00162767).withOpacity(1),
                  const Color(0x001B3E79).withOpacity(1),
                  // Color.fromARGB(0, 0, 255, 64).withOpacity(1),
                ],
                stops: [
                  .5071,
                  1,
                ],
              ),
            ),

//

            "22:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x001C427C).withOpacity(1),
                  const Color(0x00173768).withOpacity(1),
                ],
                stops: [
                  .68,
                  1,
                ],
              ),
            ),

//

            "22:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00173767).withOpacity(1),
                  const Color(0x001B4079).withOpacity(1),
                  const Color(0x00142F58).withOpacity(1),
                ],
                stops: [
                  .7,
                  .85,
                  1,
                ],
              ),
            ),

//

            "23:00": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x00173767).withOpacity(1),
                  const Color(0x00102B56).withOpacity(1),
                ],
                stops: [
                  .65,
                  1,
                ],
              ),
            ),

//

            "23:30": Right(
              IndividualSpiralCircleGradient(
                gradientColors: [
                  const Color(0x0011274A).withOpacity(1),
                  const Color(0x000E213F).withOpacity(1),
                ],
                stops: [
                  .74,
                  1,
                ],
              ),
            ),
          };
}

              // Color.fromARGB(0, 227, 174, 0).withOpacity(1),
              // Color.fromARGB(0, 27, 123, 59).withOpacity(1),